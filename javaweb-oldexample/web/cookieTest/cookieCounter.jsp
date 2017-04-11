<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.io.*" errorPage="/Common/erropPage.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>그린 홈</title>
    </head>
    <body>

    <h1>카운트</h1>
    <%
        String fileName = "d:/임시/counter.txt";
        String countStr = "";
        int count;
        boolean flag = false;   // 쿠키를 찾은지에 대한 여부
        
        Cookie[] cookies = request.getCookies();
        
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++)
            {
                if (cookies[i].getName().equals("Counter")) {
                    // 쿠키가 있음을 알림. 그래서 카운트를 증가시키지 않아야 함. 사용자가 Reload 버튼을 계속 눌러도 카운트는 증가하지 않음.
                    System.err.println(cookies[i].getName() + "라는 쿠키를 찾음.\n");
                    flag = true;
                    break;
                }
            }
        }
        
        RandomAccessFile raf = null;
        
        try {
            raf = new RandomAccessFile(fileName, "rw");
            
            if ((countStr = raf.readLine()) == null) {  // 새파일이었다면
                count = 1;
                countStr = Integer.toString(count);
                raf.writeBytes(countStr + "\n");
            } else {
                count = Integer.parseInt(countStr);
                
                if (!flag) {    // 쿠키가 없었다면. 즉 반복요청이 아닌 새로운 요청이었다면
                    Date date = new Date();
                    Cookie newCookie = new Cookie("Counter", date.toString());
                    newCookie.setMaxAge(-1);    // 음수일 경우 브라우저를 닫는 즉시 쿠키는 소멸된다. 0일 경우 지금 당장 소멸된다.
                    response.addCookie(newCookie);
                    
                    count++;
                    countStr = Integer.toString(count);
                    
                    raf.seek(0);    // 파일의 처음으로 간다.
                    raf.writeBytes(countStr + "\n");
                }
            }
        } catch (Exception e) {
            out.println(e.toString());
        } finally {
            raf.close();
        }
        
        out.println("Count: " + countStr + "<br>\n");
    %>
    
    </body>
</html>
