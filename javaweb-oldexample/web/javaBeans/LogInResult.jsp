<%@ page contentType="text/html; charset=euc-kr" import="javaBeans.LogInBean" %>

<jsp:useBean id="logInBean" scope="page" class="LogInBean"/>
<jsp:setProperty name="logInBean" property="*"/>

<html>
	<head>
		<title>�α��� ���</title>
	</head>
	<body>
        <!-- Bean �� �� �����ǰ� �Ӽ����� ����� ������ Ȯ�� -->
        <!-- ���̵� : <%= logInBean.getID() %><br> -->
        <!-- ��й�ȣ : <%= logInBean.getPassword() %><br> -->

        �α��� ��� : 
		<%
            boolean b = false;
 
            try {
                b = logInBean.doLogIn();

                if (b) {
                    out.println("���� [���̵� : " + logInBean.getID() + "]");
                } else {
                    out.println("����");
                }
            } catch (Exception e) {
                out.println(e);
            }
		%>
	</body>
</html>