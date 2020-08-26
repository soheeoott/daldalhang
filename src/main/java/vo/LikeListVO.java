package vo;

public class LikeListVO {
	
	private int likeseq;
	private String id;
	private int pdseq;
	private int likecheck;
	
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
	
	@Override
	public String toString() {
		return "LikeListVO [likeseq=" + likeseq + ", id=" + id + ", pdseq=" + pdseq + ", likecheck=" + likecheck + "]";
	}
}
