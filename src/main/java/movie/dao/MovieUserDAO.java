package movie.dao;

import org.apache.ibatis.session.SqlSession;

import movie.dto.MovieUserDTO;
import sqlmap.MybatisManager;

public class MovieUserDAO {
	public String login(MovieUserDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		String name = session.selectOne("member.login", dto);
		
		session.close();
		return name;
	}
	public void insert(MovieUserDTO dto) {
		SqlSession session = null;
		try {
			session = MybatisManager.getInstance().openSession();
			session.insert("memeber.insert", dto);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close();
		}
	}	
}
