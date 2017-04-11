/*
 * ClassLoading.java
 *
 * Created on 2004년 3월 16일 (화), 오전 11:45
 */

package dynamicLoading;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author  박성현
 * @version
 */
public class ClassLoading extends HttpServlet {
    
    /** Initializes the servlet.
     */
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        
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
        response.setContentType("text/html; charset=euc-kr");
        PrintWriter out = response.getWriter();
        
        String msg = null;
        try {
            // 서블릿환경에서 WEB-INF 밑의 classes 디렉토리가 기본적으로 작동하는 디렉토리이다.
            // 그래서 클래스를 동적 로딩할때 URLClassLoader 와 같은 것이 필요없다.
            Class cls = Class.forName("dynamicLoading.HelloImpl");
            
            Hello myObj = (Hello) cls.newInstance();
            
            msg = myObj.toHello();
        } catch (IllegalAccessException ex) {
            out.println(ex.toString());
            ex.printStackTrace();
        } catch (InstantiationException ex) {
            out.println(ex.toString());
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            out.println(ex.toString());
            ex.printStackTrace();
        }

        out.println("동적 로딩과 다형성 원리를 적용한 후의 값: " + msg);
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
        return "Short description";
    }
}
