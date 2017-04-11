/*
 * SendMail.java
 *
 * Created on 2004년 1월 13일 (화), 오후 3:57
 */

package sendMail;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class SendMail extends HttpServlet {
    
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

        out.println("<html>");
        out.println("<head>");
        out.println("<title>메일 보내기</title>");
        out.println("</head>");
        out.println("<body>");
        
        // SMTP 서버로 데이터 보내기
        Socket smtp = null;
        PrintWriter pw = null;
        BufferedReader br = null;
        
        try {
            smtp = new Socket("localhost", 25);
            pw = new PrintWriter(new OutputStreamWriter(smtp.getOutputStream()));
            br = new BufferedReader(new InputStreamReader(smtp.getInputStream()));
        } catch(IOException ioe) {
            ioe.printStackTrace(out);
        }
        
        try {
            pw.println("HELO " + InetAddress.getLocalHost().getHostName());
            pw.println("MAIL FROM: " + request.getParameter("mailFrom"));
            pw.println("RCPT TO: " + request.getParameter("mailTo"));
            pw.println("DATA");
            pw.println(request.getParameter("body") + "\r\n.\r\n");
            
            String readStr = br.readLine();
            while (readStr != null)
            {
                out.println(readStr);
                readStr = br.readLine();
            }

            pw.println("QUIT");
            
            smtp.close();
        } catch (IOException ioe) {
            ioe.printStackTrace(out);
        }
         
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
        return "Short description";
    }
    
}
