package upload;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MMServlet extends HttpServlet {

	public MMServlet() {

	}

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s = request.getParameter("stime");
		String e = request.getParameter("etime");
		String t = request.getParameter("tid");
		String type = request.getParameter("type");
		request.setAttribute("s", s);
		request.setAttribute("e", e);
		request.setAttribute("t", t);
		request.setAttribute("type", type);
		request.getRequestDispatcher("/userqueryresult.jsp").forward(request,
				response);

	}

}
