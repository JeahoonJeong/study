<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	
	//String userName = (String)session.getAttribute("userName");
	//String userBirth = (String)session.getAttribute("userBirth");
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

이름:<%=userName %>
생일:<%=userBirth %>
아이디:<%=userId %>
패스워드:<%=userPwd %>

</body>
</html>