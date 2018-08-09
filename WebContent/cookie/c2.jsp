<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//배열로 받음
	Cookie[] c = request.getCookies();
	
	for(Cookie i : c){
		c[j]
	}
	
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="item"  items="<%=c %>">
	${item.name} :  ${item.value }<br/>
</c:forEach>

<br/>

<%
	if(c!=null){
		
		for(Cookie ck : c){
			
			out.print("쿠키이름:");
			out.print(ck.getName());
			out.print(", 쿠키값:");
			String str = ck.getValue();
			if(ck.getName().equals("addr")){
				str = URLDecoder.decode(str, "UTF-8");
			}
			out.print(str+"<br/>");
			
		}
		
	}
%>


</body>
</html>