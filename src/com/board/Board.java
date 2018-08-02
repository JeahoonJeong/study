package com.board;

import java.util.List;

import com.guest.GuestDTO;

public interface Board {
	public int getMaxNum();
	public int insertData(GuestDTO dto);
	public List<GuestDTO> getListData(int start, int end);
	public int getDataCount();
	public int deleteData(int num);
}
