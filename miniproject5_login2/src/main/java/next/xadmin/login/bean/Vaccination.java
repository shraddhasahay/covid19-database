package next.xadmin.login.bean;

public class Vaccination {

	private int Pid;
	private boolean Dose1;
	private boolean Dose2;
	private String Dose1_Date;
	private String Dose2_Date;
	private String CityCode;
	
	public int getPid() {
		return Pid;
	}
	public void setPid(String pid) {
		Pid = Integer.parseInt(pid);
	}
	public boolean isDose1() {
		return Dose1;
	}
	public void setDose1(String dose1) {
		Dose1 = Boolean.parseBoolean(dose1);
	}
	public boolean isDose2() {
		return Dose2;
	}
	public void setDose2(String dose2) {
		Dose2 = Boolean.parseBoolean(dose2);
	}
	public String getDose1_Date() {
		return Dose1_Date;
	}
	public void setDose1_Date(String dose1_Date) {
		Dose1_Date = dose1_Date;
	}
	public String getDose2_Date() {
		return Dose2_Date;
	}
	public void setDose2_Date(String dose2_Date) {
		Dose2_Date = dose2_Date;
	}
	public String getCityCode() {
		return CityCode;
	}
	public void setCityCode(String cityCode) {
		CityCode = cityCode;
	}
	
	

}
