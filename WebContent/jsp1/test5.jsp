<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="test5_ok.jsp" method="post">
		
		이름:<input type="text" name="name"><br/>
		메모:<textarea rows="5" cols="30" name="memo"></textarea><br/>
		이상형:<br/>
		<input type="checkbox" name="type" value="웃는여자"/>웃는여자<br/>
		<input type="checkbox" name="type" value="b"/>타입b<br/>
		<input type="checkbox" name="type" value="c"/>c<br/>
		<input type="checkbox" name="type" value="d"/>d<br/>
		
		전공:<br/>
		<select name="major">
			<option value="a">a</option>
			<option value="b">b</option>
			<option value="c">c</option>
			<option value="d">d</option>
			<option value="e">e</option>
			
		</select>
		
		
		취미:<br/>
		
		<select name="hb" size="4" multiple="multiple">
			<option value="a">a</option>
			<option value="b">b</option>
			<option value="c">c</option>
			<option value="d">d</option>
			<option value="e">e</option>
			
		</select>
		
		
		
		<input type="submit" value="전송"/>
		
		
	</form>

</body>
</html>