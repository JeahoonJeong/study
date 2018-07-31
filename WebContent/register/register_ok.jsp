<%@page import="com.register.NaverDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<jsp:useBean id="dto" class="com.register.NaverDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<% 
	Connection conn = DBconn.getConnection();
	NaverDAO dao = new NaverDAO(conn);
	
	int result = dao.insertData(dto);
	DBconn.close();
	
	response.sendRedirect(cp+"/register/list.jsp");
	
%>