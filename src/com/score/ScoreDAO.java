package com.score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.board.BoardDTO;

import util.DBconn;

public class ScoreDAO {
	
	//������ ����
	private Connection conn;
	
	public ScoreDAO(Connection conn){
		
		this.conn = conn;
		
	}
	
	//1. �Է�(write_ok.jsp)
	
	public int insertData(ScoreDTO dto){
		
		int result = 0;
		
		PreparedStatement  pstmt = null;
		String sql = "";
		
		try {
			
			sql = "insert into score (hak,name,kor,eng,mat) values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			
			//try�� ���� üũ, pstmt �� �޾Ƽ� pstmt close, db close
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
		
		return result;
		
	}
	
	//2.������ ��������(list.jsp)
	
	public List<ScoreDTO> getList(){
		
		List<ScoreDTO> lists = new ArrayList<ScoreDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			
			sql = "select hak,name,kor,eng,mat,(kor+eng+mat) tot,"
					+ "(kor+eng+mat)/3 ave, "
					+ "rank() over(order by (kor+eng+mat) desc) rank "
					+ "from score ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ScoreDTO dto = new ScoreDTO();
				
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));
				
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
	
	//3.������ ������ ��������
	public ScoreDTO getReadData(String hak){
		
		ScoreDTO dto = null;
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		
		try {
			
			sql = "select hak,name,kor,eng,mat from score where hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				
				dto = new ScoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				
			}
			pstmt.close();
			rs.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		return dto;
		
	}
	
	//4.����
	
	public int updateData(ScoreDTO dto){
		
		int result = 0;
		
		String sql = "";
		
		PreparedStatement pstmt = null;
		
		try {
			
			sql = "update score set kor=?,eng=?,mat=? where hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getKor());
			pstmt.setInt(2, dto.getEng());
			pstmt.setInt(3, dto.getMat());
			pstmt.setString(4, dto.getHak());
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		return result;
		
	}
	
	//5.����
	
	public int deleteData(String hak){
		int result = 0;
		String sql = "";
		PreparedStatement pstmt = null;
		
		try {
			
			sql ="delete from score where hak=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hak);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		return result;
		
	}
	
	
	
	public int getDataCount(){
	
		int DataCount = 0;
		
		PreparedStatement pstmt = null;
		String sql= "";
		ResultSet rs = null;
		
		try {
			
			sql = "select nvl(count(*),0) from score ";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next()){
				
				DataCount = rs.getInt(1);
				
			}
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
			// TODO: handle exception
		}
		
		return DataCount;
	}
	
	//overload
	public List<ScoreDTO> getList(int start, int end){
		
		List<ScoreDTO> lists = new ArrayList<ScoreDTO>();
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
	
		try {
			
			sql = "select * from(select rownum rnum, data.* from(";
			sql += "select hak,name,kor,eng,mat,(kor+eng+mat) tot, (kor+eng+mat)/3 ave,"
					+ "rank() over(order by (kor+eng+mat) desc) rank "
					+ "from score) data)"
					+ "where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ScoreDTO dto = new ScoreDTO();
				
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAve(rs.getInt("ave"));
				dto.setRank(rs.getInt("rank"));
				
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
	
	
	
	
	
}





































