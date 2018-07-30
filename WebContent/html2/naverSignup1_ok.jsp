<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");%>
<%
	String userName = request.getParameter("userName");
	String userId = request.getParameter("userId");
	String userNickname = request.getParameter("userNickname");
	String userPW = request.getParameter("userPW1");
	String userEmail = request.getParameter("email1")+"@"+request.getParameter("email2");
	String userTel = request.getParameter("tel1")+"-"
			+request.getParameter("tel2")+"-"+request.getParameter("tel3");
	String userQuestion = request.getParameter("question");
	String userAnswer = request.getParameter("answer1");
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

userName : <%=userName %><br/>
userId : <%=userId %><br/>
userNickname : <%=userNickname %><br/>
userPW : <%=userPW %><br/>
userEmail : <%=userEmail %><br/>
userTel : <%=userTel %><br/>
userQuestion : <%=userQuestion %><br/>
userAnswer : <%=userAnswer %><br/>

</body>
</html>