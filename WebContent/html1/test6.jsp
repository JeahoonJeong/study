<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


*get post 같은 name의 변수를 동시에 보냈을때 get이 우선한다.<br/>
<form action="test6_ok.jsp?ok=okGet&ok2=ok2Get" method="post">

	<input type="text" value="okPost" name="ok">
	<input type="text" value="ok1Post" name="ok1">
	<input type="text" value="ok2Post" name="ok2">
	<button value="ok" >ok</button>
	
</form>

<br/>


*form태그 get방식으로 보낼경우 aaction태그뒤의 파라미터는 무시되고 form태그 안의 value,name으로 다시 설정된다.<br/>
<form action="test6_ok.jsp?ok=okGetUrl&ok1=ko1Get&ok2=ok2Get" method="get">

	<input type="text" value="okGetForm" name="ok">
	<input type="text" value="ok1GetForm" name="ok1">
	<input type="text" value="ok2GetForm" name="ok2">
	<button value="ok" >ok</button>
	
</form>



<br/>

<form action="" name="btn1" method="post">
	<input type="button" name="text" value="textTest" onclick="sendIt()">
</form>


<script type="text/javascript">

	function sendIt() {
		document.btn1.action = "test6_ok.jsp";
		document.btn1.submit();
	}
	

</script>

</body>
</html>