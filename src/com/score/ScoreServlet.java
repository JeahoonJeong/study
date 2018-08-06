package com.score;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBCPConn;
import util.MyUtil;

import com.board.BoardDAO;

public class ScoreServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
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
		String cp = req.getContextPath();
		
		Connection conn = DBCPConn.getConnection();
		ScoreDAO dao = new ScoreDAO(conn);
		
		MyUtil myUtill = new MyUtil();
		
		String url ="";
		String uri = req.getRequestURI();
		
		if(uri.indexOf("list.do")!=-1){
			
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1;
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = dao.getDataCount();//전체 데이터의 갯수
			int numPerPage = 3;
			int totalPage = myUtill.getPageCount(numPerPage, dataCount);
			
			String listUrl = cp+"/sscore/list.do";
			String pageIndexList;
			if(dataCount!=0){
				pageIndexList = myUtill.pageIndexList(currentPage, totalPage, listUrl);
			}else{
				pageIndexList = "리스트에 데이터가 없습니다.";
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<ScoreDTO> lists = dao.getList(start,end);
			
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("pageNum", currentPage);
			
			url="/sung/servletList.jsp";
			forward(req,resp,url);
			
		}else if(uri.indexOf("write.do")!=-1){
			
			url = "/sung/write.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("write_ok.do")!=-1){
			
			ScoreDTO dto = new ScoreDTO();
			
			dto.setHak(req.getParameter("hak"));
			dto.setName(req.getParameter("name"));
			dto.setKor(Integer.parseInt(req.getParameter("kor")));
			dto.setEng(Integer.parseInt(req.getParameter("eng")));
			dto.setMat(Integer.parseInt(req.getParameter("mat")));
			
			dao.insertData(dto);
			
			url = cp+"/sscore/list.do";
			resp.sendRedirect(url);
		}else if(uri.indexOf("update.do")!=-1){
			
			String hak = req.getParameter("hak");
			String pageNum = req.getParameter("pagaNum");
			
			ScoreDTO dto = dao.getReadData(hak);
			
			if(dto==null){
				resp.sendRedirect(cp+"/sung/list.jsp");
			}
			
			req.setAttribute("hak", dto.getHak());
			req.setAttribute("name", dto.getName());
			req.setAttribute("kor", dto.getKor());
			req.setAttribute("eng", dto.getEng());
			req.setAttribute("mat", dto.getMat());
			req.setAttribute("pageNum", pageNum);
			
			
			
			url = "/sung/update.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("update_ok.do")!=-1){
			
			ScoreDTO dto = new ScoreDTO();
			
			dto.setHak(req.getParameter("hak"));
			dto.setName(req.getParameter("name"));
			dto.setKor(Integer.parseInt(req.getParameter("kor")));
			dto.setEng(Integer.parseInt(req.getParameter("eng")));
			dto.setMat(Integer.parseInt(req.getParameter("mat")));
			
			dao.updateData(dto);
	
			url = cp+"/sscore/list.do?pageNum="+req.getParameter("pageNum");
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("delete_ok.do")!=-1){
			
			String hak = req.getParameter("hak");
			
			
			dao.deleteData(hak);
			
			url = cp+"/sscore/list.do?pageNum="+req.getParameter("pageNum");
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("servletList.do")!=-1){
			
			String pageNum = req.getParameter("pageNum");
			int currentPage = 1;
			
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = dao.getDataCount();//전체 데이터의 갯수
			int numPerPage = 3;
			int totalPage = myUtill.getPageCount(numPerPage, dataCount);
			
			String listUrl = cp+"/sscore/servletList.do";
			String pageIndexList;
			if(dataCount!=0){
				pageIndexList = myUtill.pageIndexList(currentPage, totalPage, listUrl);
			}else{
				pageIndexList = "리스트에 데이터가 없습니다.";
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<ScoreDTO> lists = dao.getList(start,end);
			
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			
			url="/sung/servletList.jsp";
			forward(req,resp,url);
			
		}
		
		
	}
	
	
}






























