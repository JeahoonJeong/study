<%@ page contentType="text/html; charset=UTF-8"%>
<!-- autoFlush 기본값이 true  밑의 for문이 출력하는 양이 1kb가 넘기때문에 에러가 난다.-->
<%@ page buffer="1kb" autoFlush="false"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		for(int i =1 ;i <=100; i++){
			
	%>	
	1234
	<% 	
		}
	%>
</body>
</html>