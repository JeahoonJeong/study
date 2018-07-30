<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	if(userId.equals("suzi") && userPwd.equals("123")){
		
		session.setAttribute("userId", userId);
		
		response.sendRedirect("login.jsp");
		
	}
	
	
%>

	아이디 혹은 비밀번호가 틀립니다.
	<a href="login.jsp">돌아가기</a>
