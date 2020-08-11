package vo;

public class MenuVO {
	
	private String mucode;
	private String mucategory;
	private String muname;
	private String mubcode;
	
	public String getMucode() {
		return mucode;
	}
	public void setMucode(String mucode) {
		this.mucode = mucode;
	}
	public String getMucategory() {
		return mucategory;
	}
	public void setMucategory(String mucategory) {
		this.mucategory = mucategory;
	}
	public String getMuname() {
		return muname;
	}
	public void setMuname(String muname) {
		this.muname = muname;
	}
	public String getMubcode() {
		return mubcode;
	}
	public void setMubcode(String mubcode) {
		this.mubcode = mubcode;
	}
	
	@Override
	public String toString() {
		return "MenuVO [mucode=" + mucode + ", mucategory=" + mucategory + ", muname=" + muname + ", mubcode=" + mubcode
				+ "]";
	}
}