package vo;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	
	private int pdseq;
	private String frcode;
	private int bcode;
	private String bname;
	private int mcode;
	private String mname;
	private int pdcode;
	private String pdname;
	private int price;
	private String pduploadfile;
	private String pdurl;
	private String hashtag;
	private String mucode1;
	private String mucode2;
	private String mucode3;
	private String liked;
	private MultipartFile uploadfilef; // form 의 inputTag 의 값 전달받기 // 설정 파일 필요

	public int getPdseq() {
		return pdseq;
	}

	public void setPdseq(int pdseq) {
		this.pdseq = pdseq;
	}

	public String getFrcode() {
		return frcode;
	}

	public void setFrcode(String frcode) {
		this.frcode = frcode;
	}

	public int getBcode() {
		return bcode;
	}

	public void setBcode(int bcode) {
		this.bcode = bcode;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public int getMcode() {
		return mcode;
	}

	public void setMcode(int mcode) {
		this.mcode = mcode;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getPdcode() {
		return pdcode;
	}

	public void setPdcode(int pdcode) {
		this.pdcode = pdcode;
	}

	public String getPdname() {
		return pdname;
	}

	public void setPdname(String pdname) {
		this.pdname = pdname;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPduploadfile() {
		return pduploadfile;
	}

	public void setPduploadfile(String pduploadfile) {
		this.pduploadfile = pduploadfile;
	}

	public String getPdurl() {
		return pdurl;
	}

	public void setPdurl(String pdurl) {
		this.pdurl = pdurl;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getMucode1() {
		return mucode1;
	}

	public void setMucode1(String mucode1) {
		this.mucode1 = mucode1;
	}

	public String getMucode2() {
		return mucode2;
	}

	public void setMucode2(String mucode2) {
		this.mucode2 = mucode2;
	}

	public String getMucode3() {
		return mucode3;
	}

	public void setMucode3(String mucode3) {
		this.mucode3 = mucode3;
	}

	public MultipartFile getUploadfilef() {
		return uploadfilef;
	}

	public void setUploadfilef(MultipartFile uploadfilef) {
		this.uploadfilef = uploadfilef;
	}
	
	public String getLiked() {
		return liked;
	}

	public void setLiked(String liked) {
		this.liked = liked;
	}

	@Override
	public String toString() {
		return "ProductVO [pdseq=" + pdseq + ", frcode=" + frcode + ", bcode=" + bcode + ", bname=" + bname + ", mcode="
				+ mcode + ", mname=" + mname + ", pdcode=" + pdcode + ", pdname=" + pdname + ", price=" + price
				+ ", pduploadfile=" + pduploadfile + ", pdurl=" + pdurl + ", hashtag=" + hashtag + ", mucode1="
				+ mucode1 + ", mucode2=" + mucode2 + ", mucode3=" + mucode3 + ", uploadfilef=" + uploadfilef + "]";
	}
}