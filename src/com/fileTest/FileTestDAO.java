package com.fileTest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class FileTestDAO {
	
	private Connection conn = null;
	
	public FileTestDAO(Connection conn){
		this.conn = conn;
	}
	
	//num의 max값
	public int getMaxNum(){
		
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			sql = "select nvl(max(num),0) from fileTest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				maxNum = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		
		return maxNum;
		
	}
	
	
	//입력
	public int insertData(FileTestDTO dto){
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			
			sql = "insert into fileTest(num, subject, saveFileName, originalFileName)"
					+ " values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getSubject());
			pstmt.setString(3, dto.getSaveFileName());
			pstmt.setString(4, dto.getOriginalFileName());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	//모든 데이터
	public List<FileTestDTO> getList(){
		
		List<FileTestDTO> lists = new ArrayList<FileTestDTO>();
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try {
			
			sql = "select num, subject, saveFileName, originalFileName "
					+ "from fileTest order by num desc";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				FileTestDTO dto = new FileTestDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return lists;
		
	}
	
	
	//start, end 
	public List<FileTestDTO> getList(int start, int end){
		
		List<FileTestDTO> lists = new ArrayList<FileTestDTO>();
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try {
			sql = "select * from(select rownum rnum, data.* from(";
			sql += "select num, subject, saveFileName, originalFileName "
					+ "from fileTest order by num) data)"
					+ "where rnum>=? and rnum<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				FileTestDTO dto = new FileTestDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				
				lists.add(dto);
				
			}
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return lists;
		
	}
	
	
	
	
	//삭제
	
	public int deleteData(int num){
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			
			sql = "delete from fileTest where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		
		return result;
		
	}
	
	public int getDataCount(){
		
		int dataCount = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		
		try {
			
			sql = "select count(*) num from filetest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				dataCount = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		
		return dataCount;
		
	}
	
	//한개의 데이터 불러오기
	public FileTestDTO getReadData(int num){
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
		FileTestDTO dto = null;
		
		try {
			
			sql = "select num, subject, saveFileName, originalFileName "
					+ "from fileTest where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				dto = new FileTestDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				
			}
			
			rs.close();
			pstmt.close();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return dto;
		
	}
	

}
























