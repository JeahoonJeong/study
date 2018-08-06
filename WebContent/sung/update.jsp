<%@page import="com.score.ScoreDTO"%>
<%@page import="com.score.ScoreDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	
	String cp = request.getContextPath();
	
	String pageNum = request.getParameter("pageNum");
	
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적처리 수정화면</title>

	<script type="text/javascript">
	
		function sendIt() {
			
			var f = document.myForm;
			
			if(!f.kor.value){
				alert("국어점수를 입력하세요.");
				f.kor.focus();
				return;
			}
			
			f.action = "<%=cp%>/sscore/update_ok.do?pageNum=<%=pageNum%>";
			
			
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
				<b>성적처리 수정화면</b>
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
				<td style="padding-left: 5px">${hak }
					<!-- update_okjsp에 hak 데이터를 넘겨주지 못하기 때문에 hidden type으로 넘겨준다. -->
					<input type="hidden"  name="hak" value="${hak }">
				</td>
				
			</tr>
			
			<!-- 이름 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">이름</td>
				<td style="padding-left: 5px">${name } </td>
			</tr>
			
			<!-- 국어 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">국어</td>
				<td style="padding-left: 5px">
					<input type="text" name="kor" size="20" maxlength="3" class="txtField" value="${kor }"/>
				</td>
			</tr>
			
			<!-- 영어 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">영어</td>
				<td style="padding-left: 5px">
					<input type="text" name="eng" size="20" maxlength="3" class="txtField" value="${eng }"/>
				</td>
			</tr>
			
			<!-- 수학 -->
			<tr height="30">
				<td align="center" width="100" bgcolor="#e6e6e6">수학</td>
				<td style="padding-left: 5px">
					<input type="text" name="mat" size="20" maxlength="3" class="txtField" value="${mat }"/>
				</td>
			</tr>
			
			<tr height="2" >
				<td colspan="2" bgcolor="#cccccc"></td>
			</tr>
			
			<tr height="35">
				<td align="center" colspan="2">
					
					<input type="button" class="btn" value="수정완료" onclick="sendIt();"/>
					
					<input type="button" class="btn" value="수정취소" 
					onclick="javascript:location.href='<%=cp%>/sscore/list.do?pageNum=<%=pageNum%>';">
					<!-- onclik에서 사용된 텍스트는 자주 사용되니 암기하는게 좋다. -->
				</td>
			</tr>
		</table>
	</form>

</body>
</html>









































