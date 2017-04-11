<!--
    폼의 입력값에 'Hello', '안녕' 을 번갈아 입력했을때 '안녕'이 깨지는 이유

    -> 이것은 getParameter() 메소드가 파라미터로 받은 데이터를 유니코드인 String으로 변환하는 과정에서 발생하는 것임

    1. euc-kr로 작성된 CharacterSetParameter.html에 한글 메시지를 입력. 현 페이지가 euc-kr로 인코딩되어야 함을 브라우저에 알렸으므로 '안녕'의 문자셋
       은 euc-kr이며 그 코드의 값은 BE C8 B3 E7이다.
    2. 데이터 BE C8 B3 E7이 네트워크를 통해 서블릿에 전달된다.
    3. 서블릿 코드의 getParameter() 메소드를 통해 파라미터의 값을 얻도록 요청
    4. 데이터 BE C8 B3 E7만으로는 어떤 문자셋의 데이터인지 알 수 없다. (contentType의 설정은 컴파일러가 소스코드를 컴파일 할 때, 브라우저가 문자를
       인코딩할 때만 영향을 줄 뿐 전송받은 데이터가 어떤 문자셋인지는 알 수 없다.) 서블릿 컨테이너는 각 1바이트를 2바이트로 늘린 유니코드로 변환하
       여 00BE 00C8 00B3 00E7로 만들어 반환한다. (디폴트 문자셋으로 8859_1으로 가정한 것 같다 - 성현주)
    5. 유니코드 00BE 00C8 00B3 00E7는 유니코드지만 전혀 읽을 수 없는 문자이다.(추측컨데 한글영역에 해당되지 않는 부분과 비영역 부분 - 성현주) 또한
       이 문자열은 총 4문자이다. 이 유니코드를 브라우저에 뿌릴때에 다시 euc-kr로 인코딩해야 하는데, 생성된 유니코드 문자열은 한글영역부분이 아니
       므로 euc-kr로 인코딩된 문자도 또한 한글이 되지 못한다. (성현주)

    하지만 영어로 입력한 'Hello'는 어떠한 문자셋에서도 48 65 6C 6C 6F이며 유니코드로 변환해도 0048 0065 006C 006C 006F 이므로 위의 처리 과정에
    따라 변환된 유니코드 문자열에도 아무런 문제가 없다.

    따라서 getParameter()로 얻은 문자열을 다시 바이트 배열로 변환하여 얻고 euc-kr이라는 문자셋을 힌트로 주어 유니코드로 인코딩해야 한다.
    아래와 같이 바꾸어 보자.

    String msg = new String(temp.getBytes("8859_1"), "EUC-KR");

    톰캣과 같은 서블릿 컨테이너에 한글패치 프로그램을 설치(또는 다국어 패치) 하면 이 문제는 쉽게 해결된다. 이것은 전송한 데이터가 전송받은 JSP
    페이지의 문자셋과 같은 것으로 가정하는 것이다.
-->
<%@page contentType="text/html; charset=EUC-KR"%>
<html>
<head><title>JSP Page</title></head>
<body>

<%
//    String msg = request.getParameter("msg");

    String temp = request.getParameter("msg");
    String msg = new String(temp.getBytes("8859_1"), "EUC-KR");
%>

Your message is: <%= msg %><br>
Your message length is: <%= msg.length() %>

</body>
</html>
