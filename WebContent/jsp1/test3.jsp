<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");%>

<!-- 메소드 만드는 방법 -->
<%!
	int a = 0;
	
	int sum(int x){
		
		int s = 0;
		for(int i = 1 ; i<=x ; i++){
			s=+i;
		}
		
		return s;
	}
%>


<%

	int i = 10;

	int result = sum(i);

%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
		out.write(i+" result: "+i);
	
	%>

</body>
</html>