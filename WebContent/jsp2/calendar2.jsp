<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");
	
	Calendar cal = Calendar.getInstance();
	
	//오늘날짜
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	//클라이언트에서 넘어온 데이터
	//action에서 자신의 파일이름을 사용하여 데이터를 자신이 받고수정하여 다시 보내는 형식
    //String(클래스)이기때문에 초기값 null;
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	//표시할 달력의 년, 월
	int year = nowYear;//초기화
	int month = nowMonth;
	
	if(strYear != null){	
		year = Integer.parseInt(strYear);//클라이언트가 선택한 년도
	}
	
	if(strMonth != null){
		month = Integer.parseInt(strMonth);//클라이언트가 선택한 월
	}
	
	int preYear = year;
	int preMonth = month-1;
	
	if(preMonth<1){
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year;
	int nextMonth = month+1;
	
	if(nextMonth>12){
		nextYear = year+1;
		nextMonth = 1;
	}
	
	//표시할 달력 셋팅
	
	cal.set(year, month-1,1);
	int startDay = 1;
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int week = cal.get(Calendar.DAY_OF_WEEK);

%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

body {
	font-size: 9pt;
}

td {
	font-size: 12pt;
}
	
</style>



<script type="text/javascript">

	function init() {

		var f = document.myForm;

		var now = new Date();
		var fyear = f.year;
		var nowYear = <%=year%>
		var startYear = nowYear - 5;
		
		for (i=0; i<11; i++) {
			fyear[i] = new Option(startYear, startYear);
			
			if (fyear[i].value == nowYear)
				fyear[i].selected = true; 
			startYear++;
		}

		var fmonth = f.month;
		for (i=0; i<12; i++)
			fmonth[i] = new Option(i+1, i+1);

		var nowMonth = <%=month%>;
		fmonth[nowMonth-1].selected = true;
		
	}

	function calendarChange() {
		var f = document.myForm;
		f.submit();
	}
	
</script>



</head>
<body>
	
	<br/><br/>
	
	<table width="210" cellpadding="2" cellspacing="1" align="center">
		<tr>
			<td align="right" style="padding-right: 0">
				<a href="calendar2.jsp?year=<%=nowYear%>&month=<%=nowMonth%>">
					<img alt="" src="../image/today.JPG">
				</a>
			</td>
			<td align="left" style="padding-left: 0">
				<a href="calendar.jsp?year=<%=preYear%>&month=<%=preMonth%>">◀</a>
				<b>&nbsp;<%=year %>년&nbsp;&nbsp;<%=month %>월</b>
				<a href="calendar.jsp?year=<%=nextYear%>&month=<%=nextMonth%>">▶</a>
			</td>
		</tr>
	</table>
	
	<table align="center" width="210" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
		<tr>
			<td bgcolor="#e6e4e6" align="center"><font color="red">일</font></td>
			<td bgcolor="#e6e4e6" align="center">월</td>
			<td bgcolor="#e6e4e6" align="center">화</td>
			<td bgcolor="#e6e4e6" align="center">수</td>
			<td bgcolor="#e6e4e6" align="center">목</td>
			<td bgcolor="#e6e4e6" align="center">금</td>
			<td bgcolor="#e6e4e6" align="center"><font color="blue">토</font></td>
		</tr>
	

<%
	int newLine = 0;
	out.print("<tr height = '20'>");
	for(int i=1; i<week;i++){//week: 1~7
		out.print("<td bgcolor = '#ffffff'>&nbsp;</td>");
		newLine++;
	}
	
	for(int i = startDay;i<=endDay; i++){
		String fontColor = (newLine==0) ? "red" : (newLine==6) ? "blue":"black";
		String bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i)? "#e6e4e6" : "#ffffff";
		
		out.print("<td align = 'center' bgcolor='" +bgColor+"'><font color='"+fontColor +"'>"+i+"</font></td>");
		
		newLine++;
		
		if(newLine==7&&i!=endDay){
				out.print("</tr><tr height = '20'>");
				newLine=0;
		}
		
	}
	
	while(newLine>0 && newLine<7){
		out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
		newLine++;
	}
	out.print("</tr>");
	
	
%>
</table>
	
</body>
</html>




























