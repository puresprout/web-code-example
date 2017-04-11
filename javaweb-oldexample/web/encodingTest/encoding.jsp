<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
1. �⺻ ���

jsp�������� contentType���� charset�� ���������� �� �������� �����ٶ� � ���ڵ��� ��������� ��Ÿ����.
���� �������� �� ���������� ������ Ư�� �����͸� ������ ���� ���ڵ��� �״�� ����Ѵ�.

jsp���������� <fmt:requestEncoding/>�� �� �������� ���� �Ķ����(key, value��)�� � ���ڵ����� �� ���ΰ��� ���ϴ� �±״�.
�� �� ���� POST ������� ���� �Ķ���Ϳ��� �ش�ȴ�.

��, contentType�� charset�� ��� ���ڵ��� ���ϴ� ���̰�,
<fmt:requestEncoding/>�� �Է� ���ڵ��� ���ϴ� ���̴�.

2. server.xml�� URIEncoding

���� �� ���������� <fmt:requestEncoding/> �±׸� ���� �ȴٸ� ��Ĺ�� server.xml ���Ͽ��� <Connector> �±׿�
URIEncoding �Ӽ��� ���� �ȴ�.
��, �� ������ GET ����϶��� ����ȴ�.
POST ������� ���� �Ķ���ʹ� <fmt:requestEncoding> �±װ� �ʿ��ϴ�.
--%>

<fmt:requestEncoding value="utf-8"/>

${param.name}

</body>
</html>
