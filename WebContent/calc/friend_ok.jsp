<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");%>
	
<jsp:useBean id="vo" class="com.calc.FriendVO" scope="page"/>
<jsp:setProperty property="*" name="vo"/>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

이름 : <%=vo.getName() %><br/>
나이 : <%=vo.getAge() %><br/>
성별 : <%=vo.getGender() %><br/>
이상형 :<%=vo.getType() %><br/>

</body>
</html>