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
 * Servlet implementation class updatePatient
 */
@WebServlet("/updatePatient")
public class updatePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePatient() {
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
		String username=request.getParameter("USER_ID");
		String password=request.getParameter("PSWD");
		String citycode=request.getParameter("CityCode");
		String age=request.getParameter("Age");
		String name=request.getParameter("Name");
		
		
		
		Patient p=new Patient();
		p.setPassword(password);
		p.setUsername(username);
		p.setAge(age);
		p.setCityCode(citycode);
		p.setName(name);
		
		LoginDao ld=new LoginDao();
		ld.update_patient(p);
		response.sendRedirect("LoginSuccess.jsp");
	}

}
