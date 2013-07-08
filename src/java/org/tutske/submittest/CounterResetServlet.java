package org.tutske.submittest;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.tutske.util.Counter;

@WebServlet(name = "CounterResetServlet", urlPatterns = {"/reset"})
public class CounterResetServlet extends HttpServlet {

	private static final String VIEW = "/WEB-INF/jsp/counterReset.jsp";

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Counter c = new Counter ();
		c.reset ();

		RequestDispatcher dispatch = request.getRequestDispatcher (VIEW);
		dispatch.forward (request, response);
	}

}
