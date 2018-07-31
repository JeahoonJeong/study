<%@page import="util.MyUtil"%>
<%@page import="com.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();
	
	Connection conn = DBconn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	//페이징-----------------------------------
	MyUtil myUtil = new MyUtil();
	
	String pageNum = request.getParameter("pageNum");//client한테 넘어온 페이지 번호
	
	int currentPage = 1;
	
	//처음 실행시 null
	if(pageNum!=null){
		currentPage = Integer.parseInt(pageNum);
	}
	
	//전체데이터 구하기
	int dataCount = dao.getDataCount();
	
	//전체데이터를 기준으로 총 페이지 수 계산
	int numPerPage = 3;
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	//전체 페이지수 보다 표시할 페이지수가 큰경우 페이지 조정
	//삭제가 되어 실제 totalPage의 수가 변경되었는데 업데이트 되지 않았을 경우
	if(currentPage>totalPage){
		currentPage=totalPage;
	}
	
	//데이터 베이스에서 가져올 시작과 끝위치
	int start = (currentPage-1)*numPerPage+1;
	int end = currentPage*numPerPage;
	
	List<BoardDTO> lists = dao.getLists(start,end);
	
	//페이징 처리
	String listUrl = "list.jsp";
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
	//-----------------------------------------
	
	
	DBconn.close();
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게 시 판(JSP)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<link rel="stylesheet" href="<%=cp%>/board/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/board/css/list.css" type="text/css"/>

</head>

<body>
<!-- 전체 DIV -->
<div id="bbsList">
	<!-- 타이틀 -->
	<div id="bbsList_title">
	게 시 판(JSP)
	</div>
	<!-- 검색, 글올리기 버튼 -->
	<div id="bbsList_header">
		<!-- 검색 -->
		<div id="leftHeader">
		  <form name="searchForm" method="post" action="">
			<select name="searchKey" class="selectFiled">
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchValue" class="textFiled"/>
			<input type="button" value=" 검 색 " class="btn2" onclick=""/>
		  </form>
		</div>
		<!-- 글올리기 버튼 -->
		<div id="rightHeader">
			<input type="button" value=" 글올리기 " class="btn2" 
				onclick="javascript:location.href='<%=cp%>/board/created.jsp';"/>
		</div>
	</div>
	<!-- 번호, 제목, 작성자, 작성일, 조회수  -->
	<div id="bbsList_list">
		<div id="title">
			<!-- The <dl> tag defines a description list -->
			<!-- The <dl> tag is used in conjunction with <dt> and <dd> -->
			<dl>
				<!-- <dt> (defines terms/names) -->
				<dt class="num">번호</dt>
				<dt class="subject">제목</dt>
				<dt class="name">작성자</dt>
				<dt class="created">작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		</div>
		<!-- 번호 제목, 작성자, 작성일, 조회수 데이터베이스에 저장된 각각의 데이터-->
		<div id="lists">
			<%for(BoardDTO dto : lists) {%>
			<dl>
				<!-- <dd> (describes each term/name) -->
				<dd class="num"><%=dto.getNum() %></dd>
				<dd class="subject"><%=dto.getSubject() %></dd>
				<dd class="name"><%=dto.getName() %></dd>
				<dd class="created"><%=dto.getCreated() %></dd>
				<dd class="hitCount"><%=dto.getHitCount() %></dd>
			</dl>
			<%} %>
		</div>
		<!-- 페이징 -->
		<div id="footer">
			<p>
				<%if(dataCount!=0){ %>
					<%=pageIndexList %>
				<%}else{ %>
					등록된 게시물이 없습니다.
				<%} %>
			</p>
		</div>
	</div>
</div>
</body>

</html>