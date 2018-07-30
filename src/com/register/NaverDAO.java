package com.register;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.score.ScoreDTO;

import util.DBconn;

public class NaverDAO {
	
	//의존성 주입
	private Connection conn;
	
	public NaverDAO(Connection conn){
		this.conn = conn;
	}
	
	//1.입력
	
	public int insertData(NaverDTO dto){
		
		String sql = "";
		PreparedStatement pstmt = null;
		int result=0;
		try {
			
			sql = "insert into naver("
					+ "userid, username, usernickname, userpwd, useremail, "
					+ "usertel, userquestion, useranswer)"
					+ " values(?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUsername());
			pstmt.setString(3, dto.getUsernickname());
			pstmt.setString(4, dto.getUserpwd());
			pstmt.setString(5, dto.getUseremail());
			pstmt.setString(6, dto.getUsertel());
			pstmt.setString(7, dto.getUserquestion());
			pstmt.setString(8, dto.getUseranswer());
			
			result = pstmt.executeUpdate();
			pstmt.close();
			
			
		} catch (Exception e) {
			System.out.println(e.toString());
			// TODO: handle exception
		}
		return result;
		
	}
	
	//2.데이터 가져오기(list.jsp)
	
		public List<NaverDTO> getList(){
			
			List<NaverDTO> lists = new ArrayList<NaverDTO>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "";
			
			try {
				
				sql = "select "
						+ "userid, username, usernickname, userpwd, useremail, "
						+ "usertel, userquestion, useranswer"
						+ " from naver";
				
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					
					NaverDTO dto = new NaverDTO();
					
					dto.setUserid(rs.getString("userid"));
					dto.setUsername(rs.getString("username"));
					dto.setUsernickname(rs.getString("usernickname"));
					dto.setUserpwd(rs.getString("userpwd"));
					dto.setUseremail(rs.getString("useremail"));
					dto.setUsertel(rs.getString("usertel"));
					dto.setUserquestion(rs.getString("userquestion"));
					dto.setUseranswer(rs.getString("useranswer"));
					
					
					lists.add(dto);
				}
				
				pstmt.close();
				rs.close();
				
			} catch (Exception e) {
				
				try {
					pstmt.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
				try {
					DBconn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
				// TODO: handle exception
				System.out.println(e.toString());
			}
			
			return lists;
		}
		
		
		//3.수정할 데이터 가져오기
		public NaverDTO getReadData(String userid){
			
			NaverDTO dto = null;
			PreparedStatement pstmt = null;
			String sql;
			ResultSet rs = null;
			
			try {
				
				sql = "select "
						+ "userid, username, usernickname, userpwd, useremail, "
						+ "usertel, userquestion, useranswer"
						+ " from naver where userid = ?";
				
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				
				rs = pstmt.executeQuery();
				
				System.out.println(sql);
				
				if(rs.next()){
					
					dto = new NaverDTO();
					
					dto.setUserid(rs.getString("userid"));
					dto.setUsername(rs.getString("username"));
					dto.setUsernickname(rs.getString("usernickname"));
					dto.setUserpwd(rs.getString("userpwd"));
					dto.setUseremail(rs.getString("useremail"));
					dto.setUsertel(rs.getString("usertel"));
					dto.setUserquestion(rs.getString("userquestion"));
					dto.setUseranswer(rs.getString("useranswer"));
					
				}
				pstmt.close();
				rs.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
				// TODO: handle exception
			}
			
			return dto;
			
		}
		
		
		//4.수정
		
		public int updateData(NaverDTO dto){
			
			int result = 0;
			
			String sql = "";
			
			PreparedStatement pstmt = null;
			
			try {
				
				sql = "update naver set usernickname=?, userpwd=?, useremail=?, usertel=?, "
						+ "userquestion=?, useranswer=? "
						+ "where userid = ?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getUsernickname());
				pstmt.setString(2, dto.getUserpwd());
				pstmt.setString(3, dto.getUseremail());
				pstmt.setString(4, dto.getUsertel());
				pstmt.setString(5, dto.getUserquestion());
				pstmt.setString(6, dto.getUseranswer());
				pstmt.setString(7, dto.getUserid());
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
				// TODO: handle exception
			}
			
			return result;
			
		}
		
		
		//5.삭제
		
		public int deleteData(String id){
			int result = 0;
			String sql = "";
			PreparedStatement pstmt = null;
			
			try {
				
				sql ="delete from naver where userid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				result = pstmt.executeUpdate();
				
				pstmt.close();
				
			} catch (Exception e) {
				System.out.println(e.toString());
				// TODO: handle exception
			}
			
			return result;
			
		}
	
	

}
