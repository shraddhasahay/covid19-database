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
 * Servlet implementation class treatment
 */
@WebServlet("/treatment")
public class treatment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public treatment() {
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
		String username=request.getParameter("Pid");
		String type=request.getParameter("Type");
		String citycode=request.getParameter("CityCode");
		String effect=request.getParameter("effect");
		String infected=request.getParameter("Infected");
		String recovered=request.getParameter("Recovered");
		
		
		
		Treatment t=new Treatment();
		t.setCityCode(citycode);
		t.setInfected(infected);
		t.setPid(username);
		t.setTreatmentType(type);
		t.setRecovered(recovered);
		t.setPost_effects(effect);
		
		LoginDao ld=new LoginDao();
		ld.set_treatment(t);
		
		response.sendRedirect("LoginSuccess.jsp");
	}

}
