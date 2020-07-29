package vo;

public class LlmapVO {
	private String llcode;
	private String frcode;
	private String frkname;
	private String llname;
	private String lladdr;
	private String streetnum;
	private String latvalue;
	private String lngvalue;
	public String getLlcode() {
		return llcode;
	}
	public void setLlcode(String llcode) {
		this.llcode = llcode;
	}
	public String getFrcode() {
		return frcode;
	}
	public void setFrcode(String frcode) {
		this.frcode = frcode;
	}
	public String getFrkname() {
		return frkname;
	}
	public void setFrkname(String frkname) {
		this.frkname = frkname;
	}
	public String getLlname() {
		return llname;
	}
	public void setLlname(String llname) {
		this.llname = llname;
	}
	public String getLladdr() {
		return lladdr;
	}
	public void setLladdr(String lladdr) {
		this.lladdr = lladdr;
	}
	public String getStreetnum() {
		return streetnum;
	}
	public void setStreetnum(String streetnum) {
		this.streetnum = streetnum;
	}
	public String getLatvalue() {
		return latvalue;
	}
	public void setLatvalue(String latvalue) {
		this.latvalue = latvalue;
	}
	public String getLngvalue() {
		return lngvalue;
	}
	public void setLngvalue(String lngvalue) {
		this.lngvalue = lngvalue;
	}
	
	@Override
	public String toString() {
		return "llmapVO [llcode=" + llcode + ", frcode=" + frcode + ", frkname=" + frkname + ", llname=" + llname
				+ ", lladdr=" + lladdr + ", streetnum=" + streetnum + ", latvalue=" + latvalue + ", lngvalue="
				+ lngvalue + "]";
	}
}