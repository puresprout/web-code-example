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
		// ���ؽ�Ʈ �ʱ�ȭ
		InitialContext ctx = new InitialContext();
		// �����ͼҽ� �ʱ�ȭ
		DataSource ds = (DataSource) ctx.lookup("java:/comp/env/jdbc/moxis");
		out.println("DataSource ȹ�� ����");
	} catch (NamingException e) {
		out.println("DataSource ȹ�� ����");
		e.printStackTrace();
	}
%>
</body>
</html>