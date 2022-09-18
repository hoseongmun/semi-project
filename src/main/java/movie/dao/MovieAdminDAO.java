package movie.dao;

import org.apache.ibatis.session.SqlSession;

import movie.dto.MovieAdminDTO;
import sqlmap.MybatisManager;

public class MovieAdminDAO {
	public String login(MovieAdminDTO dto) {
		SqlSession session = MybatisManager.getInstance().openSession();
		String name = session.selectOne("admin.login", dto);
		
		session.close();
		return name;
	}
}