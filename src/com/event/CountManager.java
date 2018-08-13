package com.event;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//서블릿의 라이프사이클 속성
//HTTPSeessionListener : 세션이 생성, 종료될때
//ServletContextListener : 서버가 시작, 중지될때

public class CountManager implements HttpSessionListener{
	
	private static CountManager countManager;
	private static int count;
	
	public CountManager(){
		countManager = this;
	}
	
	public static synchronized CountManager getInstance()
	throws Exception{
		
		if(countManager==null){
			countManager = new CountManager();
		}
		return countManager;
	}
	
	public static int getCount(){
		return count;
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent evt) {
	
		HttpSession session = evt.getSession();
		session.setMaxInactiveInterval(10*60);//10분
		count++;
		
		System.out.print(session.getId()+":세션생성,");
		System.out.print("접속자수: "+count);
	
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent evt) {
		
		HttpSession session = evt.getSession();
		
		count--;

		System.out.print(session.getId()+":세션소멸,");
		System.out.print("접속자수: "+count);

	}
	
	

}





















