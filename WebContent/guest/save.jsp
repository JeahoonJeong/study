<%@page import="com.guest.GuestDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>

<jsp:useBean id="dto" class="com.guest.GuestDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<% 
	
	Connection conn = DBconn.getConnection();
	GuestDAO dao = new GuestDAO(conn);
	
	int maxNum = dao.getMaxNum();
	
	dto.setNum(maxNum+1);
	dto.setIpAddr(request.getRemoteAddr());

	
	dao.insertData(dto);
	
	DBconn.close();
	
	response.sendRedirect(cp+"/guest/guest.jsp");
	


%>	
