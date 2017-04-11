<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
try {
	document.domain = "naver.com";
} catch (e) {
	alert(e.message);
}
</script>

</head>
<body>

<form name="aform" action="b.jsp" method="post" onsubmit="return go();">
	<input type="hidden" name="company" value="NHN"/>
	<input type="submit">
</form>

<script>
	function go() {
try {
		alert(document.domain);
	
		window.open("blank.html", "newWin");
	
		document.aform.target = "newWin";
		document.aform.submit();
} catch (e) {
	alert(e.message);
}
	}
</script>

</body>
</html>