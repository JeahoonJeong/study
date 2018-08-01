
<%@page import="java.net.URLEncoder"%>
<%@page import="com.board.BoardDTO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="util.DBconn"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();

	int num = Integer.parseInt(request.getParameter("num"));
	
	String pageNum = request.getParameter("pageNum");
	
	Connection conn = DBconn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	
	// 검색--------------------------------------------
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		
		if(searchKey!=null){
			
			if(request.getMethod().equalsIgnoreCase("GET")){
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
				//디코딩
			}
		}else{
			searchKey ="subject";
			searchValue="";
		}
		
	//----------------------------------------------------
	
	
	
	
	//조회수 증가
	dao.updateHitCount(num);
	
	//글 가져오기
	
	BoardDTO dto = dao.getReadData(num);
	
	if(dto==null){
		response.sendRedirect(cp+"/board/list.jsp");
	}
	
	//글 라인수
	
	int lineNum = dto.getContent().split("n").length;
	//HTTP Status 500 – Internal Server Error
	//java.lang.NullPointerException 처리
	//dao에서 sql문 오타 실수. (hitcont) hicount를 받아오지 못함
	
	//엔터를 <br/>로 변경
	dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
	
	
	//검색---------------------------------
	
	String param ="";
	if(!searchValue.equals("")){
		
		param = "&searchKey="+searchKey;
		param +="&searchValue="+ URLEncoder.encode(searchValue, "UTF-8");
		
	}
	
	
	
	DBconn.close();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게 시 판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link rel="stylesheet" href="<%=cp%>/board/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/board/css/article.css" type="text/css"/>

</head>

<body>

<div id="bbs">
	<div id="bbs_title">
	게 시 판
	</div>
	<div id="bbsArticle">
		<div id="bbsArticle_header">
			<%=dto.getSubject() %>
		</div>
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd><%=dto.getName() %></dd>
				<dt>줄수</dt>
				<dd><%=lineNum %></dd>
			</dl>
		</div>
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<dd><%=dto.getCreated() %></dd>
				<dt>조회수</dt>
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div>
		<div id="bbsArticle_content">
			<table width="600" border="0">
			<tr><td style="padding: 20px 80px 20px 62px;" valign="top" height="200">
			<%=dto.getContent() %>
			</td></tr>
			</table>
		</div>
		<!-- 나중에 다시 사용될 수 있다.
		<div class="bbsArticle_bottomLine">
			이전글 : 작업중
		</div>
		<div class="bbsArticle_noLine">
			다음글 : 작업중
		</div>
		 -->
	</div>
	<div class="bbsArticle_noLine" style="text-align:right">
		    From : <%=dto.getIpAddr() %>
	</div>
	<div id="bbsArticle_footer">
		<div id="leftFooter">
               <input type="button" value=" 수정 " class="btn2" 
               	onclick="javascript:location.href='<%=cp %>/board/update.jsp?pageNum=<%=pageNum %>&num=<%=num%><%=param%>';"/>
               	<!-- 오타일 경우 아무런 동작을 하지 않는다. 에러메세지도 출력 하지 않는다. 조심-->
               <input type="button" value=" 삭제 " class="btn2" 
               	onclick="javascript:location.href='<%=cp %>/board/delete_ok.jsp?pageNum=<%=pageNum %>&num=<%=num %>';"/>
		</div>
		<div id="rightFooter">
               <input type="button" value=" 리스트 " class="btn2" 
               	onclick="javascript:location.href='<%=cp %>/board/list.jsp?pageNum=<%=pageNum%><%=param%>';"/>
		</div>
	</div>

</div>

<br/>&nbsp;<br/>
</body>

</html>





















