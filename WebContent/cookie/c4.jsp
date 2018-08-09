<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Cookie c4 = new Cookie("tel",null);// 넘어온 c4를 초기화한다.
	response.addCookie(c4);
	
	Cookie[] c = request.getCookies();
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="item"  items="<%=c %>">
	쿠키이름 : ${item.name} ,쿠키값: ${item.value }<br/>
</c:forEach>
<!-- 쿠키의 유효기간 -->
<!-- 새로고침하면 name 값이 삭제되고, tel이 null값으로 초기화된다. -->


</body>
</html>