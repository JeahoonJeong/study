<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
		
	session.removeAttribute("userId");
	session.invalidate();
	
	response.sendRedirect("login.jsp");

%>
	