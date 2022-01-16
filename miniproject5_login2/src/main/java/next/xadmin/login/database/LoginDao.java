
package next.xadmin.login.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import next.xadmin.login.bean.Patient;

public class LoginDao {
	
	private String dbUrl = "jdbc:mysql://localhost:3306/covid19";
	private String dbUname = "classRoomUser";
	private String dbPassword = "classRoomPass";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	
	public void loadDriver(String dbDriver) 
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection()
	{
		Connection con = null;
		//System.out.println("yooo");
		try {
			//System.out.println("yooo");
			con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
			//System.out.println("yooo");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public boolean validate(Patient p)
	{
		boolean status = false;
		
		loadDriver(dbDriver);
		Connection con = getConnection();
		
		String sql = "select * from patient where Pid = ? and PSWD =?";
		PreparedStatement ps;
		try {
		ps = con.prepareStatement(sql);
		ps.setLong(1, p.getUsername());
		ps.setString(2, p.getPassword());
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	

	public void insert_patient(Patient p) {
		// TODO Auto-generated method stub
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "insert into patient values(?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, p.getUsername());
			ps.setString(2, p.getCityCode());
			ps.setString(3,p.getName());
			ps.setInt(4, p.getAge());
			ps.setString(5, p.getPassword());
			ps.executeUpdate();
			 int x=ps.executeUpdate();    
             
	            if(x==1)    
	            {    
	            System.out.println("Values Inserted Successfully");    
	            } 
			
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	}
