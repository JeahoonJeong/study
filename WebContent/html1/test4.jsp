<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

<!--태그안의 글시는 바뀌지 않는다.-->
body {
	font-size: 11pt;
	
}

span.c1 {
	
	color: blue;
	
}

span.c2 {
	color: red;
}


</style>

</head>
<body>
	body안의 일반텍스트
	<h3>CSS(Cascade Style Sheet)</h3>
	<font size="7">폰트 7사이즈</font><br/>
	<font style="font-size: 9pt;">폰트 9사이즈</font><br/>
	<font style="font-size: 19pt;">폰트 19사이즈</font><br/>
	<font style="font-size: 29pt;">폰트 29사이즈</font><br/>
	<font style="font-size: 39pt;">폰트 39사이즈</font><br/>
	<font style="font-size: 69pt;">폰트 69사이즈</font><br/>
	
	<hr color="red" size="3">
	
	<table>
		<tr>
			<td><font color="blue" size="4">스타트업을 위한 웹사이트 제작을 돕는 성격이 강한 서비스. 최신 트렌드를 반영하는 다양한 템플릿을 제공한다. 기본적으로 무료지만 매달 저렴한 요금으로 파워풀한 옵션을 이용할 수 있는 유료 서비스도 있다</font></td>
			<td><font color="blue" size="4">스타트업을 위한 웹사이트 제작을 돕는 성격이 강한 서비스. 최신 트렌드를 반영하는 다양한 템플릿을 제공한다. 기본적으로 무료지만 매달 저렴한 요금으로 파워풀한 옵션을 이용할 수 있는 유료 서비스도 있다</font></td>
		</tr>
	</table>
	
	<table style="font-size: 10pt; color: blue">
		<tr>
			<td>스타트업을 위한 웹사이트 제작을 돕는 성격이 강한 서비스. 최신 트렌드를 반영하는 다양한 템플릿을 제공한다. 기본적으로 무료지만 매달 저렴한 요금으로 파워풀한 옵션을 이용할 수 있는 유료 서비스도 있다</td>
			<td>스타트업을 위한 웹사이트 제작을 돕는 성격이 강한 서비스. 최신 트렌드를 반영하는 다양한 템플릿을 제공한다. 기본적으로 무료지만 매달 저렴한 요금으로 파워풀한 옵션을 이용할 수 있는 유료 서비스도 있다</td>
		</tr>
	</table>
	
	<hr color="red" size="3">
	
	<table style="font-size: 10pt; font-family: 돋움;" cellpadding="3">
		<tr>
			<td><b>아이디</b></td>
			<td><input type= "text" style="width: 100pt; height: 13pt"/></td>
			<td></td>
		</tr>
		<tr>
			<td><b>패스워드</b></td>
			<td><input type= "password"style="width: 100pt; height: 13pt"/></td>
			<td><img src="../image/btn_login.gif"></td>
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
	<br/><br/><br/>
	<hr color="red" size="3">
	
	<span class="c1">스타트업</span>을 위한 웹사이트 제작을 돕는 성격이 강한 <span class="c2">서비스</span>. 최신 트렌드를 반영하는 다양한 템플릿을 제공한다. 기본적으로 무료지만 매달 저렴한 요금으로 파워풀한 옵션을 이용할 수 있는 유료 <span class="c2">서비스</span>도 있다
	
	
	
	
</body>
</html>