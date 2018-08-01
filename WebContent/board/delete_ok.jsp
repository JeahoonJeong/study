<%@page import="com.board.BoardDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	// /study
	
	//hidden type으로 article에서 pageNum, num을 넘겨 받는다.
	String pageNum = request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = DBconn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	int result = dao.deleteData(num);
	
	DBconn.close();
	
	response.sendRedirect(cp+"/board/list.jsp?pageNum="+pageNum);
	
%>
