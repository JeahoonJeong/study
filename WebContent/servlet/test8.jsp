<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="url" value="gugudan.jsp"/>
	<c:import url="${url }" var="uu">
		<c:param name="dan" value="5"/>
	</c:import>
	
	<c:out value="${uu } " escapeXml="false"/>
	<!-- excapeXml을 사용하지 않으면 소스코드가 출력된다.-->
	
	<br/>
	
	<c:set var="url" value="https://www.daum.net"/>
	<c:import url="${url } " var="u"/>
	<!-- url변수에 들어있는 주소로 접근하여 페이지 소스코드를 u에 저장한다. -->
	<h1><c:out value="${url }"/></h1>
	<br/><br/><br/>
	<c:out value="${u }" escapeXml="false"/>
	
	
</body>
</html>