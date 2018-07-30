<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	
	String eng = request.getParameter("eng");
	String han = request.getParameter("kor");
	
	String kor = URLDecoder.decode(han, "UTF-8");
	

%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

포워딩된 value<br/>
eng : <%=eng %><br/>
디코딩하기 전의 kor : <%=han %><br/>
kor : <%=kor %><br/>

</body>
</html>