package next.xadmin.login.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import next.xadmin.login.bean.*;
import next.xadmin.login.database.LoginDao;

/**
 * Servlet implementation class death_log
 */
@WebServlet("/death_log")
public class death_log extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public death_log() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String pid=request.getParameter("Pid");
		String citycode=request.getParameter("CityCode");
		String date=request.getParameter("date");
		
		Death_logs dl=new Death_logs();
		dl.setCityCode(citycode);
		dl.setPid(pid);
		dl.setDate_of_Decease(date);
		
		LoginDao ld=new LoginDao();
		ld.set_death_logs(dl);
		response.sendRedirect("LoginSuccess.jsp");
	}

}
