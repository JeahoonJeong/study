<%@page import="util.DBconn"%>
<%@page import="com.register.NaverDTO"%>
<%@page import="com.register.NaverDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String userid = request.getParameter("userid");
	
	Connection conn = DBconn.getConnection();
	
	NaverDAO dao = new NaverDAO(conn);
	
	NaverDTO dto = dao.getReadData(userid);
	
	DBconn.close();
	
	if(dto==null){
		response.sendRedirect("list.jsp");
	}
	
	
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>naver: 회원가입</title>

<script type="text/javascript">

//이메일 두번째 칸 입력 함수
function emailCheck(){
	
	var f = document.mainForm;
	var clength = f.sel1.options.length;
	var cvalue = f.sel1.selectedIndex;
	
	f.email2.value = "";
	
	if(cvalue==(clength-1)){
		f.email2.readOnly = false;
		f.email2.focus();
	}else{
		f.email2.value = f.sel1.options[cvalue].value;
		f.email2.readOnly = true;
	}
	
}


function usernameCheck(){
	
	var f = document.forms[0];
	
	if(!f.username.value){
		
		alert("이름");
		f.focus();
		return;
	}
	
	f.action = "register_ok.jsp";
	
	f.submit();
	
}

function useridCheck(){
	
	var f = document.forms[1];
	
	if(!f.userid.value){
		
		alert("아이디");
		f.focus();
		return;
	}
	
	f.action = "register_ok.jsp";
	
	f.submit();
	
}


//마지막 확인 버튼 클릭시 
function finalCheck() {
	
	var f = document.mainForm;
	
	if(!f.username.value){	
		alert("이름");
		f.username.focus();
		return;
	}
	
	if(!f.userid.value){	
		alert("아이디");
		f.userid.focus();
		return;
	}
	
	if(!f.usernickname.value){	
		alert("별명");
		f.usernickname.focus();
		return;
	}
	
	if(!f.userpwd.value){	
		alert("비밀번호");
		f.userpwd.focus();
		return;
	}
	
	if(!f.userPW2.value){	
		alert("비밀번호 확인");
		f.userPW2.focus();
		return;
	}
	
	if(f.userpwd.value!=f.userPW2.value){
		alert("비밀번호가 같지 않습니다.");
		f.userpwd.focus();
		return;
	}
	
	if(!f.useremail.value){
		alert("이메일을 입력하세요.")
		f.useremail.focus();
		return;
	}
	
	if(!f.email2.value){
		alert("이메일을 입력하세요.")
		f.email2.focus();
		return;
	}
	
	if(f.usertel.selectedIndex==0){
		alert("전화번호를 입력하세요")
		f.usertel.focus();
		return;
	}
	
	if(!f.tel2.value){
		alert("전화번호를 입력하세요")
		f.tel2.focus();
		return;
	}
	
	if(!f.tel3.value){
		alert("전화번호를 입력하세요")
		f.tel3.focus();
		return;
	}
	
	if(!f.useranswer.value){
		alert("답변을 입력하세요")
		f.useranswer.focus();
		return;
	}
	
	
	
	
	f.action = "<%=cp%>/register/update_ok.jsp";
	
	f.submit();
	
}


//이메일 등록안함 체크
/*
function emailCheck() {
	if(document.emailForm["emailCheckbox"].checked==true)
		alert("이메일을 등록하지 않습니다.")
}
*/



</script>

<style type="text/css">

input[type="text"]{ 
	border-color: #DADADA; 
	border-style: solid; 
	border-width: thin;}
select {
	border-color: #DADADA; 
	border-style: solid; 
	border-width: thin;}

/* 전체 테이블 width*/
table {
	width: 700px;
}
/*아이디, 별명, 비밀번호, 비밀번호 확인 row*/
.fiverow{
	margin-left: 20px;
	margin-top: 5px;
	margin-bottom: 5px;
}
/*비밀번호 발급수단 row안의 테이블*/
table.password{
	width: 500px;
	height: 300px;
	padding-left: 30px;
	background-color: #F9F9F9;
	margin-left: 20px;
		
	
}

/* password 테이블 위의 문자열*/
.passinfo{
	margin-left: 20px;
}
/* password 테이블의 질문 박스*/ 
.box1{
	margin-left: 30px;
}
/* 질문1 select 박스 */
.select1{
	width: 400px;
}
/* 질문1 답변 박스*/
.useranswer{
	width: 400px;
}

/*이메일 첫번째박스*/
.useremail{
	width: 100px;
}
.email2{
	width: 100px;
}

/*전체 테이블을 감싸는 form*/
.total {
	padding-top: 30px;
}
/*checkImg 사이즈 조정*/
.checkImg{
	width: 13px;
	height: 13px;
}

/*메인테이블 왼쪽 컬럼*/
.leftCol{
	background-color: #F9F9F9;
	
	font-size: small;
	font-weight: bold;
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

.rightCol{
	border-bottom: 1px solid #ddd;
}

/*첫번째 테이블*/
.mainTable{
	height: 600px;
	border-bottom: 1px solid #ddd;
}

/*전화번호 입력 박스1*/
.usertel{
	width: 70px;
}
/*전화번호 입력 박스2*/
.tel2{
	margin-left: 5px;
	margin-right: 5px;
	width: 100px;
}
/*전화번호 입력 박스3*/
.tel3{
	margin-left: 10px;
	margin-right: 10px;
	width: 100px;
}
/* 비밀번호 발급수단 안의 테이블의 로우*/
.row1{
	height: 5px;
}






</style>


</head>
<body>
<p class="total">
<!-- 첫번째 테이블 -->

<table border="0" cellspacing="0"  align="center" >	
	<tr>
		<td><b>회원정보입력</b></td>
		<td></td>
	</tr>
	<!-- 라인 -->
	<tr>
		<td colspan="1" bgcolor="#E9E9E9"></td>
		<td colspan="1" bgcolor="#E9E9E9"></td>
	</tr>
	<!-- 개인정보 취급방침 -->
	<tr>
		<td>
			<font size="1pt" color="gray">회원정보는 개인정보취급방침에 따라 안전하게 보호되며 회원님의 명백한 동의 없이 공개 또는 제3자에게 제공되지 않습니다.</font>
			<a href="www.naver.com"><font size="2pt" color="#173664">개인정보취급방침</font></a>
		</td>
	</tr>
	
</table>

<br/>




<!-- 메인테이블 -->
<form action="" name="mainForm" method="post">
<table border="0" cellspacing="0"  align="center" class="mainTable">

	<!-- 표시 필수입력사항 -->
	<tr>
		<td >
		</td>
		<td align="right">
			<img alt="" src="../image/check.JPG" class="checkImg">
			<font size="2pt" color="gray">표시 필수입력사항</font>
		</td>
	</tr>
	<!-- 라인 -->
	<tr>
		<td colspan="2" bgcolor="#E9E9E9"></td>
	</tr>
	
	<!-- 이름 -->
	<tr>
		<td class="leftCol" height="35" >
			<img alt="" src="../image/check.JPG" class="checkImg">
			<font>이름</font>
		</td>
		<td class="rightCol">
				<font style="padding-left: 20px" size="2pt"> <%=dto.getUsername() %> </font>
				<input type="hidden" name="username" value="<%=dto.getUsername() %>">
			
		</td>
	</tr>
	<!-- 아이디 -->
	<tr>
		<td class="leftCol">
			<img alt="" src="../image/check.JPG" class="checkImg">
			<font>아이디</font>
		</td>
		<td class="rightCol">
			<font style="padding-left: 20px" size="2pt"><%=dto.getUserid() %>@naver.com</font>
			<input type="hidden" name="userid" value="<%=dto.getUserid() %>">
			<!--아이디 중복체크 -->
			<a href="javascript:doubleIdCheck();">
				<img alt="" src="../image/double.JPG" style="padding-top: px">
			</a><br/>
			
			<font size="2pt" color="gray" class="fiverow">입력하신 아이디로 네이버 이메일 주소가 생성됩니다.</font>
		</td>
	</tr>
	<!-- 별명 -->
	
	<tr>
		<td class="leftCol">
			<img alt="" src="../image/check.JPG" class="checkImg">
			<font>별명</font>
		</td>
		<td class="rightCol">
			<input type="text"  class="fiverow" name="usernickname">
		</td>
	</tr>
	
	<!-- 비밀번호 -->
	<tr>
		<td class="leftCol">
			<img alt="" src="../image/check.JPG" class="checkImg">
			<font>비밀번호</font>
		</td>
		<td class="rightCol">
			<input type="text"  class="fiverow" name="userpwd"> <a href="www.naver.com"><font size="2pt" color="#173664">비밀번호 도움말</font></a>
		</td>
	</tr>
	
	<!-- 비밀번호 확인 -->
	<tr>
		<td class="leftCol">
			<img alt="" src="../image/check.JPG" class="checkImg">
			<font>비밀번호 확인</font>
		</td>
		<td class="rightCol">
			<input type="text"  name="userPW2"  class="fiverow">
		</td>
	</tr>
	
	<!-- 비밀번호 발급수단 -->
	
	
	<tr>
		<td class="leftCol">
			<img alt="" src="../image/check.JPG" class="checkImg">
			<font>비밀번호 발급수단</font>
		</td>
		<td>
		
			<p class="passinfo">
				<font size="2pt" color="#E9BC7F">아래 항목은 아이디 확인, 임시비밀번호 발급 시 반드시 필요한 정보입니다.</font><br/>
				<font size="2pt" color="#E9BC7F">정확한 정보를 입력한 후 곡 기억해 주세요.</font>
			</p>
			
			<!-- td 안의 테이블  -->
			<table class="password" cellspacing="0" cellpadding="0" >
			
				<!-- 비밀번호 질문.답 -->
				<tr>
					<td class="row1"><font size="2pt"><b>1. 비밀번호 질문.답</b></font></td>
				</tr>
				
				<tr>
					<td class="row1" >
						<font size="2pt">질문</font>
						<select class="select1" name="userquestion">
							<option value="가장기억에 남는 장소는?">가장기억에 남는 장소는?</option>
							<option value="졸업한 초등학교는?">졸업한 초등학교는?</option>
							<option value="아버지 성함은?">아버지 성함은?</option>
							<option value="직접입력">직접입력</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td class="row1" ><font size="2pt" class="box1" >질문에서 직접입력을 선택하면 기입 가능합니다.</font></td>
				</tr>
				
				<tr>
					<td class="row1">
						<font size="2pt">답변</font>
						<input type="text" class="useranswer" name="useranswer">
					</td>
				</tr>
				
				<!-- 2.이메일 주소 -->
				
				<tr>
					<td class="row1" style="height: 5px"><font size="2pt"><b>2.이메일 주소</b></font></td>
				</tr>
				
				<tr>
					<td class="row1">	
							<input type="text" name="useremail" class="useremail">
							@
							<input type="text" name="email2" readonly="readonly" class="email2"/>
							<select name="sel1" onchange="emailCheck();">
								<option value="">선택하세요</option>
								<option value="naver.com">네이버</option>
								<option value="hanmail.net">다음</option>
								<option value="gmail.com">구글</option>
								<option value="yahoo.co.kr">야후</option>
								<option value="">직접입력</option>
							</select>
							<input type="checkbox" onclick="emailCheck();" name="emailCheckbox"><font size="2pt">등록안함</font>
			
					</td>
				</tr>
				
				<!-- 3.휴대폰 번호 -->
				<tr>
					<td class="row1"><font size="2pt"><b>3.휴대폰 번호</b></font></td>
				</tr>
				<tr>
					<td class="row1">
						<select class="usertel" name="usertel">
							<option value="">선택</option>
							<option value="010">010</option>
							<option value="011">011</option>
						</select>
						
						-<input type="text" class="tel2" name="tel2">-<input type="text" class="tel3" name="tel3">
						
						<input type="checkbox"><font size="2pt">등록안함</font>
						
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
	
	<!-- 소식지 수신 -->
	<tr>
		<td class="leftCol">
			<font style="padding-left: 20px">소식지 수신</font>
		</td>
		<td>
			<input type="checkbox" style="margin-left: 20px" ><font size="2pt">네이버 메일로 네이버 소식지를 수신합니다.</font>
		</td>
	</tr>
	<!-- 라인 -->
	<tr>
		<td colspan="2" bgcolor="#E9E9E9"></td>
	</tr>
</table>

</form>


<br/>


<table align="center">

	<tr>
		<td align="center">
			<!-- 확인버튼 -->

			<a href="javascript:finalCheck();" >
				<img alt="" src="../image/sendit.JPG" >
			</a>
			
			
			<br/>
			<br/>
			<br/>
		</td>
	
	</tr>
	
	<!-- 주석 -->
	<!-- 라인 -->
	<tr>
		<td colspan="1" bgcolor="#E9E9E9"></td>
	</tr>
	<tr>
		<td align="center" ><br/>
		<a href="www.naver.com" style="text-decoration:none"><font size="2pt" color="black">이용약관 |</font></a>
		<a href="www.naver.com" style="text-decoration:none"><font size="2pt" color="black" >개인정보취급방침</font></a>
		<a href="www.naver.com" style="text-decoration:none"><font size="2pt" color="black">| 책임의 한계와 법적고지</font></a>
		<a href="www.naver.com" style="text-decoration:none"><font size="2pt" color="black">| 게시중단요청서비스</font></a>
		<a href="www.naver.com" style="text-decoration:none"><font size="2pt" color="black">| 고객센터</font></a></td>
	</tr>
	<tr>
		<td align="center">
			<img alt="" src="../image/nhn.JPG"" style="width: 50px; padding-top: 10px;">
			<font size="2pt">Copyright ⓒ</font> <font size="2pt"><b>NHN Crop</b></font> <font size="2pt"> All Rights Reserved.</font>
		</td>
	</tr>
</table>
</p>
</body>
</html>
























