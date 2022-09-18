package movie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import movie.dto.MovieSubDTO;
import sqlmap.MybatisManager;

public class MovieSubDAO {

	public List<MovieSubDTO> sublist(){
		List<MovieSubDTO> list = null;
		SqlSession session=null;
		try {
			session=MybatisManager.getInstance().openSession();		
			list=session.selectList("sub.sub_list");			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
		return list;
	}
	
	public MovieSubDTO detail_sub(String sub_code) {
		SqlSession session=MybatisManager.getInstance().openSession();
		MovieSubDTO dto=session.selectOne("sub.detail_sub", sub_code);
		session.close();
		return dto;
	}

	public void update_sub(MovieSubDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.update("sub.update_sub", dto);
		session.commit();
		session.close();
	}
	
	public void delete_sub(String sub_code) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.delete("sub.delete_sub", sub_code);
		session.commit();
		session.close();
	}
	
	public void insert_sub(MovieSubDTO dto) {
		SqlSession session=MybatisManager.getInstance().openSession();
		session.insert("sub.insert_sub", dto);
		session.commit();
		session.close();
	}	
	
	public String fileInfo(String sub_code) {
		SqlSession session=MybatisManager.getInstance().openSession();
		String result=session.selectOne("sub.detail_sub", sub_code);
		session.close();
		return result;
	}

}
