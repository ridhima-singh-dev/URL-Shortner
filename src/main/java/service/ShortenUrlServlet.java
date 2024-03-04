package service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ShortenUrlServlet")
public class ShortenUrlServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private UrlShortenerService urlShortenerService;

	@Override
	public void init() throws ServletException {
		super.init();
		this.urlShortenerService = new UrlShortenerService();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = request.getParameter("url");
		// System.out.println(url+"URL VALUE");
		try {
			String shortenedUrl = urlShortenerService.createShortUrl(url);
			request.setAttribute("shortenedUrl", shortenedUrl);
		} catch (IllegalArgumentException e) {
			request.setAttribute("errorMessage", "Error: Invalid URL");
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
