package com.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	
	private Connection conn;
	
	public BoardDAO(Connection conn){
		this.conn = conn;
	}
	
	//num의 마지막 번호
	public int getMaxNum(){
		
		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		String sql= "";
		ResultSet rs = null;
		
		try {
			
			sql = "select nvl(max(num),0) from board";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				maxNum = rs.getInt(1);// 컬럼명을 가져올수 없으므로.
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		return maxNum;
	}
	
	//입력
	public int insertData(BoardDTO dto){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			
			sql = "insert into board (num, name, pwd, email, subject, content, ipaddr, hitcount, created)"
					+ " values(?,?,?,?,?,?,?,0,sysdate)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getSubject());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getIpAddr());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			try {
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
			System.out.println(e.toString());
			// TODO: handle exception
		}
		return result;
	} 
	
	//전체데이터
	public List<BoardDTO> getLists(int start, int end){
			
		List<BoardDTO> lists = new ArrayList<BoardDTO>();
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
	
		try {
			sql = "select * from(select rownum rnum, data.* from(";
			sql += "select num, name, subject, hitcount, to_char(created,'YYYY-MM-DD') created "
					+ "from board order by num desc) data)"
					+ "where rnum>=? and rnum<=?";
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				BoardDTO dto = new BoardDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setHitCount(rs.getInt("hitcount"));
				dto.setCreated(rs.getString("created"));
				
				lists.add(dto);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		return lists;
	}
	
	//전체 데이터의 갯수
	public int getDataCount(){
		
		int DataCount = 0;
		
		PreparedStatement pstmt = null;
		String sql= "";
		ResultSet rs = null;
		
		try {
			
			sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				DataCount = rs.getInt(1);// 컬럼명을 가져올수 없으므로.
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		return DataCount;
	}
	
}












































