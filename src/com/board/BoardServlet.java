package com.board;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBCPConn;
import util.MyUtil;

public class BoardServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	
	//포워드 메소드, url을 받아서 포워딩 한다.
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
		BoardDAO dao = new BoardDAO(conn);
		
		MyUtil myUtill = new MyUtil();
		
		String url ="";
		String uri = req.getRequestURI();
		
		//study/bbs/list.jsp   - 실제주소
		//study/sboard/list.do - 가상주소
		
		if(uri.indexOf("created.do")!=-1){
			
			url ="/bbs/created.jsp";
			forward(req,resp,url);
			
			
		}else if(uri.indexOf("created_ok.do")!=-1){
			
			BoardDTO dto = new BoardDTO();
			
			int maxNum = dao.getMaxNum();
			
			dto.setNum(maxNum+1);
			dto.setName(req.getParameter("name"));
			dto.setContent(req.getParameter("content"));
			dto.setEmail(req.getParameter("email"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setSubject(req.getParameter("subject"));
			dto.setIpAddr(req.getRemoteAddr());
			
			dao.insertData(dto);
			
			url=cp+"/sboard/list.do";
			resp.sendRedirect(url);
		
		}else if(uri.indexOf("list.do")!=-1){
			
			url="/bbs/list.jsp";
			forward(req,resp,url);
			
		}
		
		
	}
		
	
	
}
















































