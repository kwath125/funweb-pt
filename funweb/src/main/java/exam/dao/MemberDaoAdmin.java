//package exam.dao;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Statement;
//import java.sql.Timestamp;
//import java.time.LocalDateTime;
//import java.util.ArrayList;
//import java.util.List;
//
//import exam.dao.DBManagerAdmin;
//
//import exam.domain.MemberVo;
//
//// Data Access Object(데이터베이스 접근 객체)
//// member 테이블을 제어할 수 있는(sql문 실행하는) 클래스
//public class MemberDaoAdmin {
//	
//	private static MemberDaoAdmin instance = new MemberDaoAdmin();
//	
//	public static MemberDaoAdmin getInstance() {
//		return instance;
//	}
//
//	private MemberDaoAdmin() {}
//	
//	
//	public void insert(MemberVo vo) {
//		// JDBC 참조변수 선언
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		String sql = "";
//		
//		try {
//			con = DBManagerAdmin.getConnection();
//			// sql  insert
//			sql  = "INSERT INTO member (id,passwd,name,age,gender,email,reg_date) ";
//			sql += "VALUES (?,?,?,?,?,?,?) ";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, vo.getId());
//			pstmt.setString(2, vo.getPasswd());
//			pstmt.setString(3, vo.getName());
//			pstmt.setInt(4, vo.getAge());
//			pstmt.setString(5, vo.getGender());
//			pstmt.setString(6, vo.getEmail());
//			
//			//LocalDateTime dateTime = vo.getRegDate();
//			//Timestamp timestamp = Timestamp.valueOf(dateTime);
//			//pstmt.setTimestamp(7, timestamp);
//			
//			pstmt.setTimestamp(7, Timestamp.valueOf(vo.getRegDate()));
//			
//			// 실행
//			pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManagerAdmin.close(con, pstmt);
//		}
//	} // insert
//	
//	
//	public int userCheck(String id, String passwd) {
//		int check = -1; // -1: 아이디 없음, 0: 비밀번호 틀림, 1: 아이디 비밀번호 일치
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String sql = "";
//		
//		try {
//			con = DBManagerAdmin.getConnection();
//			sql = "select passwd from member where id = ?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) { // 아이디 있음
//				if (passwd.equals(rs.getString("passwd"))) {
//					check = 1;
//				} else { // 비밀번호 틀림
//					check = 0;
//				}
//			} else { // 아이디 없음
//				check = -1;
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManagerAdmin.close(con, pstmt, rs);
//		}
//		return check;
//	} // userCheck
//	
//	
//	public List<MemberVo> getMembers() {
//		List<MemberVo> list = new ArrayList<>();
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String sql = "";
//		
//		try {
//			con = DBManagerAdmin.getConnection();
//			
//			sql = "SELECT * FROM member";
//			pstmt = con.prepareStatement(sql);
//			
//			rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				MemberVo vo = new MemberVo();
//				
//				vo.setId(rs.getString("id"));
//				vo.setPasswd(rs.getString("passwd"));
//				vo.setName(rs.getString("name"));
//				vo.setAge(rs.getInt("age"));
//				vo.setGender(rs.getString("gender"));
//				vo.setEmail(rs.getString("email"));
//				
//				//Timestamp timestamp = rs.getTimestamp("reg_date");
//				//LocalDateTime regDate = timestamp.toLocalDateTime();
//				//vo.setRegDate(regDate);
//				
//				vo.setRegDate(rs.getTimestamp("reg_date").toLocalDateTime());
//				
//				list.add(vo); // 행 한개를 리스트에 추가
//			} // while
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManagerAdmin.close(con, pstmt, rs);
//		}
//		return list;
//	} // getMembers()
//	
//	
//	// id로 member 레코드(행) 한개 가져오기
//	public MemberVo getMemberById(String id) {
//		MemberVo vo = null;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		String sql = "";
//		
//		try {
//			con = DBManagerAdmin.getConnection();
//			
//			sql = "SELECT * FROM member WHERE id=?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			
//			rs = pstmt.executeQuery();
//			
//			// rs -> vo객체의 필드에 저장
//			if (rs.next()) {
//				vo = new MemberVo();
//				vo.setId(rs.getString("id"));
//				vo.setPasswd(rs.getString("passwd"));
//				vo.setName(rs.getString("name"));
//				vo.setAge(rs.getInt("age"));
//				vo.setGender(rs.getString("gender"));
//				vo.setEmail(rs.getString("email"));
//				vo.setRegDate(rs.getTimestamp("reg_date").toLocalDateTime());
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManagerAdmin.close(con, pstmt, rs);
//		}
//		return vo;
//	} // getMemberById()
//	
//	
//	public int update(MemberVo vo) {
//		int rowCount = 0;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		String sql = "";
//		
//		try {
//			con = DBManagerAdmin.getConnection();
//			
//			sql += "UPDATE member ";
//			sql += "SET name=?, passwd=?, age=?, gender=?, email=? ";
//			sql += "WHERE id = ? ";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, vo.getName());
//			pstmt.setString(2, vo.getPasswd());
//			pstmt.setInt(3, vo.getAge());
//			pstmt.setString(4, vo.getGender());
//			pstmt.setString(5, vo.getEmail());
//			pstmt.setString(6, vo.getId());
//			// 실행
//			rowCount = pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManagerAdmin.close(con, pstmt);
//		}
//		return rowCount;
//	} // update()
//	
//	
//	public int deleteById(String id) {
//		int rowCount = 0;
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		
//		String sql = "";
//		
//		try {
//			con = DBManagerAdmin.getConnection();
//			
//			sql = "DELETE FROM member WHERE id = ?";
//			
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			// 실행
//			rowCount = pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			DBManagerAdmin.close(con, pstmt);
//		}
//		return rowCount;
//	} // deleteById()
//	
//	// 관리자 권한으로 다중 아이디 삭제 배열을 활용해야한다.
//    public void deleteMembers(String[] memberid) {
//       // JDBC 참조변수 준비
//       Connection con = null;
//       PreparedStatement pstmt = null;
//       String sql = "";
//       
//          for(int i=0; i<memberid.length; i++) {
//             System.out.println(memberid[i]);
//             System.out.println(memberid.length);
//          }  
//       
//       try {
//          con = DBManagerAdmin.getConnection();
//          sql = "DELETE FROM member WHERE id = ? ";
//          pstmt = con.prepareStatement(sql);
//          
//          for(int i=0; i<memberid.length; i++) {
//             
//             pstmt.setString(1, memberid[i]);
//             pstmt.executeUpdate();
//          }
//          
//          
//       } catch (Exception e) {
//          e.printStackTrace();
//       } finally {
//    	   DBManagerAdmin.close(con,pstmt);
//       }
//       
//    } // deleteMembers method
//	
//}
//
//
//
//
//
//
//
