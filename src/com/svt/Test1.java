package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class Test1 extends GenericServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest request, ServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		//response page content-type 설정
		
		try {
			PrintWriter out = response.getWriter();//jsp에서의 out을 불러온다.
			out.print("<html>");
			out.print("<head>");
			out.print("<title>");
			out.print("예제 프로그램");
			out.print("</title>");
			out.print("</head>");
			out.print("<body style='font-size:12pt;'>");
			out.print("화면 디자인은 서블릿보다 jsp가 편하다.");
			out.print("</body>");
			out.print("</html>");
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
	
	
	
}
