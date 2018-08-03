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

<form action="" method="post">
	수1:<input type="text" name="su1">
	수2:<input type="text" name="su2">
	<input type="submit" value="결과">
</form>

<br/>
<!-- set: 초기화 -->
<c:if test="${!empty param.su1 }">
	<c:set var="result" value="1"/>
	<c:forEach var="a" begin="1" end="${param.su2 }" step="1">
		<c:set var="result" value="${result*param.su1 }"/>
	</c:forEach>
	${param.su1 }^${param.su2 }=${result }<br/>
</c:if>

<br/>

<form action="" method="post">
	수: <input type="text" name="su"><br/>
	<input type="submit" value="결과"><br/>
</form>

<c:choose>
	<c:when test="${param.su%3==0 && param.su%4==0 }">
		${param.su }는 3과 4의 배수
	</c:when>
	
	<c:when test="${param.su%3==0 }">
		${param.su }는 3의 배수
	</c:when>
	
	<c:when test="${param.su%4==0 }">
		${param.su }는 4의 배수
	</c:when>
	
	<c:otherwise>
		${param.su }는 3과 4의 배수가 아님
	</c:otherwise>
</c:choose>

</body>
</html>





























