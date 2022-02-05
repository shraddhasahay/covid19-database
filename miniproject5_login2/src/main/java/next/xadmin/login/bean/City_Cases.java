package next.xadmin.login.bean;

public class City_Cases {

	
		 private String CityCode;
		 private int num_of_cases;
		 private int live_cases;
		 private int num_of_death;
		 private int vaccinated;
		 public City_Cases(String c, int a,int b,int e,int d)
		 {
			 CityCode=c;
			 num_of_cases=a;
			 live_cases=b;
			 num_of_death=e;
			 vaccinated=d;
		 }
		public String getCityCode() {
			return CityCode;
		}
		public void setCityCode(String cityCode) {
			CityCode = cityCode;
		}
		public int getNum_of_cases() {
			return num_of_cases;
		}
		public void setNum_of_cases(String num_of_cases) {
			this.num_of_cases = Integer.parseInt(num_of_cases);
		}
		public int getLive_cases() {
			return live_cases;
		}
		public void setLive_cases(String live_cases) {
			this.live_cases = Integer.parseInt(live_cases);
		}
		public int getNum_of_death() {
			return num_of_death;
		}
		public void setNum_of_death(String num_of_death) {
			this.num_of_death = Integer.parseInt(num_of_death);
		}
		public int getVaccinated() {
			return vaccinated;
		}
		public void setVaccinated(String vaccinated) {
			this.vaccinated = Integer.parseInt(vaccinated);
		}
		 

	

}
