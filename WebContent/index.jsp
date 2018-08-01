<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSP<h1>

1.<a href="<%=cp%>/score/list.jsp">성적처리</a><br/>
2.<a href="<%=cp %>/board/list.jsp">게시판(jsp)</a>

</body>
</html>