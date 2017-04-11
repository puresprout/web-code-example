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
1. 기본 사상

jsp페이지의 contentType에서 charset은 브라우저에서 이 페이지를 보여줄때 어떤 인코딩을 사용할지를 나타낸다.
또한 브라우저는 현 페이지에서 서버로 특정 데이터를 보낼때 위의 인코딩을 그대로 사용한다.

jsp페이지에서 <fmt:requestEncoding/>은 이 페이지로 들어온 파라미터(key, value쌍)를 어떤 인코딩으로 볼 것인가를 정하는 태그다.
단 이 때는 POST 방식으로 들어온 파라미터에만 해당된다.

즉, contentType의 charset은 출력 인코딩을 정하는 것이고,
<fmt:requestEncoding/>은 입력 인코딩을 정하는 것이다.

2. server.xml의 URIEncoding

만일 각 페이지에서 <fmt:requestEncoding/> 태그를 쓰기 싫다면 톰캣의 server.xml 파일에서 <Connector> 태그에
URIEncoding 속성을 쓰면 된다.
단, 이 설정은 GET 방식일때만 적용된다.
POST 방식으로 들어온 파라미터는 <fmt:requestEncoding> 태그가 필요하다.
--%>

<fmt:requestEncoding value="utf-8"/>

${param.name}

</body>
</html>
