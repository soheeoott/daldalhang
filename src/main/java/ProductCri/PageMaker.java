package ProductCri;

import vo.MenuVO;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

/*
 *  페이지 처리에 필요한 것들을 처리하는 기능을 모듈화시키기 위해 만든 클래스
 *  PageMaker 객체를 사용할 때에는 setCriteria()와 setTotalCount()를 먼저 호출해서 값을 지정
 */

// Criteria를 이용해서 출력할 Page View에 필요한 값을 완성
public class PageMaker extends Criteria {
	
	// page와 perPageNum을 이용하려면 Criteria 세팅
	
	/*
	 * private Criteria pcri; // page, perPageNum
	 */
	
	MenuVO mvo = new MenuVO();
	
	private int totalCount;				// 전체 게시글 수
										// Mapper.xml 을 통해 DB에서 전체 게시글 수를 가져옴
	
	// [11][12][13].......[20] : 현재 페이지 13 = (startPage = 11, endPage = 20)
	
    private int startPage=1;				// 게시글 번호에 따른 (보여지는) 페이지의 시작 번호
    									// 현재 페이지가 12 = 11페이지가 startPage
    									// 현재 페이지가 27 = 21페이지가 startPage
    	
    private int endPage;				// 게시글 번호에 따른 (보여지는) 페이지의 마지막 번호
    
    private boolean prev;				// [이전]으로 이동하는 버튼이 생길 조건
    private boolean next;				// [다음]으로 이동하는 버튼이 생길 조건
    
    private boolean start;				// [처음]으로 이동하는 버튼이 생길 조건
    private boolean end;				// [끝]으로 이동하는 버튼이 생길 조건
    
    private int displayPageNum =10;		// 화면 하단에 보여지는 페이지의 개수
    private int tempEndPage;
    
    // 전체 게시글 수
    // 다른 변수들에 대한 계산 = totalCount(전체 게시글 수) 먼저 세팅
    
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        
        // 전체 필드 변수들 세팅 : 전체 게시글 수의 setter가 호출될 때 전체 세팅되도록 함
        calcData();						
    }
    
    // 전체 필드 변수 값들을 계산하는 메서드
    private void calcData() {
    	 
    	// 페이지의 마지막 번호
    	// (현재 페이지 / 화면 하단 페이지의 개수) * 화면 하단 페이지의 개수)
    	// endPage = (무조건올림)(현재 페이지 / 페이지당 보여줄 게시글 수) * 페이지당 보여줄 게시글 수

        endPage = (int) (Math.ceil(getPage() / (double) displayPageNum) * displayPageNum);
 
        // 페이지의 시작 번호
        // (페이지의 마지막 번호 - 화면 하단 페이지의 개수) +1
        // startPage = 마지막 페이지 - 페이지당 보여질 게시글 수
        startPage = (endPage - displayPageNum) +1;

        // (전체 게시글 수 / 페이지당 보여줄 수)
        // endPage = 현재페이지 기준의 마지막 페이지
        // 전체 게시글에 대한 마지막 페이지를 알고 있어야 => boolean next 처리
        int tempEndPage = (int) (Math.ceil(totalCount / (double) getPerPageNum()));
        this.tempEndPage = tempEndPage;
 
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
 
        // 이전
        prev = startPage == 1 ? false : true; 	// 1페이지면 이전 누를 수 없게 false
        
        // 다음
        // 페이지의 마지막 번호 * 페이지당 보여줄 수 >= 전체 게시글 수
        next = endPage * getPerPageNum() >= totalCount ?false :true;
        
        // 처음
        start = (startPage > 1 == true);
        
        // 끝
        end = getPage() <= tempEndPage == true;
    }
    
    public String makeQuery(int page) {
		
        UriComponents uriComponents = UriComponentsBuilder.newInstance()
        		.queryParam("page", page)
                .queryParam("perPageNum", getPerPageNum())
                /*
                .queryParam("mubcode", mvo.getMubcode())
                .queryParam("mucategory", mvo.getMucategory())
                */
                .build();
 
        return uriComponents.toUriString();
    }

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	public boolean isStart() {
		return start;
	}

	public void setStart(boolean start) {
		this.start = start;
	}
	
	public boolean isEnd() {
		return end;
	}

	public void setEnd(boolean end) {
		this.end = end;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public int getTempEndPage() {
		return tempEndPage;
	}

	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
}