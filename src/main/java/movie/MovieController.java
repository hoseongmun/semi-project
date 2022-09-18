package movie;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import movie.dao.MovieDAO;
import movie.dto.MovieCommentDTO;
import movie.dto.MovieDTO;
import page.Pager;


//@WebServlet("/movie_servlet/*")
public class MovieController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovieController() {
    	super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트에서 요청한 주소 처리
		String url=request.getRequestURL().toString();//getRequestURL()은 toString까지 더해야함.
		//컨택스트 패스
		String contextPath=request.getContextPath();
		//dao 인스턴스 생성
		MovieDAO dao=new MovieDAO();
		if(url.indexOf("main.do") != -1) {
			String page = "/movie/main.jsp";
			response.sendRedirect(contextPath+page);
			/*
			 * String page = "/movie/main.jsp"; RequestDispatcher
			 * rd=request.getRequestDispatcher(page); rd.forward(request, response)
			 */
		}else if(url.indexOf("list.do") != -1) {
			//레코드 갯수 계산
			int count=dao.count();
			//페이지 나누기를 위한 처리
			int curPage=1;
			//숫자 처리는 null포인트 익셉션이 잘 일어나기 때문에 if문 처리해주는게 좋다.
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			//System.out.println("list.do 호출");
			List<MovieDTO> list=dao.list(start,end);
			request.setAttribute("list", list);
			request.setAttribute("page", pager);
			String page="/movie/list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insert.do") != -1) {
			//파일업로드 처리
			MovieDTO dto = new MovieDTO();
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			//request를 확장시킨 MultipartRequest 생성
			//new MultipartRequest(request,"업로드디렉토리",제한용량,"인코딩",파일명중복방지처리옵션)
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String filename=" "; //공백 1개
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음요소가 있으면
				while (files.hasMoreElements()) {
					String file1 = (String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			//파일 첨부를 하지 않을 경우
			if(filename == null || filename.trim().equals("")) {
				filename="-";
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			
			dao.insert(dto);
			String page="/movie_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("download.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num").trim());
			String filename=dao.getFileName(num);
			System.out.println("첨부파일 이름 : " + filename);
			//업로드되었던 파일의 위치정보값을 path에 저장
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096]; //바이트배열 생성
			//업로드 폴더에 저장된 파일을 읽기 위한 스트림 생성
			FileInputStream fis=new FileInputStream(path);
			//mimeType: (파일의 종류-img, mp3, txt..등)
			String mimeType=getServletContext().getMimeType(path);
			//스트림 방식의 파일 다운로드시 한글 파일명 관련 브라우저 헤더 처리
			//octet-stream : 8비트로 된 일련의 데이터를 뜻하며 모든 종류의 이진데이터를 처리하겠다는 의미
			if(mimeType==null) {
				mimeType="application/octet-stream;charset=utf-8";
			}
			
			//스트링을 바이트배열로, 인코딩을 서유럽언어 형식으로 변경
			//new String(filename.getBytes("변환할인코딩"),"기본인코딩")
			filename = new String(filename.getBytes("utf-8"),"8859_1");
			//헤더 구성
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			//바디 구성
			ServletOutputStream out=response.getOutputStream();
			int len;
			while (true) {
				//파일을 버퍼 이용해 읽음
				len = fis.read(b, 0, b.length);
				if(len == -1) {
					break;//다읽으면 탈출
				}
				out.write(b, 0, len);//클라이언트에 전송
			}
			//파일 처리 관련 리소스 정리
			out.flush(); //출력버퍼 비우기
			out.close(); // 출력 스트림 닫기
			fis.close(); //입력 스트림 닫기
			dao.plusDown(num); //다운로드 횟수 증가
		}else if(url.indexOf("view.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num")); //글번호
			HttpSession session=request.getSession(); //세션 생성
			//조회수 증가 처리
			dao.plusReadCount(num, session);
			
			MovieDTO dto=dao.view(num);
			//request 영역에 저장
			request.setAttribute("dto", dto);
			//포워딩
			String page="/movie/view.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("comment_add.do") != -1) { //댓글 추가
			MovieCommentDTO dto=new MovieCommentDTO();
			int board_num=Integer.parseInt(request.getParameter("board_num"));
			String writer=request.getParameter("writer");
			String content=request.getParameter("content");
			dto.setBoard_num(board_num);
			dto.setWriter(writer);
			dto.setContent(content);
			dao.commentAdd(dto);
		}else if(url.indexOf("commentList.do") != -1) { //댓글 목록
			int num=Integer.parseInt(request.getParameter("num"));
			//System.out.println(num);
			List<MovieCommentDTO> list=dao.commentList(num);
			request.setAttribute("list", list);
			String page="/movie/list_comment.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("input_Reply.do") != -1) { //답변글 작성
			int num=Integer.parseInt(request.getParameter("num"));
			MovieDTO dto=dao.view(num);
			dto.setContent("===게시물의 내용===\n"+dto.getContent());
			request.setAttribute("dto", dto);
			String page="/movie/reply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insertReply.do") != -1) { //답변글 저장
			int num=0;
			if(request.getParameter("num") != null) {
				num = Integer.parseInt(request.getParameter("num"));
			}
			MovieDTO dto=dao.view(num); //부모글 내용
			int ref=dto.getRef(); //답변글 그룹
			int re_step=dto.getRe_step()+1; //답변글 순서
			int re_level=dto.getRe_level()+1; //답변 단계
			String writer=request.getParameter("writer");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String passwd=request.getParameter("passwd");
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_step(re_step);
			dto.setRe_level(re_level);
			//첨부파일 관련 정보
			dto.setFilename("-");
			dto.setFilesize(0);
			dto.setDown(0);
			//답글 순서 조정
			dao.update_Step(ref, re_step);
			//답글 쓰기
			dao.reply(dto);
			//목록으로 이동
			String page="/movie_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("check_pwd.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			String passwd=request.getParameter("passwd");
			String result=dao.ckeck_pwd(num, passwd);
			String page="";
			if(result != null) {//비밀번호가 맞으면
				page="/movie/edit.jsp"; //편집페이지로 이동
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//비밀번호가 틀리면 다시 view.do로 이동
				page=contextPath+"/movie_servlet/view.do?num="+num+"&message=error";
				response.sendRedirect(page);
			}
		}else if(url.indexOf("update.do") != -1) {
			MovieDTO dto = new MovieDTO();			
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			String filename="-";//공백 1개
			int filesize=0;
			try {
				Enumeration files=multi.getFileNames();
				while (files.hasMoreElements()) {
					String file1 = (String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}	
			String writer=multi.getParameter("writer");
			String subject=multi.getParameter("subject");
			String content=multi.getParameter("content");
			String passwd=multi.getParameter("passwd");
			String ip=request.getRemoteAddr();
			//글번호 넘기기
			int num=Integer.parseInt(multi.getParameter("num"));
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);		
			dto.setIp(ip);
			//파일삭제 체크박스 첨부파일삭제
			String delete_file=multi.getParameter("delete_file");
			if(delete_file != null && delete_file.equals("on")) {
				String filename2 = dao.getFileName(num);
				File f = new File(Constants.UPLOAD_PATH+filename2);
				f.delete();
				dto.setNum(num);
				dto.setWriter(writer);
				dto.setSubject(subject);
				dto.setContent(content);
				dto.setPasswd(passwd);
				//초기화
				dto.setFilename("-"); 
				dto.setFilesize(0);
				dto.setDown(0);
				dao.update(dto);
			}
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setIp(ip);
			//새로운 첨부파일 없을 때 기존 첨부파일 정보 확인
			if(filename == null || filename.trim().equals("")) {
				MovieDTO dto2=dao.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else {//새로운 첨부파일이 있으면
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			String result = dao.ckeck_pwd(num, passwd); //비밀번호 체크
			if(result != null) {
				dao.update(dto);
				String page = contextPath+"/movie_servlet/list.do";
				response.sendRedirect(page);
			} else {
				request.setAttribute("dto", dto);
				String page ="/movie/edit.jsp?pwd_error=y";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);				
			}
		}else if(url.indexOf("delete.do") != -1) {
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			String passwd = multi.getParameter("passwd");
			String result = dao.ckeck_pwd(num, passwd); //비밀번호 확인
			if(result != null) { //비밀번호 맞으면 삭제 후 이동
				dao.delete(num);
				String page = contextPath +"/movie_servlet/list.do";
				response.sendRedirect(page);
			} else { //비밀번호 틀리면 세부정보 저장 후 수정페이지로 이동
				request.setAttribute("dto", dao.view(num));
				String page = "/movie/edit.jsp?pwd_error=y";
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
			
		}else if(url.indexOf("search.do") != -1) {
			//검색옵션과 검색 키워드
			String search_option=request.getParameter("search_option");
			String keyword=request.getParameter("keyword");
			List<MovieDTO> list=dao.searchList(search_option, keyword);
			request.setAttribute("list", list);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			String page="/movie/search.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
