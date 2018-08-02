package com.guest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.board.Board;
import com.guest.GuestDTO;

public class GuestDAO implements Board{
	
	private Connection conn = null;
	
	public GuestDAO(Connection conn){
		this.conn = conn;
	}

	@Override
	public int getMaxNum() {

		int maxNum = 0;
		
		PreparedStatement pstmt = null;
		String sql= "";
		ResultSet rs = null;
		
		try {
			
			sql = "select nvl(max(num),0) from guest";
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

	@Override
	public int insertData(GuestDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			
			sql = "insert into guest (num, name, email, homepage, content, created, ipaddr)"
					+ " values(?,?,?,?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getHomepage());
			pstmt.setString(5, dto.getContent());
			pstmt.setString(6, dto.getIpAddr());
			
			result = pstmt.executeUpdate();
			
			System.out.print(dto.getContent());
			
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

	@Override
	public List<GuestDTO> getListData(int start, int end) {
		List<GuestDTO> lists = new ArrayList<GuestDTO>();
		
		PreparedStatement pstmt = null;
		String sql = "";
		ResultSet rs = null;
	
		try {
			
			
			sql = "select * from(select rownum rnum, data.* from(";
			sql += "select num, name,email,ipaddr, homepage, content,created "
					+ "from guest "
					+ "order by num desc) data)"
					+ "where rnum>=? and rnum<=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				GuestDTO dto = new GuestDTO();
				
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setCreated(rs.getString("created"));
				dto.setIpAddr(rs.getString("ipaddr"));
				dto.setContent(rs.getString("content"));
				dto.setHomepage(rs.getString("homepage"));
				
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

	@Override
	public int getDataCount() {
		int DataCount = 0;
		
		PreparedStatement pstmt = null;
		String sql= "";
		ResultSet rs = null;
		
		try {
			
			sql = "select nvl(count(*),0) from guest";
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

	@Override
	public int deleteData(int num) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql ="";
		
		try {
			
			sql = "delete from guest where num = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			result = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	

}
