<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//com.svt.Test2에서 데이터를 넘겨받는다.
	String str = (String)request.getAttribute("result");
	//EL을 사용하면 request객체를 사용하지 않아도 데이터를 받을 수 있다.
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

request.getAttribute로 받은 데이터 : <%=str %>
<!-- test2.jsp에서 Test3 서블릿으로 가는 경로를 web.xml에 설정해야 출력된다. -->

<br/>

<!-- EL(Expression Language) -->
<!-- 서블릿에서 넘어온 데이터는 el을 이용하여 사용할수 있다. -->
EL을 사용하여 받은 데이터 : ${result }


</body>
</html>