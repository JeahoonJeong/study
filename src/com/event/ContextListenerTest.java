package com.event;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ContextListenerTest implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent evt) {
	
		System.out.println("서버가 죽었습니다.");
		
	}

	@Override
	public void contextInitialized(ServletContextEvent evt) {
	
		System.out.println("서버가 살아났습니다.");
		
		ServletContext sc = evt.getServletContext();
		
		sc.setAttribute("ServletContextListener_context_param", "ServletContextListener.contextInitialized를 이용한 context parameter 설정");
		
	}
	
	
	
}
