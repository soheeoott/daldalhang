package vo;

public class LikeListVO {
	
	private int likeseq;
	private String id;
	private int pdseq;
	private int likecheck;
	private String frcode;
	private String pduploadfile;
	private String pdurl;
	private String pdname;
	private int price;
	private String hashtag;
	private String liked;
	
	public int getLikeseq() {
		return likeseq;
	}
	public void setLikeseq(int likeseq) {
		this.likeseq = likeseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPdseq() {
		return pdseq;
	}
	public void setPdseq(int pdseq) {
		this.pdseq = pdseq;
	}
	public int getLikecheck() {
		return likecheck;
	}
	public void setLikecheck(int likecheck) {
		this.likecheck = likecheck;
	}
	public String getFrcode() {
		return frcode;
	}
	public void setFrcode(String frcode) {
		this.frcode = frcode;
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
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public String getLiked() {
		return hashtag;
	}
	public void setLiked(String liked) {
		this.liked = liked;
	}
	@Override
	public String toString() {
		return "LikeListVO [likeseq=" + likeseq + ", id=" + id + ", pdseq=" + pdseq + ", likecheck=" + likecheck
				+ ", frcode=" + frcode + ", pduploadfile=" + pduploadfile + ", pdurl=" + pdurl + ", pdname=" + pdname
				+ ", price=" + price + ", hashtag=" + hashtag + ", liked=" + liked + "]";
	}
}
