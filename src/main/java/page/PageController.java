package page;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/page_servlet/*")
public class PageController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri=request.getRequestURI();
		EmpDAO dao = new EmpDAO();
		if(uri.indexOf("list.do")!= -1) {
			int count = dao.empCount(); //레코드 갯수 계산
			int curPage = 1; // 어차피 페이지가 1부터 시작인데, 값이 null일수도 있으니 기본값 1을 줌
			if(request.getParameter("curPage") != null) {
				curPage = Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager = new Pager(count, curPage);
			
			int start = pager.getPageBegin();
			int end = pager.getPageEnd();
			List<EmpDTO> list = dao.empList(start,end);
			request.setAttribute("list", list);
			//페이지 네비게이션(=페이지네이션)에 필요한 정보 전달
			request.setAttribute("page", pager);
			
			//포워딩
			String page = "/page/list.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
