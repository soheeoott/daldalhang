package vo;

public class PrevNextVO {
	private int seq;
	private String id;
	private int prevSeq;
	private String prevTitle;
	private int nextSeq;
	private String nextTitle;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPrevSeq() {
		return prevSeq;
	}
	public void setPrevSeq(int prevSeq) {
		this.prevSeq = prevSeq;
	}
	public String getPrevTitle() {
		return prevTitle;
	}
	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}
	public int getNextSeq() {
		return nextSeq;
	}
	public void setNextSeq(int nextSeq) {
		this.nextSeq = nextSeq;
	}
	public String getNextTitle() {
		return nextTitle;
	}
	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}
	
	@Override
	public String toString() {
		return "PrevNextVO [seq=" + seq + ", id=" + id + ", prevSeq=" + prevSeq + ", prevTitle=" + prevTitle
				+ ", nextSeq=" + nextSeq + ", nextTitle=" + nextTitle + "]";
	}
}
