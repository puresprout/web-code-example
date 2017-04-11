<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="javax.naming.*, javax.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	try {
		// 컨텍스트 초기화
		InitialContext ctx = new InitialContext();
		// 데이터소스 초기화
		DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/moxis");
		out.println("DataSource 획득 성공");
	} catch (NamingException e) {
		out.println("DataSource 획득 실패");
		e.printStackTrace();
	}
%>
</body>
</html>