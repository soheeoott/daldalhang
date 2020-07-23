package vo;

public class MetacodeVO {
	
	private String mtcode;
	private String mtcategory;
	private String mtname;
	
	public String getMtcode() {
		return mtcode;
	}
	public void setMtcode(String mtcode) {
		this.mtcode = mtcode;
	}
	public String getMtcategory() {
		return mtcategory;
	}
	public void setMtcategory(String mtcategory) {
		this.mtcategory = mtcategory;
	}
	public String getMtname() {
		return mtname;
	}
	public void setMtname(String mtname) {
		this.mtname = mtname;
	}
	
	@Override
	public String toString() {
		return "MetacodeVO [mtcode=" + mtcode + ", mtcategory=" + mtcategory + ", mtname=" + mtname + "]";
	}
}