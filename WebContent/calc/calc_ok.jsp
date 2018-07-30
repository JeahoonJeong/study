<%@page import="com.calc.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper");
	/*
	Calc ob = new Calc();
	ob.setOper(oper);
	ob.setSu1(su1);
	ob.setSu2(su2);
	
	String str = ob.result();
	*/
	
%>
  
<jsp:useBean id="ob" class="com.calc.Calc" scope="page"/>
<jsp:setProperty property="su1" name="ob" value="<%=su1 %>"/>
<jsp:setProperty property="su2" name="ob" value="<%=su2 %>"/>
<jsp:setProperty property="oper" name="ob" value="<%=oper %>"/>

<!-- <jsp:useBean id="ob" class="com.calc.Calc" scope="page"/>
<jsp:setProperty property="*" name="ob" />
jsp파일의변수이름과 class변수이름이 정확히 같아야 한다. db를 사용한다면 column이름도 같아야한다-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



결과 : <%=ob.result()%>

</body>
</html>