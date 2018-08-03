<%@page import="com.svt.MyData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	List<MyData> lists = new ArrayList<MyData>();
	
	MyData ob = new MyData("홍길동",30);
	lists.add(ob);
	
	ob = new MyData("김길동",31);
	lists.add(ob);
	
	ob = new MyData("정길동",32);
	lists.add(ob);
	
	ob = new MyData("장길동",33);
	lists.add(ob);
	
	request.setAttribute("lists", lists);
	
%>

<jsp:forward page="result.jsp"/>
