<%@page import="com.join.CustomInfo"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
	
	CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>JSP<br/>

<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
		<b>로그인하면 새로운 세상이 보입니다.</b><br/><br/>
		1.성적처리</a><br/>
2.게시판(jsp)</a><br/>
3.방명록(jsp)</a><br/>
4.성적처리(servlet)</a><br/>
	</c:when>
	<c:otherwise>
		${sessionScope.customInfo.userName }님 로그인.<br/><br/>
		1.<a href="<%=cp%>/score/list.jsp">성적처리</a><br/>
		2.<a href="<%=cp %>/board/list.jsp">게시판(jsp)</a><br/>
		3.<a href="<%=cp %>/guest/guest.jsp">방명록(jsp)</a><br/>
		4.<a href="<%=cp %>/sscore/list.do">성적처리(servlet)</a><br/>
	</c:otherwise>
</c:choose>


	5.<a href="<%=cp %>/sboard/list.do">게시판(servlet)</a><br/>
	6.<a href="<%=cp %>/file/list.do">파일게시판(servlet)</a><br/>

<c:choose>
	<c:when test="${empty sessionScope.customInfo.userId }">
		6.<a href="<%=cp %>/join/login.do">로그인</a><br/>
		7.<a href="<%=cp %>/join/created.do">회원가입</a><br/>
	</c:when>
	<c:otherwise>
		6.<a href="<%=cp %>/join/update.do">정보수정</a><br/>
		7.<a href="<%=cp %>/join/logout.do">로그아웃</a><br/>
	</c:otherwise>
</c:choose>


</h1>

</body>
</html>




































