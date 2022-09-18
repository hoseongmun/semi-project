package sqlmap;

import java.io.Reader;


import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisManager {
	//Mybatis 의 SqlSession 객체 생성
	private static SqlSessionFactory instance;
	
	private MybatisManager() {
		
	}
	
	// 생성자는 보통 public인데, 여기서는 private임. 따라서 외부에서 접근 안됨
	// 웹프로그램 : 웹은 불특정 다수가 접속하여 서비스받음
	// MybatisManager m = new MybatisManager(); 1사람 요청시 생성, 또 1사람 요청시 새로 MybatisManager m = new MybatisManager();만들어야함.
	// 즉 메모리가 늘어나고 버서가 다운될 수 있음.
	//  => 다수의 인스턴스 생성을 막고 하나의 인스턴스만 생성시켜 처리한다.
	// ==> 이러한 프로그래밍 기법을 싱글톤 패턴 기법이라고 한다.
	// new 로 접근이 안되기 때문에 getInstance() 메소드를 통해 우회 접근한다.
	//
	
	public static SqlSessionFactory getInstance() {
		Reader reader = null;
		try {
			//getResourceAsReader는 Java Resource의 src의 xml을 읽어들이는 메소드
			reader = Resources.getResourceAsReader("sqlmap/sqlMapConfig.xml");
			instance = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(reader != null) reader.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		return instance;
	}
}
