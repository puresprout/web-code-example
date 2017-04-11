<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	System.out.println("[test/wait] start");

	java.lang.Thread.sleep(1000 * 30); // 잠시 중단
	
	out.print("ok!");

	System.out.println("[test/wait] end");
%>

</body>
</html>