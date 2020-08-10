package vo;

public class FranchiseVO {

	private String frcode;
	private String frename;
	private String frkname;
	private String fruploadfile;
	
	public String getFrcode() {
		return frcode;
	}
	public void setFrcode(String frcode) {
		this.frcode = frcode;
	}
	public String getFrename() {
		return frename;
	}
	public void setFrename(String frename) {
		this.frename = frename;
	}
	public String getFrkname() {
		return frkname;
	}
	public void setFrkname(String frkname) {
		this.frkname = frkname;
	}
	public String getFruploadfile() {
		return fruploadfile;
	}
	public void setFruploadfile(String fruploadfile) {
		this.fruploadfile = fruploadfile;
	}
	
	@Override
	public String toString() {
		return "FranchiseVO [frcode=" + frcode + ", frename=" + frename + ", frkname=" + frkname + ", fruploadfile="
				+ fruploadfile + "]";
	}
}