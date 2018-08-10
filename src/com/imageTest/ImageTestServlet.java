package com.imageTest;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fileTest.FileTestDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import util.DBCPConn;
import util.FileManager;
import util.MyUtil;

public class ImageTestServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		Connection conn = DBCPConn.getConnection();
		ImageTestDAO dao = new ImageTestDAO(conn);
		
		String uri = req.getRequestURI();
		String url = null;
		
		String cp = req.getContextPath();
		
		MyUtil myUtill = new MyUtil();
		
		//파일 저장할 경로
		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "imageFile";
				
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		
		if(uri.indexOf("list.do")!=-1){
			
			//페이징
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1;
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = dao.getDataCount();//전체 데이터의 갯수
			int numPerPage = 9;
			int totalPage = myUtill.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage){
				currentPage=totalPage;
			}
			
			
			String listUrl = cp+"/image/list.do";
			String pageIndexList;
			if(dataCount!=0){
				pageIndexList = myUtill.pageIndexList(currentPage, totalPage, listUrl);
			}else{
				pageIndexList = "리스트에 데이터가 없습니다.";
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<ImageTestDTO> lists = new ArrayList<ImageTestDTO>();
			
			String imagePath = cp+"/pds/imageFile";
			req.setAttribute("imagePath", imagePath);
			
			lists = dao.getList(start,end);
			
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("pageNum", currentPage);
			req.setAttribute("totalPage",totalPage);
			req.setAttribute("dataCount", dataCount);
			
			url = "/imagetest/list.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("write.do")!=-1){
			
			url = "/imagetest/write.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("write_ok.do")!=-1){
			
			//파일 업로드
			String encType = "UTF-8";
			int maxSize = 10*1024*1024; //10m
			
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			//DB에 파일 정보 저장
			if(mr.getFile("upload")!=null){
				
				ImageTestDTO dto = new ImageTestDTO();
				
				int maxNum = dao.getMaxNum();
				dto.setNum(maxNum+1);
				dto.setSubject(mr.getParameter("subject"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				
				dao.insertData(dto);
				
			}
			
			url = cp+"/image/write.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("delete.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			
			ImageTestDTO dto = dao.getReadData(num);
			
			if(dto == null){
				return;
			}
			
			//파일 삭제
			FileManager.doFileDelete(dto.getSaveFileName(), path);
			
			//테이블 삭제
			dao.deleteData(num);
			
			url = cp+"/image/list.do";
			resp.sendRedirect(url);
		}
		
		
	}
	
	

}






















