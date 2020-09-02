package ProductCri;

/*
 *  Criteria 클래스 = (판단이나 걸정을 위한) 기준
 *  => 페이징 처리를 위해서 사용될 객체로, 페이지 번호와, 페이지당 출력할 개시글 수를 관리할 객체
 *  => 출력할 Row를 Select 하기 위한 클래스
 */
public class Criteria {
	
	private int page;					// 현재 페이지를 나타내는 필드 변수
    private int perPageNum = 21;		// 페이지당 보여줄 수
	
    private int sno=1; 					// Start Row No
    
    // select * from 테이블 order by pdseq asc limit #{pageStart}, #{perPageNum}
    // => limit 구문에서 시작 부분에 필요한 값을 반환 (mybatis에서 사용) => pageStart
    // => limit : 시작 출력 행, 몇개씩으로 ~부터 n개를 출력

    public void setSno () {
    	if (sno < 1) sno = 1;
		sno = (page-1) * perPageNum+1;
    }
    
    public int getSno() {
		return sno;
	}
    
    // return (page-1) * perPageNum
    // 1페이지일 때 -> 0 ~ 9 게시글
    // 2페이지        -> 10 ~ 19 
    // 3페이지        -> 20 ~ 29
    public int getPageStart(){
        return (this.page -1) * this.perPageNum;
    }
    
    public Criteria() { 		// 최초 default 생성자로 기본 객체 생성시 초기값을 지정
        this.page=1; 			// 사용자가 세팅하지 않으면 기본 1
        this.perPageNum=21;		// 페이지당 기본 n개씩 출력하도록 세팅
    }

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page=1;		// 페이지는 1페이지부터 = 0보다 작거나 같은값일 경우 무조건 첫번째 페이지로 설정
		} else {
			this.page= page;
		}
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
		} else {
			this.perPageNum = perPageNum;
		}
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
} // class