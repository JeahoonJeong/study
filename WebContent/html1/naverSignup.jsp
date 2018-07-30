<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>네이버 : 회원가입</title>

<style> 

input[type="text"]{ 
	padding: 15px 15px; 
	border-color: #DADADA; 
	border-style: solid; 
	border-width: thin;
	
}

table{
	padding: 0px 0px 0px 0px;
	width: 420px;
}


.button {
    background-color: #08A600;
    border: none;
    color: white;
    padding: 15px 15px;
    text-align: center;
    font-size: 18px;
    cursor: pointer;
    width: 475px;
    height: 70px;
}
b{font-size: 10pt; font-family: 굴림;}

.button1 {
    background-color: #08A600;
    border: none;
    color: white;
    padding: 15px 5px;
    text-align: center;
    font-size: 12px;
    cursor: pointer;
    height: 48px;
    width: 140px;
    
}

input[type="button"] {
    background-color: white;
    border: none;
    color: black;
    padding: 15px 0px;
    text-align: center;
    font-size: 12px;
    cursor: pointer;
    height: 50px;
    width: 235px;
    
}

select {
	
    border: none;
    color: black;
    padding: 5px 15px;
    text-align: center;
    font-size: 20px;
    cursor: pointer;
    height: 48px;
    width: 475px;
}

select.sel1{
    background-color: white;
    color: black;
    padding: 0px 10px 5px 5px;
    text-align: center;
    font-size: 20px;
    height: 48px;
    width: 150px;
}

</style>

</head>
<body bgcolor="#F5F6F7">
	<br/>
	<br/>
	<p align="center">
		<img alt="" src="../image/naver.JPG" ><br/>
	</p>
	
	
	<table align="center" border="0" cellspacing="0"  >
		
		<tr height="30">
			<td><br/><b>아이디</b></td>
		</tr>
		<tr height="60">
			<td>
				<input type="text"  size="70" >
			</td>
		</tr>
		
		
		
		<tr>
			<td><br/><b>비밀번호</b></td>
		</tr>
		<tr height="60">
			<td>
				<input type="text" size="70"/>
			</td>
		</tr>
		
	
		
		<tr>
			<td><br/><b>비밀번호 재확인</b></td>
		</tr>
		<tr height="60">
			<td>
				<input type="text" size="70"/>
			</td>
		</tr>
		
		
		
		<tr>
			<td><br/><b>이름</b></td>
		</tr>
		<tr height="60">
			<td>
				<input type="text" size="70"/>
			</td>
		</tr>
		
		
		<tr>
			<td><br/><b>생년월일</b></td>
		</tr>
		<tr height="60">
			<td>
				<input type="text" size="16"/>
			
				<select class="sel1">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
			
				<input type="text" size="16"/>
			</td>
		</tr>
		
		
		<tr height="60">
			<td>
			<table>
				<tr>
					<td>
						<input type="button" value="남자"/>
					</td>
					<td>
						<input type="button" value="여자"/>
					</td>
				</tr>
			</table>
			</td>
		</tr>
		
		<tr>
			<td><br/><b>본인 확인 이메일</b></td>
		</tr>
		<tr height="60">
			<td>
				<input type="text" size="70"/>
			</td>
		</tr>
		
		
		<tr>
			<td><br/><b>휴대전화</b></td>
		</tr>
		<tr height="60">
			<td>
				<select>
					<option>대한민국 +82</option>
					<option>가나 +233</option>
				</select>
			</td>
		</tr>
		
		<tr height="60">
			<td>
				<input type="text" size="45" align="middle">
				<!--<input type="button" value="인증번호 받기">-->
				<button class="button1" >인증번호 받기</button>
			</td>
		</tr>
		
		<tr height="60">
			<td>
				<input type="text" size="70"> 
			</td>
		</tr>
		
		
		<tr height="60">
			<td align="center">
				<br/>
				<!-- <input type="button" value="가입하기" width="70">  -->
				<button class="button" >가입하기</button>
			</td>
		</tr>
		
		
		<tr align="center">
			<td align="center">
				<br/>
				<a href="www.naver.com"><font size="2">이용약관</font></a> |
				<a href="www.naver.com"><font size="2">개인정보처리방침</font></a> |
				<a href="www.naver.com"><font size="2">책임의 한계와 법적고지</font></a> |
				<a href="www.naver.com"><font size="2">회원정보 고객센터</font></a> 
			</td>
		</tr>
		
		<tr align="center">
			<td align="center">
				@<a href="www.naver.com"><font size="2">NAVER Corp.</font></a>
			</td>
		</tr>
		
	</table>
	
	
</body>
</html>