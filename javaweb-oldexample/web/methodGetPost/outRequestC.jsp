<%@page contentType="text/html"%>
<%@page pageEncoding="euc-kr"%>
<html>
<head><title>JSP Page</title></head>
<body>

<%-- <jsp:useBean id="beanInstanceName" scope="session" class="beanPackage.BeanClassName" /> --%>
<%-- <jsp:getProperty name="beanInstanceName"  property="propertyName" /> --%>

getParameter() 호출<br>
msg1 : <%= request.getParameter("msg1") %><br>
msg2 : <%= request.getParameter("msg2") %><br>
<br>

getParameterValues() 호출<br>
msg1 :
<%
    String msg1[] = request.getParameterValues("msg1");

    for (int i = 0; i < msg1.length; i++)
        out.println(msg1[i]);
%>
<br>
msg2 :
<%
    String msg2[] = request.getParameterValues("msg2");

    for (int i = 0; i < msg2.length; i++)
        out.println(msg2[i]);
%>

</body>
</html>
