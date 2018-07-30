<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");%>
	
<% 
	
	int dan = Integer.parseInt(request.getParameter("dan"));
	
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%=dan %>단<br/>

<% 
	
	for(int i =1; i<=9; i++){
		
		int num = i*dan;
		
		out.write(dan+"*"+i+"="+num+"<br/>");
	%>
		
	<!-- <%=num %><br/>  -->
	
	<% 
	}

%>

</body>
</html>