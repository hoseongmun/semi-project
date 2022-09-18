package movie;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieSubDAO;
import movie.dto.MovieSubDTO;


//@WebServlet("/sub_servlet/*")
public class SubController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url = request.getRequestURL().toString();
		String contextPath = request.getContextPath();
		MovieSubDAO dao = new MovieSubDAO();
		if(url.indexOf("list.do")!= -1) {
			List<MovieSubDTO> items = dao.sublist();
			request.setAttribute("list", items);
			String page = "/movie/sub_list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("detail.do")!= -1) {
			String sub_code = request.getParameter("sub_code");
			MovieSubDTO dto = dao.detail_sub(sub_code);
			request.setAttribute("dto", dto);
			String page = "/movie/sub_detail.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
