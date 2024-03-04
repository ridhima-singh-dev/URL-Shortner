package service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ExpandUrlServlet")
public class ExpandUrlServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
        UrlShortenerService urlShortenerService = new UrlShortenerService();
        String shortUrl = request.getParameter("shortUrl");

        String originalUrl = urlShortenerService.getOriginalUrl(shortUrl);
        //System.out.println(originalUrl + "OG UURL");
        request.setAttribute("originalUrl", originalUrl);

        request.getRequestDispatcher("/index.jsp").forward(request, response);

    }
}