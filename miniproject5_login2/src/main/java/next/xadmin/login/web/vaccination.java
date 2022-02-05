package next.xadmin.login.web;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import next.xadmin.login.bean.*;
import next.xadmin.login.database.LoginDao;

/**
 * Servlet implementation class vaccination
 */
@WebServlet("/vaccination")
public class vaccination extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vaccination() {
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
		String cc=request.getParameter("CityCode");
		String dos1=request.getParameter("dose1");
		String dos2=request.getParameter("dose2");
		String date1=request.getParameter("date1");
		String date2=request.getParameter("date2");
		
		Vaccination vc=new Vaccination();
		vc.setPid(pid);
		vc.setCityCode(cc);
		vc.setDose1(dos1);
		vc.setDose2(dos2);
		vc.setDose1_Date(date1);
		vc.setDose2_Date(date2);
		
		LoginDao ld=new LoginDao();
		try {
			ld.insert_vaccination(vc);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("LoginSuccess.jsp");
		
	}

}
