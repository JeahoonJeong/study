<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	
	function test1(color){
		
		document.bgColor = color;
		
	}
	
	function idpwCheck(){
		
		var f = document.myform;
		
		if(f.id.value==""){
			alert("아이디를 입력하세요");
			f.id.focus();
			return;
		}
		
		if(!f.pw.value){
			alert("패스워드를 입력하세요");
			f.pw.focus();
			return;
		}
		
		alert("로그인 성공!!");
		
	}
	
</script>

</head>
<body>

배경색 선택하기<br/>
<input type="radio" value="red" onclick="test1('red');" name="r1">
<input type="radio" value="blue" onclick="test1('blue');" name="r1" checked="checked">
<input type="radio" value="white" onclick="test1('white');" name="r1">
<input type="radio" value="yellow" onclick="test1('yellow');" name="r1">
<br/><br/><br/>
<hr color="red" size="3">

<form action="" name="myform" >
	<table style="font-size: 10pt; font-family: 돋움;" cellpadding="3">
		<tr>
			<td><b>아이디</b></td>
			<td><input type= "text" style="width: 100pt; height: 13pt" name="id"/></td>
			<td></td>
		</tr>
		<tr>
			<td><b>패스워드</b></td>
			<td><input type= "password"style="width: 100pt; height: 13pt" name ="pw"/></td>
			<td>
			<!-- 
				<a href="javascript:idpwCheck();">
					<img src="../image/btn_login.gif">
				</a>
		     -->
		     <input type="button" value="로그인" onclick="idpwCheck();">
			</td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<input type= "checkbox">아이디저장
			<input type= "checkbox" checked="checked">보안접속
			</td>
			<td></td>
		</tr>
		
		<tr height="1">
			<td colspan="3" bgcolor="red"></td>
		</tr>
		
	</table>
</form>
	<br/><br/><br/>
	<hr color="red" size="3">

</body>
</html>