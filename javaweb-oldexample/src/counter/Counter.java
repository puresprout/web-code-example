/*
 * Counter.java
 *
 * Created on 2004년 1월 12일 (월), 오후 2:36
 */

package counter;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author  박성현
 * @version
 */
public class Counter extends HttpServlet {
    int cnt;    // 접속수를 기록
    
    /** 카운트 증가
     */
    private synchronized void increaseCnt() {
        cnt++;
    }
    
    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
        cnt = 0;    // 서블릿 초기화시 카운트는 0이다.
    }
    
    /** Destroys the servlet.
     */
    public void destroy() {
        
    }
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        increaseCnt();  // 카운트 수 증가
        
        response.setContentType("text/html; charset=euc-kr");
        //response.setLocale(Locale.KOREA);
        
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Counter</title>");
        out.println("</head>");
        out.println("<body>");
        
        out.println("현재 접속자 수 : " + cnt);
         
        out.println("</body>");
        out.println("</html>");

        out.close();
    }
    
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "이 웹사이트에 접속한 사용자 수를 세는 서블릿";
    }
    
}
