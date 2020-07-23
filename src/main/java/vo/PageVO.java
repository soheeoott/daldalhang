package vo;

import java.util.List;

public class PageVO {

	private List<NoticeVO> list;		// 조회 결과 출력할 DataSet 목록
	private int currPage;				// 출력할(요청받은) PageNo (current Page)
	private int perPage=10;				// 1페이지당 보여 줄 row(record, 튜플)의 개수
	private int totalCount;				// 전체 row 개수
	private int sno;					// start Row No
	private int eno;					// end Row No
	private int perPageNo=3;			// 한 화면에 출력되는 PageNo 개수
	// => Paging2에서 사용
	
	@Override
	public String toString() {
		return "PageVO [list=" + list + ", currPage=" + currPage + ", perPage=" + perPage + ", totalCount=" + totalCount
				+ ", sno=" + sno + ", eno=" + eno + ", perPageNo=" + perPageNo + "]";
	}
	
	public List<NoticeVO> getList() {
		return list;
	}

	public void setList(List<NoticeVO> list) {
		this.list = list;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public int getPerPageNo() {
		return perPageNo;
	}
	public void setPerPageNo(int perPageNo) {
		this.perPageNo = perPageNo;
	}
} // class