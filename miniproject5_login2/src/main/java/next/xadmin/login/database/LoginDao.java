
package next.xadmin.login.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import next.xadmin.login.bean.*;

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
	public int display_city_details(String c)
	{
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "select num_of_cases from city_cases where CityCode =?";
		PreparedStatement ps;
		
		try {
			City_Cases cc=null;
			int cases=-2;
			ps = con.prepareStatement(sql);
			
			ps.setString(1, c);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				cases=rs.getInt("num_of_cases");
				/*cc =new City_Cases();
				cc.setNum_of_cases(Integer.toString(rs.getInt("num_of_cases")));
				cc.setLive_cases(Integer.toString(rs.getInt("live_cases")));
				cc.setLive_cases(Integer.toString(rs.getInt("num_of_death")));
				cc.setLive_cases(Integer.toString(rs.getInt("vaccinated")));*/				
				
			}
			return cases;
			
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return -1;
			}
			
		
	}

	public void update_patient(Patient p) {
		// TODO Auto-generated method stub
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "update patient set Name=? , Age=? , PSWD=? WHERE Pid=? AND CityCode=?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(4, p.getUsername());
			ps.setString(5, p.getCityCode());
			ps.setString(1,p.getName());
			ps.setInt(2, p.getAge());
			ps.setString(3, p.getPassword());
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

	public void set_treatment(Treatment t) {
		// TODO Auto-generated method stub
		loadDriver(dbDriver);
		Connection con = getConnection();
		String sql = "insert into treatment values(?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, t.getPid());
			ps.setString(2, t.getTreatmentType());
			ps.setBoolean(3,t.isRecovered());
			ps.setString(4, t.getCityCode());
			ps.setBoolean(5, t.isInfected());
			ps.setString(6, t.getPost_effects());
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

	public void set_death_logs(Death_logs dl) {
		// TODO Auto-generated method stub
		loadDriver("dbDriver");
		Connection con=getConnection();
		String sql="insert into death_logs values (?,?,?)";
		PreparedStatement ps;
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, dl.getPid());
			ps.setString(2, dl.getCityCode());
			ps.setString(3, dl.getDate_of_Decease());
			ps.executeUpdate();
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	}

	public void insert_vaccination(Vaccination vc) throws SQLException {
		// TODO Auto-generated method stub
		loadDriver("dbDriver");
		Connection con=getConnection();
		String sql="insert into vaccination values (?,?,?,?,?,?)";
		PreparedStatement ps;
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, vc.getPid());
			ps.setBoolean(2, vc.isDose1());
			ps.setBoolean(3, vc.isDose2());
			ps.setString(4, vc.getDose1_Date());
			ps.setString(5, vc.getDose2_Date());
			ps.setString(6, vc.getCityCode());
			ps.executeUpdate();
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
	}
	}
