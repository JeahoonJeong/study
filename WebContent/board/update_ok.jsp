<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="util.DBconn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//update.jsp input 태그의 
	String pageNum = request.getParameter("pageNum");
	String num = request.getParameter("num");
	
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
	
	
	
%>

<jsp:useBean id="dto" class="com.board.BoardDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%
	
	Connection conn = DBconn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	dao.updateData(dto);
	
	DBconn.close();
	
	
	//검색-----------------------------------
		String param = "";
		if(!searchValue.equals("")){
			
			param = "?searchKey="+searchKey;
			param += "&searchValue="+URLEncoder.encode(searchValue,	"UTF-8");
			//인코딩
			
		}
	//----------------------------------------------
	
	
	response.sendRedirect(cp+"/board/list.jsp?pageNum="+pageNum+"&num="+num
							+"&searchValue="+searchValue+"&searchKey="+searchKey);

%>


















