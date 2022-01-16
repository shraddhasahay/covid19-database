package next.xadmin.login.bean;

public class Patient {
	private int username;
	private String password;
	private String Name;
	private int Age;
	private String CityCode;
	
	public int getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = Integer.parseInt(username);
		}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(String age) {
		Age = Integer.parseInt(age);
	}
	public String getCityCode() {
		return CityCode;
	}
	public void setCityCode(String cityCode) {
		CityCode = cityCode;
	}
	
	
}
