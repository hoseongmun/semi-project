package movie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie.dao.MovieUserDAO;
import movie.dto.MovieUserDTO;


//@WebServlet("/members_servlet/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url=request.getRequestURI();
		String contextPath=request.getContextPath();
		MovieUserDAO dao = new MovieUserDAO();
		if(url.indexOf("login.do")!=-1) {
			String userid=request.getParameter("userid");
			String passwd=request.getParameter("passwd");
			MovieUserDTO dto=new MovieUserDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String name = dao.login(dto);
			if(name==null) { //로그인 실패
				String page=contextPath+"/movie/member_login.jsp?message=error";
				response.sendRedirect(page);
			}else { //로그인 성공
				HttpSession session=request.getSession();
				session.setAttribute("userid", userid);
				session.setAttribute("name", name);
				session.setAttribute("result", name+"님 환영합니다.");
				String page="/movie/member.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}else if(url.indexOf("logout.do")!=-1) {
			HttpSession session=request.getSession();
			session.invalidate();
			String page=contextPath+"/movie/member_login.jsp?message=logout";
			response.sendRedirect(page);
		}else if(url.indexOf("join.do")!= -1) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String email = request.getParameter("email");
			MovieUserDTO dto = new MovieUserDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setName(name);
			dto.setHp(hp);
			dto.setEmail(email);
			dao.insert(dto);	
			String page="/movie/member_login.jsp";
			response.sendRedirect(contextPath+page);			
		}
	}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
