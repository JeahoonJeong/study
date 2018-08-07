package com.join;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBCPConn;

public class MemberServlet extends HttpServlet {

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
		Connection conn = DBCPConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);
		
		String cp = req.getContextPath();
		String uri = req.getRequestURI();
		
		String url;
		
		if(uri.indexOf("created.do")!=-1){
			url = "/member/created.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("created_ok.do")!=-1){
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserId(req.getParameter("userId"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserTel(req.getParameter("userTel"));
			dto.setUserBirth(req.getParameter("userBirth"));
			
			dao.insertData(dto);
			url = cp+ "/index.jsp";
			resp.sendRedirect(url);
		}else if(uri.indexOf("login.do")!=-1){
			url = "/member/login.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("login_ok.do")!=-1){
			
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
		
			MemberDTO dto = dao.getReadData(userId);
			
			//아이디가 잘못되었을때 || 패스워드가 잘못되었을때
		
			if(dto==null || (!dto.getUserPwd().equals(userPwd))){
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요!");
				url = "/member/login.jsp";
				forward(req, resp, url);
				return;
			}
			
			
			HttpSession session = req.getSession(true);//기본세션외에 지정한 이름으로 생성
			CustomInfo info = new CustomInfo();
			
			info.setUserId(dto.getUserId());
			info.setUserName(dto.getUserName());
			
			session.setAttribute("customInfo", info);
			
			url = cp;
			resp.sendRedirect(url);
			
		}else if(uri.indexOf("logout.do")!=-1){
			
			HttpSession session = req.getSession();//현재 사용하고 있는 세션을 받아온다.(true옵션 x)
			session.removeAttribute("customInfo");
			session.invalidate();//세션변수삭제
			
			url = cp;
			resp.sendRedirect(url);
		}else if(uri.indexOf("update.do")!=-1){
			
			HttpSession session = req.getSession();
			CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
			MemberDTO dto = dao.getReadData(info.getUserId());
			
			req.setAttribute("dto", dto);
			
			url = "/member/update.jsp";
			forward(req, resp, url);
		}else if(uri.indexOf("update_ok.do")!=-1){
			
			MemberDTO dto = new MemberDTO();
			dto.setUserId(req.getParameter("userId"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			
			dao.updateData(dto);
			
			url = cp;
			resp.sendRedirect(url);
	
		}else if(uri.indexOf("searchpw.do")!=-1){
			
			url = "/member/find.jsp";
			//forwarding 할때는 cp를 붙이면 안간다.. 왜?
			forward(req, resp, url);
			
		}else if(uri.indexOf("searchpw_ok.do")!=-1){
			
			MemberDTO dto = dao.getReadData(req.getParameter("userId"));
			
			if(dto==null){
				req.setAttribute("message", "아이디가 존재하지 않습니다.");
				url ="/join/login.do";
				forward(req, resp, url);
				return;
			}
			
			if(!dto.getUserTel().equals(req.getParameter("userTel"))){
				req.setAttribute("message", "전화번호가 틀립니다.");
				url ="/join/login.do";
				forward(req, resp, url);
				return;	
			}
			
			req.setAttribute("message", "비밀번호는["+dto.getUserPwd()+"] 입니다.");
			url ="/join/login.do";
			forward(req, resp, url);
			return;
			
		}
		
	}
	
	
	
}




























