package vo;

public class FranchisecodeVO {

	private String fcode;
	private String franchisename;
	
	public String getFcode() {
		return fcode;
	}
	public void setFcode(String fcode) {
		this.fcode = fcode;
	}
	public String getFranchisename() {
		return franchisename;
	}
	public void setFranchisename(String franchisename) {
		this.franchisename = franchisename;
	}
	
	@Override
	public String toString() {
		return "MetacodeVO [fcode=" + fcode + ", franchisename=" + franchisename + "]";
	}
}