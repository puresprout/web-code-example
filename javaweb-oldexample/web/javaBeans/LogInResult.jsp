<%@ page contentType="text/html; charset=euc-kr" import="javaBeans.LogInBean" %>

<jsp:useBean id="logInBean" scope="page" class="LogInBean"/>
<jsp:setProperty name="logInBean" property="*"/>

<html>
	<head>
		<title>로그인 결과</title>
	</head>
	<body>
        <!-- Bean 이 잘 생성되고 속성값이 제대로 들어갔는지 확인 -->
        <!-- 아이디 : <%= logInBean.getID() %><br> -->
        <!-- 비밀번호 : <%= logInBean.getPassword() %><br> -->

        로그인 결과 : 
		<%
            boolean b = false;
 
            try {
                b = logInBean.doLogIn();

                if (b) {
                    out.println("성공 [아이디 : " + logInBean.getID() + "]");
                } else {
                    out.println("실패");
                }
            } catch (Exception e) {
                out.println(e);
            }
		%>
	</body>
</html>