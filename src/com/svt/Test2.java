package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test2 extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	//doGet doPost 두개의 메소드는 반드시 오버라이드 해야한다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doPost(req,resp);
		//get 방식, post방식 두가지 모두 같은 결과로 처리한다.
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		ServletConfig config = getServletConfig();
		//ServletConfig를 사용하여 웹에서 넘어오는 데이터를 받는다.
		
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		
		ServletContext context = getServletContext();
		//ServletContext를 사용하여 웹에서 넘어오는 데이터를 받는다.
		String gender = context.getInitParameter("gender");
		
		
		resp.setContentType("text/html;charset=UTF-8");
		//response page content-type 설정
		
		PrintWriter pw = resp.getWriter();
		
		pw.print("<html><body>");
		pw.print("name: "+name+"<br/>");
		pw.print("age: "+age+"<br/>");
		pw.print("gender: "+gender+"<br/>");
		pw.print("</body></html>");
		
		
		
	}
	
	
	
	
	
	

}





























