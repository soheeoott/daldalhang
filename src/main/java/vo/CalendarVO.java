package vo;

public class CalendarVO {
	
	private String calseq;
	private String caltitle;
	private String calcontent;
	private String start_date;
	private String end_date;
	private String frkname;
	private String username;
	private String frcolor;
	private String textColor;
	private String allday;
	private String curMon;
	private String frcode;
	private String editurl;
	private String eventImg;
	
	public String getEventImg() {
		return eventImg;
	}
	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}
	public String getEditurl() {
		return editurl;
	}
	public void setEditurl(String editurl) {
		this.editurl = editurl;
	}
	public String getFrcode() {
		return frcode;
	}
	public void setFrcode(String frcode) {
		this.frcode = frcode;
	}
	public String getCurMon() {
		return curMon;
	}
	public void setCurMon(String curMon) {
		this.curMon = curMon;
	}
	public String getCalseq() {
		return calseq;
	}
	public void setCalseq(String calseq) {
		this.calseq = calseq;
	}
	public String getCaltitle() {
		return caltitle;
	}
	public void setCaltitle(String caltitle) {
		this.caltitle = caltitle;
	}
	public String getCalcontent() {
		return calcontent;
	}
	public void setCalcontent(String calcontent) {
		this.calcontent = calcontent;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getFrkname() {
		return frkname;
	}
	public void setFrkname(String frkname) {
		this.frkname = frkname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFrcolor() {
		return frcolor;
	}
	public void setFrcolor(String frcolor) {
		this.frcolor = frcolor;
	}
	public String getTextColor() {
		return textColor;
	}
	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}
	public String getAllday() {
		return allday;
	}
	public void setAllday(String allday) {
		this.allday = allday;
	}
	
	@Override
	public String toString() {
		return "CalendarVO [calseq=" + calseq + ", caltitle=" + caltitle + ", calcontent=" + calcontent
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", frkname=" + frkname + ", username="
				+ username + ", frcolor=" + frcolor + ", textColor=" + textColor + ", allday=" + allday + ", curMon="
				+ curMon + ", frcode=" + frcode + ", editurl=" + editurl + ", eventImg=" + eventImg + "]";
	}
} 