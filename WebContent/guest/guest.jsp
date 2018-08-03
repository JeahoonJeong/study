<%@page import="java.util.List"%>
<%@page import="util.MyUtil"%>
<%@page import="com.guest.GuestDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.guest.GuestDTO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String cp = request.getContextPath();

	Connection conn = DBconn.getConnection();
	GuestDAO dao = new GuestDAO(conn);

	//페이징-----------------------------------
	MyUtil myUtil = new MyUtil();

	String pageNum = request.getParameter("pageNum");//client한테 넘어온 페이지 번호

	int currentPage = 1;

	//처음 실행시 null
	if (pageNum != null) {
		currentPage = Integer.parseInt(pageNum);
	}

	//전체데이터 구하기
	int dataCount = dao.getDataCount();

	//전체데이터를 기준으로 총 페이지 수 계산
	int numPerPage = 3;
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);

	//전체 페이지수 보다 표시할 페이지수가 큰경우 페이지 조정
	//삭제가 되어 실제 totalPage의 수가 변경되었는데 업데이트 되지 않았을 경우
	if (currentPage > totalPage) {
		currentPage = totalPage;
	}

	//데이터 베이스에서 가져올 시작과 끝위치
	int start = (currentPage - 1) * numPerPage + 1;
	int end = currentPage * numPerPage;

	List<GuestDTO> lists = dao.getListData(start, end);

	//페이징 처리
	String listUrl = "guest.jsp";//검색기능을 추가하지 않았다.
								 //list.jsp?searchKey=subject&sarchValue='수지'
	String pageIndexList = myUtil.pageIndexList(currentPage, totalPage,
			listUrl);
	//-----------------------------------------

	DBconn.close();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>방 명 록(JDBC 사용)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" href="<%=cp%>/guest/data/style.css"
	type="text/css" />
<link rel="stylesheet" href="<%=cp%>/guest/data/guest.css"
	type="text/css" />

</head>

<body>

	<div id="bbs">
		<div id="bbs_title">방 명 록(JDBC 사용)</div>

		<form name="myForm" method="post" action="">
			<div id="bbsCreated">

				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>작성자</dt>
						<dd>
							<input type="text" name="name" size="35" maxlength="20"
								class="boxTF" />
						</dd>
					</dl>
				</div>

				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>E-Mail</dt>
						<dd>
							<input type="text" name="email" size="35" maxlength="50"
								class="boxTF" />
						</dd>
					</dl>
				</div>

				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>홈페이지</dt>
						<dd>
							<input type="text" name="homepage" size="35" maxlength="50"
								class="boxTF" value="http://" />
						</dd>
					</dl>
				</div>

				<div id="bbsCreated_content">
					<dl>
						<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
						<dd>
							<textarea name="content" cols="63" rows="12" class="boxTA"></textarea>
						</dd>
					</dl>
				</div>

			</div>

			<div id="bbsCreated_footer">
				<input type="button" value=" 등록하기 " class="btn2" onclick="sendIt();" />
				<input type="reset" value=" 다시입력 " class="btn2"
					onclick="document.myForm.name.focus();" />
			</div>


			<div id="lists">
				<dl>
					<%
						for (GuestDTO dto : lists) {
					%>
					<dt style="font-weight: bold;">
						No&nbsp;<%=dto.getNum()%>. &nbsp;<%=dto.getName()%>(<%=dto.getEmail()%>)
					</dt>
					<dt style="text-align: right">
						<% if(dto.getHomepage().equals("")){}else{ %>
							홈페이지:<%=dto.getHomepage() %>
						<%} %>
					</dt>
					<dt >
						작성일: <%=dto.getCreated()%>(<%=dto.getIpAddr()%>)
					</dt>
					<dt style="text-align: right">
						<a href="delete.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">삭제</a>

					</dt>
					<dd >
						<%=dto.getContent().replaceAll("\n", "<br/>")%>
					</dd>

					<%
						}
					%>

				</dl>
			</div>



		</form>



		<!-- 페이징 -->
		<div id="footer">
			<p>
				<%
					if (dataCount != 0) {
				%>
				<%=pageIndexList%>
				<%
					} else {
				%>
					<dl>등록된 게시물이 없습니다.</dl>
				<%
					}
				%>
			</p>
		</div>

	</div>




	<script src="./data/guest.js"></script>
</body>

</html>