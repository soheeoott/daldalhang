package criTest;

// Criteria : (판단이나 걸정을 위한) 기준
// => 출력할 Row를 Select 하기 위한 클래스
public class Criteria {
	private int currPage;				// 출력할(요청받은) PageNo (current Page)
	private int perPageRow;				// 1페이지당 보여 줄 row(record, 튜플)의 개수
	private int sno;					// start Row No
	private int eno;					// end Row No
	
	// 생성자로 초기화
	public Criteria() {
		this.currPage=1;
		this.perPageRow=10;
	}
	
	// 1) 출력할(요청받은) PageNo set
	public void setCurrPage(int currPage) {
		if(currPage<1) {
			currPage=1;
		} 
		this.currPage = currPage;
	}
	// 2) 1페이지당 보여 줄 row(record, 튜플)의 개수 확인
	public void setPerPageRow(int perPageRow) {
		if(perPageRow<1 || perPageRow>50) {
			perPageRow=5;
		}
		this.perPageRow = perPageRow;
	}
	// 3) startRowNo, endRowNo 계산	
	public void setSnoEno() {
		if(sno<1) {
			sno=1;
		}
		sno = (currPage-1)*perPageRow+1;
		eno = (sno+perPageRow)-1;
	}

	// getter
	public int getCurrPage() {
		return currPage;
	}
	public int getPerPageRow() {
		return perPageRow;
	}
	public int getSno() {
		return sno;
	}
	public int getEno() {
		return eno;
	}
	
	// toString()
	@Override
	public String toString() {
		return "Criteria [currPage=" + currPage + ", perPageRow=" + perPageRow + ", sno=" + sno + ", eno=" + eno + "]";
	}
} // class