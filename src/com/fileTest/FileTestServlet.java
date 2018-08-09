package com.fileTest;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import util.DBCPConn;
import util.FileManager;
import util.MyUtil;

public class FileTestServlet extends HttpServlet{

	
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
		FileTestDAO dao = new FileTestDAO(conn);
		
		MyUtil myUtill = new MyUtil();
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		String url = "";
		
		//파일 저장할 경로
		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "saveFile";
		
		File f = new File(path);
		if(!f.exists()){
			f.mkdirs();
		}
		//write.do
		if(uri.indexOf("write.do")!=-1){
			url = "/fileTest/write.jsp";
			forward(req, resp, url);
		//write_ok.do
		}else if(uri.indexOf("write_ok.do")!=-1){
			
			//파일 업로드
			String encType = "UTF-8";
			int maxSize = 10*1024*1024; //10m
			
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			//DB에 파일 정보 저장
			if(mr.getFile("upload")!=null){
				
				FileTestDTO dto = new FileTestDTO();
				
				int maxNum = dao.getMaxNum();
				dto.setNum(maxNum+1);
				dto.setSubject(mr.getParameter("subject"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setOriginalFileName(mr.getOriginalFileName("upload"));
				
				dao.insertData(dto);
				
			}
			
			url = cp+"/file/list.do";
			resp.sendRedirect(url);
		//list.do	
		}else if(uri.indexOf("list.do")!=-1){
			
			//페이징
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1;
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = dao.getDataCount();//전체 데이터의 갯수
			int numPerPage = 5;
			int totalPage = myUtill.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage){
				currentPage=totalPage;
			}
			
			
			String listUrl = cp+"/file/list.do";
			String pageIndexList;
			if(dataCount!=0){
				pageIndexList = myUtill.pageIndexList(currentPage, totalPage, listUrl);
			}else{
				pageIndexList = "리스트에 데이터가 없습니다.";
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<FileTestDTO> lists = new ArrayList<FileTestDTO>();
			
			//다운로드 Path 시작--------------------------------------------
			String downloadPath = cp + "/file/download.do";
			String deletePath = cp + "/file/delete.do";
			
			String imagePath = cp+"/pds/saveFile";
			req.setAttribute("imagePath", imagePath);
			
			req.setAttribute("downloadPath", downloadPath);
			req.setAttribute("deletePath", deletePath);			
			
			//다운로드 Path 끝---------------------------------------------
			
			//forward 페이지에 데이터를 넘김
			lists = dao.getList(start,end);
			
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("pageNum", currentPage);
		
			url = "/fileTest/list.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("download.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			
			FileTestDTO dto = dao.getReadData(num);
			
			if(dto == null){
				return;
			}
			
			//반환값(true:다운로드 완료)
			boolean flag = FileManager.doFileDownload(resp, dto.getSaveFileName(), dto.getOriginalFileName(), path);
			
			if(!flag){
				
				resp.setContentType("text/html;charset=UTF-8");
				PrintWriter out = resp.getWriter();
				out.print("<script type='text/javascript'>");
				out.print("alert('download error');");
				out.print("history.back();");//뒤로가기
				out.print("</script>");
				
			}
			
		}else if(uri.indexOf("delete.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			
			FileTestDTO dto = dao.getReadData(num);
			
			if(dto == null){
				return;
			}
			
			//파일 삭제
			FileManager.doFileDelete(dto.getSaveFileName(), path);
			
			//테이블 삭제
			dao.deleteData(num);
			
			url = cp+"/file/list.do";
			resp.sendRedirect(url);
		}
		
	}

}
















