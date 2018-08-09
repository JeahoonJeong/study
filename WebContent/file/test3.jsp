<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%	//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	//http://www.servlets.com/cos 에서 cos.jar 라이브러리 다운로드, 설치
	//파일 업로드 라이브러리
	
	//1.예전에 사용하던 방식
	//String root = request.getRealPath("/");
	
	//2.최근 사용방식
	String root = pageContext.getServletContext().getRealPath("/");
	
	//저장되는 폴더와 위치
	//java.io.File
	String path = root + File.separator + "pds" + File.separator +"saveData";
	
	//저장 폴더가 없으면 생성
	File dir = new File(path);
	if(!dir.exists()){
		dir.mkdirs();// mkdirs
	}
	
	String encType = "UTF-8";
	int maxFileSize = 10*1024*1024;// 10m 업로드 파일 크기수 제한
	
	try{
		
		//파일 전송 코딩
		MultipartRequest mr = 
			new MultipartRequest(request, path, maxFileSize, encType, new DefaultFileRenamePolicy());
		
		//DB에 저장할 파일 정보를 추출
		out.print("이름: "+mr.getParameter("name") +"<br/>");//test1의 파라미터 name
		out.print("서버에 저장된 파일명: "+mr.getFilesystemName("upload")+"<br/>");//test1의 파라미터 upload
		out.print("업로드한 파일명: "+mr.getOriginalFileName("upload")+"<br/>");
		out.print("파일 타입: "+mr.getContentType("upload")+"<br/>");
		File f = mr.getFile("upload");
		if(f!=null){
			out.print("파일길이: "+f.length()+"<br/>");
		}
		
	}catch(Exception e){
		System.out.println(e.toString());
	}
	
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=root %><br/>
	<!-- 기본 파일 저장 위치 -->
	<!-- D:\java\work\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\study\  -->
	업로드 성공.
</body>
</html>