<%@page import="com.board.BoardDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
	
<jsp:useBean id="dto" class="com.board.BoardDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>	
<!-- created 에서 5개의 정보가 넘어옴, 2개의 데이터는 dao.insertData()에서 설정 -->
<!-- name,pwd,email,subject,content -->
<!-- hitcount,created -->
<!-- num,ipaddr 설정한다. -->
<!-- 이 페이지에서 나머지 2개를 설정해야 한다. -->

<% 
	
	Connection conn = DBconn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int maxNum = dao.getMaxNum();
	
	dto.setNum(maxNum+1);
	dto.setIpAddr(request.getRemoteAddr());
	
	dao.insertData(dto);
	
	DBconn.close();
	
	response.sendRedirect(cp+"/board/list.jsp");
	
%>	