<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();	
	
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적처리 입력화면</title>

	<script type="text/javascript">
	
		function sendIt() {
			
			var f = document.myForm;
			
			if(!f.hak.value){
				alert("학번을 입력하세요.");
				f.hak.focus();
				return;
			}
			
			//http://192.168.16.25:8080/study 의 실제 위치.
			//D:\java\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost
			
			// http://192.168.16.25:8080/study 이후에 들어갈 텍스트를 적는다.
			//f.action = "http://192.168.16.25:8080/study/Score/write_ok.jsp"
			//cp 는 http://192.168.16.25:8080/study
			
			f.action = "<%=cp%>/score/write_ok.jsp";
			
			
			f.submit();
			
		}
	
	</script>
	
	<style type="text/css">
	
		*{
			padding: : 0px;
			margin: 0px;
		}
		
		td{
			font-size: 9pt;
		}
		
		.txtField{
			font-size: 1pt solid;
		}
		.btn{
			font-size: 9pt;
			background: #e6e6e6;
		}
	
	</style>
	

</head>
<body>
	<br/><br/>
	
	<table width="500" cellpadding="0" cellspacing="3" align="center" bgcolor="#e4e4e4">
		<tr>
			<td bgcolor="#ffffff" style="padding-left: 10px">
				<b>성적처리 입력화면</b>
			</td>
		</tr>
	</table>
	
	
	<br/>
	
	<form action="" name="myForm" method="post">
		<table width="500" align="center" cellpadding="0" cellspacing="0">
			<tr height="2" >
				<td colspan="2" bgcolor="#cccccc"></td>
			</tr>
			
			<!-- 학번 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">학번</td>
				<td style="padding-left: 5px">
					<!-- db의 hak컬럼의 데이터 형식이 varchar2(10) -->
					<!-- maxlength를 사용하여 제한한다. -->
					<input type="text" name="hak" size="10" maxlength="7" class="txtField"/>
				</td>
			</tr>
			
			<!-- 이름 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">이름</td>
				<td style="padding-left: 5px">
					<input type="text" name="name" size="20" maxlength="10" class="txtField"/>
				</td>
			</tr>
			
			<!-- 국어 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">국어</td>
				<td style="padding-left: 5px">
					<input type="text" name="kor" size="20" maxlength="3" class="txtField"/>
				</td>
			</tr>
			
			<!-- 영어 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">영어</td>
				<td style="padding-left: 5px">
					<input type="text" name="eng" size="20" maxlength="3" class="txtField"/>
				</td>
			</tr>
			
			<!-- 수학 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">수학</td>
				<td style="padding-left: 5px">
					<input type="text" name="mat" size="20" maxlength="3" class="txtField"/>
				</td>
			</tr>
			
			<tr height="2" >
				<td colspan="2" bgcolor="#cccccc"></td>
			</tr>
			
			<tr height="35">
				<td align="center" colspan="2">
					
					<input type="button" class="btn" value="입력완료" onclick="sendIt();"/>
					<!-- form안의 모든 데이터를 지운다. -->
					
					<input type="reset" class="btn" value="다시입력" onclick="document.myForm.hak.focus();"/>
					
					<input type="button" class="btn" value="입력취소" 
					onclick="javascript:location.href='<%=cp%>/score/list.jsp';">
					<!-- onclik에서 사용된 텍스트는 자주 사용되니 암기하는게 좋다. -->
				</td>
			</tr>
		</table>
	</form>

</body>
</html>









































