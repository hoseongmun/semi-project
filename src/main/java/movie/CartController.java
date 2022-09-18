package movie;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import movie.dao.MovieCartDAO;
import movie.dto.MovieCartDTO;

//@WebServlet("/cart_servlet/*")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		MovieCartDAO dao=new MovieCartDAO();
		HttpSession session=request.getSession();
		String userid=(String)session.getAttribute("userid"); 
		if(url.indexOf("insert.do")!=-1) { 
			if(userid==null) {
				String page = "/movie/member_login.jsp";
				response.sendRedirect(contextPath+page); 
			}else {
				MovieCartDTO dto=new MovieCartDTO();
				dto.setUserid(userid);
				dto.setSub_code(Integer.parseInt(request.getParameter("sub_code").trim()));
				dto.setAmount(Integer.parseInt(request.getParameter("amount").trim()));
				dao.insert_cart(dto);
				String page = "/cart_servlet/list.do";
				response.sendRedirect(contextPath+page);
			}
		}else if(url.indexOf("list.do")!=-1) {
	        int sum_money=dao.sum_money(userid);
	        List<MovieCartDTO> items = dao.list_cart(userid);
	        request.setAttribute("items", items);
			request.setAttribute("sum_money", sum_money);
			//System.out.println(items);
			//System.out.println(sum_money);
			
//			Map<String,Object> map=new HashMap<>();
//			map.put("sum_money", sum_money);
//			map.put("items", items);
//			request.setAttribute("map", map);
			String page="/movie/cart_list.jsp";
			response.sendRedirect(contextPath+page);
		}else if(url.indexOf("delete.do")!=-1) {
			dao.delete_cart(Integer.parseInt(request.getParameter("cart_id"))); 
			String page = "/cart_servlet/list.do";
			response.sendRedirect(contextPath+page); 
		}else if(url.indexOf("delete_all.do")!=-1) {
			dao.clear_cart(userid);
			String page = "/cart_servlet/list.do";
			response.sendRedirect(contextPath+page); 
		}else if(url.indexOf("update.do")!=-1) { 
			String[] sub_code=request.getParameterValues("sub_code");
			String[] amount=request.getParameterValues("amount");
			String[] cart_id=request.getParameterValues("cart_id");
			for(int i=0; i<sub_code.length; i++) {
				MovieCartDTO dto=new MovieCartDTO();
				dto.setUserid(userid);
				dto.setCart_id(Integer.parseInt(cart_id[i]));
				dto.setAmount(Integer.parseInt(amount[i]));
				dao.update_cart(dto);
			}
			String page = "/cart_servlet/list.do";
			response.sendRedirect(contextPath+page);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
