//package exam.dao;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;
//
//import javax.naming.Context;
//import javax.naming.InitialContext;
//import javax.sql.DataSource;
//
//public class DBManagerAdmin {
//	
//	
//	// DB연결 메소드
//	public static Connection getConnection() throws Exception {
//		Connection con = null;
//		
//		
//		// DB접속정보
//		String url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&characterEncoding=utf8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=Asia/Seoul";
//		String user = "jspuser";
//		String passwd = "jsppass";
//		
//		// 1단계 드라이버 클래스 로딩
//		Class.forName("com.mysql.cj.jdbc.Driver");
//		// 2단계 DB연결(DB주소,DB아이디,DB비밀번호)
//		con = DriverManager.getConnection(url, user, passwd);
//		
//		
//		// 커넥션 풀 이용
//		Context context = new InitialContext();
//		DataSource ds = (DataSource) context.lookup("java:comp/env/jdbc/jspdb");
//		con = ds.getConnection(); // 커넥션 한개 빌려오기
//		return con;
//		
//	}
//	
//	
//	public static void close(Connection con, Statement stmt) {
//		close(con, stmt, null);
//	} // close
//	
//	
//	public static void close(Connection con, Statement stmt, ResultSet rs) {
//		// JDBC 객체는 사용의 역순으로 자원닫기
//		try {
//			if (rs != null) {
//				rs.close();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		try {
//			if (stmt != null) {
//				stmt.close();
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		try {
//			if (con != null) {
//				con.close(); // 커넥션 반납하기
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	} // close
//	
//
//}
