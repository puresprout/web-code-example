package imageTest;

import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DynamicImageServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BufferedImage image = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
		Graphics g = image.createGraphics();

		Font font = new Font("Serif", Font.PLAIN, 12);
		g.setFont(font);
		g.drawString(request.getParameter("name"), 0, 12);

		response.setContentType("image/gif");
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(image, "gif", out);

		out.close();
	}

}
