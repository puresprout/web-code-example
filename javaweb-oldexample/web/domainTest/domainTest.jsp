<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script>
document.domain='naver.com';
</script>
</head>
<body>

<form name="theForm">
<input name="myButton" type="button" value="새창" onclick="javascript:go();">
</form>

<script>
	function go() {
		alert(document.domain);
	
		window.open("http://nhn386.naver.com/docs/test.jsp", "newWin");
	}
</script>

</body>
</html>