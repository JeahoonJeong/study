<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");%>

<%
	int n = 0;
	int width = Integer.parseInt(request.getParameter("width"));
	int height = Integer.parseInt(request.getParameter("height"));
	
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" cellpadding="0" cellspacing="0" width="600">
		
		<%
			for(int i = 1; i<=height; i++){
				
				out.print("<tr>");//html 영역의 tr을 내장객체를 이용하여 사용한다.
				for(int j =1; j<=width; j++){
					n++;
		%>
			<td width ="50"><%=n %></td>
		<% 	
				}
				
				out.print("</tr>");
			}
		%>
		
	</table>
</body>
</html>