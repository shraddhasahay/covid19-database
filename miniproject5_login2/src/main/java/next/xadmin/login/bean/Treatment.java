package next.xadmin.login.bean;

public class Treatment {

	private int Pid;
	private String TreatmentType;
	private boolean Recovered;
	private String CityCode;
	private boolean Infected;
	private String Post_effects;
	public int getPid() {
		return Pid;
	}
	public void setPid(String pid) {
		Pid = Integer.parseInt(pid);
	}
	public String getTreatmentType() {
		return TreatmentType;
	}
	public void setTreatmentType(String treatmentType) {
		TreatmentType = treatmentType;
	}
	public boolean isRecovered() {
		return Recovered;
	}
	public void setRecovered(String recovered) {
		Recovered = Boolean.parseBoolean(recovered);
	}
	public String getCityCode() {
		return CityCode;
	}
	public void setCityCode(String cityCode) {
		CityCode = cityCode;
	}
	public boolean isInfected() {
		return Infected;
	}
	public void setInfected(String infected) {
		Infected = Boolean.parseBoolean(infected);
	}
	public String getPost_effects() {
		return Post_effects;
	}
	public void setPost_effects(String post_effects) {
		Post_effects = post_effects;
	}
	

}
