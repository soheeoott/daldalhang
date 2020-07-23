package vo;

public class ProductVO {
	
	private int pseq;
	private String fcode;
	private int bcode;
	private String bname;
	private int mcode;
	private String mname;
	private int productcode;
	private String productname;
	private int price; 
	private String imgpath;
	private String producturl;
	private String hashtag;
	private String mtcode1;
	private String mtcode2;
	private String mtcode3;
	
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getFcode() {
		return fcode;
	}
	public void setFcode(String fcode) {
		this.fcode = fcode;
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
	public int getProductcode() {
		return productcode;
	}
	public void setProductcode(int productcode) {
		this.productcode = productcode;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getProducturl() {
		return producturl;
	}
	public void setProducturl(String producturl) {
		this.producturl = producturl;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getMtcode1() {
		return mtcode1;
	}
	public void setMtcode1(String mtcode1) {
		this.mtcode1 = mtcode1;
	}
	public String getMtcode2() {
		return mtcode2;
	}
	public void setMtcode2(String mtcode2) {
		this.mtcode2 = mtcode2;
	}
	public String getMtcode3() {
		return mtcode3;
	}
	public void setMtcode3(String mtcode3) {
		this.mtcode3 = mtcode3;
	}
	
	@Override
	public String toString() {
		return "ProductVO [pseq=" + pseq + ", fcode=" + fcode + ", bcode=" + bcode + ", bname=" + bname + ", mcode="
				+ mcode + ", mname=" + mname + ", productcode=" + productcode + ", productname=" + productname
				+ ", price=" + price + ", imgpath=" + imgpath + ", producturl=" + producturl + ", hashtag=" + hashtag
				+ ", mtcode1=" + mtcode1 + ", mtcode2=" + mtcode2 + ", mtcode3=" + mtcode3 + "]";
	}
}