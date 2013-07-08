package org.tutske.submittest;

import org.tutske.util.Counter;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "submit", urlPatterns = {"/submit"})
public class SubmitServlet extends HttpServlet {

	private static final String VIEW = "/WEB-INF/jsp/submit.jsp";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Counter c = new Counter ();
		c.increase ();
		request.setAttribute ("counter", c);

		try { Thread.sleep (1500); }
		catch (InterruptedException ex) { throw new ServletException (ex); }

		RequestDispatcher dispatch = request.getRequestDispatcher (VIEW);
		dispatch.forward (request, response);
	}

}