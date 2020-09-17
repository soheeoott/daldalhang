package criTest;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

// Criteria를 이용해서 출력할 Page View에 필요한 값을 완성
public class PageMaker {
	private int totalRow;				// Table 전체 row 개수
	private int sPageNo;				// View에 표시할 첫 PageNo
	private int ePageNo;				// View에 표시할 끝 PageNo
	private boolean prev;				// 이전 Page블럭으로
	private boolean next;				// 다음 Page블럭으로
	
	private int displayPageNo=3;		// View에 표시할 PageNo의 개수
	private int lastPageNo;
	// 출력 가능한 마지막 PageNo의 개수 (totalRow, perPageRow로 계산)
	
	private SearchCriteria cri;
	
	// Page Block 처리
	// => sPageNo, ePageNo 계산 
	// => prev, next 처리 (set)
	// => calcData() 메서드로 처리

	// 1) set
	public void setCri(SearchCriteria cri) {
		this.cri = cri;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
		calcData();
		// => totalRow를 이용해서 sPageNo, ePageNo, prev, next 처리
	} // setTotalRow
	
	public void calcData() {
		// CurrPageNo가 속한 Page Block의 ePageNo를 계산
		// => 모든 출력할 PageBlock의 ePageNo는 displayPageNo의 배수임.
		//    displayPageNo=3이면 3, 6, 9, 12...
		// => ex) 17 page 요청, displayPageNo=3 일 때 17이 몇 번째 그룹인지 계산하려면,
		//    	  17/3 -> 5 나머지 2 결론은 정수 나누기 후 나머지가 있으면 +1이 필요함
		//        -> Math.ceil(17/3) -> Math.ceit(5.73..) -> 6번째 그룹 16,17,18
		//        즉, 17이 몇 번째 그룹인지 계산하고, 여기에 *displayPageNo를 하면 됨.
		ePageNo = (int)(Math.ceil(cri.getCurrPage()/(double)displayPageNo)*displayPageNo);
		// Math.ceil(c) : 매개변수 c보다 크거나 같은 가장 작은 정수를 double 형태로 반환
		// Math.ceil(12.345) => 13.0
		sPageNo = (ePageNo-displayPageNo)+1;
		
		// 계산된 ePageNo가 totalRow로 계산한 전체 Page 개수인 totalPageNo보다 큰 경우에는
		// totalPageNo를 ePage로 함
		// => 예를 들면 totalPageNo=8인데, ePage=9인 경우 등...
		lastPageNo = (int)Math.ceil(totalRow/(double)cri.getPerPageRow());
		
		if(ePageNo>lastPageNo) {
			ePageNo = lastPageNo;
		}
		
		prev = sPageNo==1 ? false:true;
		next = ePageNo==lastPageNo ? false:true;
	} // calcData

	public int getTotalRow() {
		return totalRow;
	}
	public int getsPageNo() {
		return sPageNo;
	}
	public int getePageNo() {
		return ePageNo;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getDisplayPageNo() {
		return displayPageNo;
	}
	public int getlastPageNo() {
		return lastPageNo;
	}
	public Criteria getCri() {
		return cri;
	}
	
	// Query String 만들기
	// 패키지 org.springframework.web.util
	// => 웹개발에 필요한 많은 유틸리티 클래스 제공
	// => UriComponents, UriComponentsBuilder
	//    Uri를 동적으로 생성해 주는 클래스,
	//    파라미터가 조합된 uri를 손쉽게 만들어 줌
	// => ?page=8&perPageNum=10 이것을 만들어 줌
	public String makeQuery(int currPage) {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("currPage", currPage)
				.queryParam("PerPageRow", cri.getPerPageRow())
				.build();
		return uriComponents.toUriString();
	} // makeQuery()
	
	// 요청 uri에 검색 조건 추가
	public String makeSearch(int currPage) {
		UriComponents uriComponents = 
				UriComponentsBuilder.newInstance()
				.queryParam("currPage", currPage)
				.queryParam("PerPageRow", cri.getPerPageRow())
				.queryParam("searchType", cri.getSearchType())
				.queryParam("keyword", cri.getKeyword())
				.build();
		return uriComponents.toUriString();
	} // makeSearch()
	
	@Override
	public String toString() {
		return "PageMaker [totalRow=" + totalRow + ", sPageNo=" + sPageNo + ", ePageNo=" + ePageNo + ", prev=" + prev
				+ ", next=" + next + ", displayPageNo=" + displayPageNo + ", cri=" + cri + "]";
	}
} // class