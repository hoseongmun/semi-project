package movie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import movie.dto.MovieCartDTO;
import sqlmap.MybatisManager;

public class MovieCartDAO {
	public List<MovieCartDTO> cart_money(){ 
		SqlSession session=null;
		List<MovieCartDTO> ltems = null;
		try {
			session=MybatisManager.getInstance().openSession();
			ltems=session.selectList("cart.sub_money");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return ltems;
	}
	public void insert_cart(MovieCartDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.insert("cart.insert_cart", dto); 
			session.commit(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public List<MovieCartDTO> list_cart(String userid){//장바구니 목록
		SqlSession session=null;
		List<MovieCartDTO> list=null;
		try {
			session=MybatisManager.getInstance().openSession();
			list=session.selectList("cart.list_cart", userid);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
		return list;
	}
	
	public void delete_cart(int cart_id) { //장바구니 개별 삭제
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("cart.delete_cart", cart_id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public void update_cart(MovieCartDTO dto) {
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.update("cart.update_cart", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public void clear_cart(String userid) { 
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();
			session.delete("cart.clear_cart", userid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null) session.close();
		}
	}
	
	public int sum_money(String userid) {
		int total=0;
		SqlSession session=MybatisManager.getInstance().openSession();
		total=session.selectOne("cart.sum_money", userid);
		session.close();
		return total;
	}
}
