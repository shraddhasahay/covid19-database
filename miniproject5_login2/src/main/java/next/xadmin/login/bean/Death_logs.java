package next.xadmin.login.bean;
import java.util.*;
public class Death_logs {

	private int Pid;
	private String CityCode;
	private String Date_of_Decease;

	public int getPid() {
		return Pid;
	}
	public void setPid(String pid) {
		Pid = Integer.parseInt(pid);
	}
	public String getCityCode() {
		return CityCode;
	}
	public void setCityCode(String cityCode) {
		CityCode = cityCode;
	}
	public String getDate_of_Decease() {
		return Date_of_Decease;
	}
	public void setDate_of_Decease(String date_of_Decease) {
		Date_of_Decease = date_of_Decease;
	}
	
}
