<%@ page contentType="text/html; charset=UTF-8"%>

<%//POST 방식에서 한글깨짐을 방지
	request.setCharacterEncoding("UTF-8");%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

	body{
		font-size: 9pt;
	}
	
	.itemBtn{
		font-size: 9pt;
		color: rgb(0,0,0);
		background-color: rgb(240,240,240);
		width: 30pt;
	}
	
	
	.btn{
		font-size: 9pt;
		color: rgb(0,0,0);
		background-color: rgb(240,240,240);
		
	}
	
	.itemList{
		font-size: 9pt;
		width: 100pt;
	}

</style>

<script type="text/javascript">

	function itemAdd() {
		var f = document.myForm;
		
		//var leftItem = f.leftItem;
		
		
		f.leftItem[0] = new Option('배수지','배수지');//text값,value값
		f.leftItem[1] = new Option('김수지','김수지');
		f.leftItem[2] = new Option('최수지','최수지');
		f.leftItem[3] = new Option('정수지','정수지');
		f.leftItem[4] = new Option('장수지','장수지');
		f.leftItem[5] = new Option('송수지','송수지');
		f.leftItem[6] = new Option('라수지','라수지');	
	}
	
	function itemMove(val) {
		
		var f = document.myForm;
		var source, target;
		
		if(val=='left'){
			source = f.rightItem;
			target = f.leftItem;
		}else{
			source = f.leftItem;
			target = f.rightItem;
		}
		
		var n,i;
		n = target.length;
		
		for(i=source.length-1;i>=0;i--){
			
			if(source.options[i].selected){
				
				target[n++] = new Option(source.options[i].text, source.options[i].value);
				
				source[i] = null;
			}
			
		}
		
	}
	
	function sendIt(){
		
		var f = document.myForm;
		
		if(f.rightItem.length == 0){
			
			alert("쪽지 보낼 사람을 선택하세요!!");
			f.rightItem.focus();
			return;
		}
		
		if(!f.msg.value){
			
			alert("메세지를 입력하세요!");
			f.msg.focus();
			return;
		
		}
		
		//받는사람 자동선택
		for(i=0 ; i<f.rigthItem.length ; i++){
			
			//f.rightItem[i].selected = true;
			f.rightItem.options[i].selected = true;
			
		}
		
		
		f.submit();
		
	}
	
	
</script>

</head>
<body onload="itemAdd();">
	
	<form action="listTest_ok.jsp" method="post" name="myForm">
	
		<table border="0" style="font-size: 9pt;" align="center">
			<tr>
				<td width="150">전체리스트</td>
				<td width="70">&nbsp;</td>
				<td width="150">받는사람</td>
			</tr>
			
			<tr align="center">
				<td width="150">
					<select name="leftItem" class="itemList" multiple="multiple" size="7">
					</select>
				</td>
				
				<td width="70">
					<input type="button" class="itemBtn" value="&lt;" onclick="itemMove('left');"/><br/>
					<input type="button"  class="itemBtn" value="&gt;" onclick="itemMove('right');"/><br/>
				</td>
				
				<td width="150">
					<select name="rightItem" class="itemList" multiple="multiple" size="7">
						
					</select>
				</td>
				
			</tr>
			
			<tr>
				<td colspan="3">
					<br/>메세지<br/>
					<textarea rows="5" cols="42" name="msg"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="3" align="center">
				<input type="button" class="btn" value="쪽지보내기" onclick="sendIt();"><br/>
				</td>
			</tr>
			
			
		</table>
	
	</form>
	
</body>
</html>