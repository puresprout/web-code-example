<!--
    get 방식으로 jsp 파일에 데이터를 전달하는데 있어, URL에 한글이나 특수문자가 있다면 특정 서식으로 URL을 인코딩해야 한다.
    이러한 포맷을 'x-www-form-urlencoded' 라고 한다.

    1. 'a' 에서 'z' 까지, 'A' 에서 'Z' 까지의 알파벳, '0' 부터 '9' 까지의 숫자, '-', '_', '.', '*' 는 그대로 둔다.
    2. 공백은 '+' 기호로 바꾼다.
    3. 그 이외의 모든 문자는 '%xy'와 같이 3자리 문자로 바꾸는데 여기서 'xy'는 해당 문자의 16진수 코드값이 된다.

    public static String java.net.URLEncoder.encode(String s) 메소드를 사용해 URL 인코딩을 한다.
    
    'Hello' -> 'Hello'
    '한글' -> '%C7%D1%B1%DB'

    '한글' 이라는 자바 문자열은 유니코드인데 URL 인코딩된 값은 EUC-KR 문자셋 데이터이다. 즉, 유니코드를 해당 시스템의 기본 문자셋으로 변환한 후에
    그것을 다시 URL 형식으로 인코딩을 하는 것이다.

    '한글'을 URL 인코딩할 때 때때로 '%3F%3F' 라고 출력되는 경우가있는데 이는 시스템의 기본 문자셋이 8859_1일 경우 '한글' 유니코드를 8859_1로 제대로
    변환할 수 없으므로 '%3F%3F' 라고 엉뚱하게 나와 버린다.

    아래의 소스에서 두 가지의 링크가 있는데,
    첫번째는 URLEncoding 없이 파라미터를 get 방식으로 넘기고 있다. 이는 시스템의 기본 문자셋으로 그대로 웹 브라우저의 창에 그 글자('Hello', '한글') 이
    나타난다. 물론 링크 페이지에서 아무런 문제없이 잘 보이지만 다른 시스템으로 이 프로그램을 옮기면 URLEncoding 이 안 되었으므로 결과가 틀리게 나올 수
    있다. (성현주)
    두번째는 URLEncoding을 통해 웹 브라우저 주소창에 파라미터가 URL 인코딩된 상태로 나올 것이다. 결과도 올바르게 나온다. (성현주)
-->

<%@page contentType="text/html; charset=euc-kr"%>
<html>
<head><title>URL Encoding/Decoding</title></head>
<body>

<%
    String englishMsg = "Hello";
    String koreanMsg = "한글";
%>

<!--
<a href="CharacterSetParameter.jsp?msg=<%= englishMsg %>">영문 메시지</a><br>
<a href="CharacterSetParameter.jsp?msg=<%= koreanMsg %>">한글 메시지</a>
-->

<a href="CharacterSetParameter.jsp?msg=<%= java.net.URLEncoder.encode(englishMsg) %>">영문 메시지</a><br>
<a href="CharacterSetParameter.jsp?msg=<%= java.net.URLEncoder.encode(koreanMsg) %>">한글 메시지</a>

</body>
</html>
