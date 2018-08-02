<%@page import="com.guest.GuestDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	String pageNum = request.getParameter("pageNum");
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = DBconn.getConnection();
	GuestDAO dao = new GuestDAO(conn);
	
	int result = dao.deleteData(num);
	
	DBconn.close();
	
	response.sendRedirect(cp+"/guest/guest.jsp?pageNum="+pageNum);
%>
