package sync;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Sync extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		out.println("test context attributes<br>");

		synchronized (getServletContext()) {
			getServletContext().setAttribute("foo", "22");
			getServletContext().setAttribute("bar", "42");
		}

		out.println(getServletContext().getAttribute("foo"));
		out.println(getServletContext().getAttribute("bar"));
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

}
