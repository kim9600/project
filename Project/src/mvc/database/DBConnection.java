package mvc.database;
/* 싱글톤으로 작성 */

import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnection {	
	//자신타입의 instance필드
	private static DBConnection instance = new DBConnection();
	//생성자 캡슐화
	private DBConnection() {}
	public static DBConnection getInstance() {
		return instance;
	}
	//외부에서 접근가능한 getConnection()메소드
	public Connection getConnection() {
		Connection con=null;
		
		String url="jdbc:mysql://localhost:3306/semiDB?useSSL=false";
		String user="root";
		String password="1234";
		try {			
			//드라이버 메모리에 로딩
			Class.forName("com.mysql.jdbc.Driver"); 
			//연결 맺기
			con=DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

}