<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Cookie c = new Cookie("productName2",URLEncoder.encode("세탁기", "UtF-8"));//쿠키생성
	c.setMaxAge(15);//유효기간설정
	response.addCookie(c);//respone에 담는다.
	
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

깨끗해 세탁기<br/>
<img alt="" src="./image/<%=URLEncoder.encode("세탁기.jpg", "UTF-8") %>"><br/>
<a href="shop.jsp" >돌아가기</a>

</body>
</html>