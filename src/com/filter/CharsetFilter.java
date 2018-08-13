package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class CharsetFilter implements Filter{
	
	private String charset;
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		
		String uri;
		if(req instanceof HttpServletRequest){
			HttpServletRequest request = (HttpServletRequest)req;//다운캐스트
			uri = request.getRequestURI();
			
			if(request.getMethod().equalsIgnoreCase("post")){
			
					if(uri.indexOf("ajax.do")!=-1){
						request.setCharacterEncoding("euc-kr");
					}else{
						request.setCharacterEncoding(charset);
					}
			}
						
		}		
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
	
		charset = config.getInitParameter("charset");//web.xml 에 설정한 init-param
		
		if(charset==null){
			charset = "utf-8";
		}
		
	}
	
	

}






























