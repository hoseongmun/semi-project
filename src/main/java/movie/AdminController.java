package movie;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import movie.dao.MovieAdminDAO;
import movie.dao.MovieSubDAO;
import movie.dto.MovieAdminDTO;
import movie.dto.MovieSubDTO;


//@WebServlet("/admin_servlet/*")
public class AdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		
		if(url.indexOf("login.do") != -1) {
			MovieAdminDAO dao = new MovieAdminDAO();
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			MovieAdminDTO dto = new MovieAdminDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String name = dao.login(dto);
			if(name == null) { //로그인 실패
				String page = contextPath+"/movie/admin_login.jsp?message=error";
				response.sendRedirect(page); //로그인 페이지로 이동
			}else { //로그인 성공
				HttpSession session = request.getSession();
				session.setAttribute("adminid", dto.getUserid());
				session.setAttribute("adminName", name);
				session.setAttribute("userid", userid);
				session.setAttribute("name", name);
				session.setAttribute("result", name+"님 환영합니다.");
				String page = "/movie/admin.jsp"; //로그인 성공 페이지로 이동
				RequestDispatcher rd = request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}else if(url.indexOf("logout.do") != -1) {
			HttpSession session = request.getSession();
			session.invalidate();
			String page = contextPath+"/movie/admin_login.jsp?message=logout";
			response.sendRedirect(page);
		}else if(url.indexOf("insert_sub.do")!=-1) {
			MovieSubDAO dao=new MovieSubDAO();
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			ServletContext application=request.getSession().getServletContext();
			String img_path=application.getRealPath("/movie/images/sub/");
			MultipartRequest multi=new MultipartRequest(request, img_path, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			String sub_name=multi.getParameter("sub_name");
			int price=Integer.parseInt(multi.getParameter("price"));
			String description=multi.getParameter("description");
			String filename=" ";
			try {
				Enumeration<String> files=multi.getFileNames();
				while(files.hasMoreElements()) {
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1); //첨부파일 이름
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			MovieSubDTO dto=new MovieSubDTO();
			dto.setSub_name(sub_name);
			dto.setPrice(price);
			dto.setDescription(description);
			if(filename==null || filename.trim().equals("")) {
				filename="-";
			}
			dto.setFilename(filename);
			dao.insert_sub(dto); 
			String page="/sub_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("edit.do")!=-1) {
			MovieSubDAO dao=new MovieSubDAO();
			//상품코드
			String sub_code=request.getParameter("sub_code");
			MovieSubDTO dto=dao.detail_sub(sub_code);
			request.setAttribute("dto",dto); //저장
			RequestDispatcher rd=request.getRequestDispatcher(contextPath+"/movie/sub_edit.jsp");
			rd.forward(request, response); //출력 페이지로 이동
		}else if(url.indexOf("update.do")!=-1) {
			MovieSubDAO dao=new MovieSubDAO();
			//배포 디렉토리에 이미지 업로드
			ServletContext application=request.getSession().getServletContext();
			String img_path=application.getRealPath(contextPath+"/images/sub/");
			//파일 첨부 기능이 추가된 객체
			MultipartRequest multi=new MultipartRequest(request, img_path, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			String sub_name=multi.getParameter("sub_name");
			int price=Integer.parseInt(multi.getParameter("price"));
			String description=multi.getParameter("description");
			String sub_code=multi.getParameter("sub_code");
			String filename=" ";			
			try {
				Enumeration<String> files=multi.getFileNames();
				while(files.hasMoreElements()) {
					String file1=(String)files.nextElement();
					filename=multi.getFilesystemName(file1); //첨부파일 이름
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			MovieSubDTO dto=new MovieSubDTO();
			dto.setSub_name(sub_name);
			dto.setPrice(price);
			dto.setDescription(description);
			dto.setSub_code(sub_code);
			if(filename==null || filename.trim().equals("")) { //새로운 첨부파일이 없을 때
				MovieSubDTO dto2=dao.detail_sub(sub_code); //기존 레코드 정보
				filename=dto2.getFilename();
				dto.setFilename(filename);
			}else { //새로운 첨부파일이 있을 때
				dto.setFilename(filename);
			}
			dao.update_sub(dto); //수정
			//목록으로 이동
			String page=contextPath+"/sub_servlet/list.do";
			response.sendRedirect(page);
		}else if(url.indexOf("delete.do")!=-1){
			MovieSubDAO dao=new MovieSubDAO();
			ServletContext sc=request.getSession().getServletContext();
			String img_path=sc.getRealPath(contextPath+"/images/sub/");
			MultipartRequest multi=new MultipartRequest(request, img_path, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			String sub_code=multi.getParameter("sub_code");//상품코드
			dao.delete_sub(sub_code);//삭제
			String page=contextPath+"/sub_servlet/list.do";
			response.sendRedirect(page);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
