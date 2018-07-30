<%@page import="com.register.NaverDAO"%>
<%@page import="com.register.NaverDTO"%>
<%@page import="java.util.List"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	Connection conn = DBconn.getConnection();
	NaverDAO dao = new NaverDAO(conn);
	
	List<NaverDTO> lists = dao.getList();
	
	DBconn.close();
	
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">
	
		*{
			padding: : 0px;
			margin: 0px;
		}
		
		td{
			font-size: 9pt;
		}
	
		}
		.btn{
			font-size: 9pt;
			background: #e6e6e6;
		}
	
	</style>

</head>
<body>

<br/><br/>

<table width="700" cellpadding="0" cellspacing="3" align="center" bgcolor="#e4e4e4">
	<tr>
		<td bgcolor="#ffffff" style="padding-left: 10px"><b>등록된 아이디 리스트</b></td>
	</tr>
</table>
<br/>


<table width="800" cellpadding="0" cellspacing="3" align="center">
	<tr height="35">
		<td align="right">
			<input type="button" class="btn" value="등록하기" 
			onclick="javascript:location.href='<%=cp %>/register/register.jsp';" />
		</td>
	</tr>
</table>

<table width="800" cellpadding="0" cellspacing="3" align="center" bgcolor="#cccccc">
	<tr height="30">
		<td align="center" bgcolor="#e6e6e6" width="80">id</td>
		<td align="center" bgcolor="#e6e6e6" width="80">name</td>
		<td align="center" bgcolor="#e6e6e6" width="60">nickname</td>
		<td align="center" bgcolor="#e6e6e6" width="60">pwd</td>
		<td align="center" bgcolor="#e6e6e6" width="60">email</td>
		<td align="center" bgcolor="#e6e6e6" width="60">tel</td>
		<td align="center" bgcolor="#e6e6e6" width="60">question</td>
		<td align="center" bgcolor="#e6e6e6" width="60">answer</td>
		<td align="center" bgcolor="#e6e6e6" width="130">수정</td>
	</tr>


<% 
	for(NaverDTO dto : lists){
%>	
	<tr height="30">
		<td align="center" bgcolor="#ffffff"><%=dto.getUserid() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getUsername() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getUsernickname() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getUserpwd() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getUseremail() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getUsertel() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getUserquestion() %></td>
		<td align="center" bgcolor="#ffffff"><%=dto.getUseranswer() %></td>
		<td align="center" bgcolor="#ffffff">
			<a href="<%=cp %>/register/update.jsp?userid=<%=dto.getUserid()%>">수정</a> 
			<a href="<%=cp %>/register/delete_ok.jsp?userid=<%=dto.getUserid()%>">삭제</a>
		</td>
	</tr>
	
<% 		
	}

%>

</table>
</body>
</html>






















