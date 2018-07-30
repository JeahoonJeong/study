<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp1/test1</title>

<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		if(!f.su1.value){
			
			alert("su1을 입력하시오");
			f.su1.focus();
			return;
		}
		
		if(!f.su2.value){
			
			alert("su2을 입력하시오");
			f.su2.focus();
			return;
		}
		
		if(!f.name.value){
			
			alert("이름을 입력하시오");
			f.name.focus();
			return;
		}
		
		f.action = "test1_ok.jsp";
		f.submit();
		
	}

</script>
</head>
<body>
	<form action="test1_ok.jsp" name="myForm" method="get">
	
		수1:<input type="text" name="su1"><br/>
		수2:<input type="text" name="su2"><br/>
		이름:<input type="text" name="name"><br/>
		<!-- <input type="submit" value="결과" ><br/> -->
		<input type="button" value="결과" onclick="sendIt();"><br/>
	</form>
</body>
</html>