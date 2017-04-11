<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form><input type="text" name="name"> <input
	type="submit"></form>

<c:if test="${!empty param.name}">
	<img
		src='<c:url value="/imageTest/dynamicImageServlet?name=${param.name}"/>'>
</c:if>

</body>
</html>
