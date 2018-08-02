package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test3 extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doPost(req,resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		//request.setCharacterEncoding("UTF-8"); jsp코드 
		
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		
		String str = name +"의 나이는 "+age+"살 입니다.";
		
		//서블릿에서 jsp로 데이터를 넘겨주는 4번째 방식
		
		req.setAttribute("result", str);
		//jsp에서는 request로 받는다.
		
		
		//포워딩
		RequestDispatcher rd = req.getRequestDispatcher("/servlet/test2_ok.jsp");
		rd.forward(req, resp);
		
		
	}
	
	
	
	
}























