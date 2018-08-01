package util;

public class MyUtil {

	// 페이징 처리
	
	//전체 페이지 수
	public int getPageCount (int numPerPage, int dataCount){
		int pageCount = 0 ;
		pageCount = dataCount / numPerPage;
		
		//데이터 갯수 5개, 페이지당 데이터 갯수 3개 인경우 카운트가 0 이 된다..
		if(dataCount % numPerPage != 0){
			pageCount ++;
		}
		return pageCount; // 전체 페이지 수 
	}
	
	//페이징처리 메소드
	// currentPage : 현재 표시할 페이지
	// totalPage : 전체 페이시수
	// listUrl : 링크를 설정할 url
	
	public String pageIndexList(int currentPage, int totalPage, String listUrl){
		
		int numPerBlock = 5;
		
		int currentPageSetup; // 표시할 첫페이지 -1
		
		int page ;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage == 0 || totalPage ==0){
			return "";
		}
		
		// list.jsp 
		// list.jsp?searchKey=subject&sarchValue='수지' 에 담겨온다(get방식으로( 
		
		if(listUrl.indexOf("?") != -1){//?있을 경우 true(검색했을 경우) 
			listUrl = listUrl+ "&";
			//parameter가 같이 왔을경우(검색했을 경우)
		}else{
			listUrl = listUrl+ "?";
			//parameter가 같이 오지 않았을 경우(검색하지 않았을 경우)
		}
		
		//표시할 페이지에 -1한값
		currentPageSetup = (currentPage/numPerBlock) * numPerBlock ;
						 //(현재페이지 이전에 numperBlock 단위의 블럭의 수)

		//위의 방식으로 currentPageSetup을 설정할 경우 +1 된 세팅값을 얻는다.
		if(currentPage % numPerBlock ==0){
		//(현재페이지가 블럭의 마지막일때)	
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		//◀이전
		
		if(totalPage > numPerBlock && currentPageSetup > 0){
		//(전체 페이지수 보다 블럭단위가 작고 현재 블럭의 시작점이 1이 아닐때)
			//현재 블럭의 시작점이 1이라면 currentPageSetup이 0이다.
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a herf="list.jsp?pageNum=5">◀이전</a>&nbsp;
		}
		
		//바로가기 페이지
		page = currentPageSetup +1;
		//블럭의 시작점-1이 currentPageSetup의 초기 설정값
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
			//페이지는 블럭의 첫번째값부터 마지막값까지 생성
			//전체 페이지수보다 작거나 블럭의 마지막 값보다 작을때
			if(page == currentPage){
				sb.append("<font color =\"Fuchsia\">" + page + "</font>&nbsp;");
				// <font color ="Fuchsia">page</font>&nbsp;
				
			}else{
				sb.append("<a href=\"" + listUrl + "pageNum="+page+"\">" + page + "</a>&nbsp;");
				//<a herf="list.jsp?pageNum=9">9</a>&nbsp;
			}
			
			//java.lang.OutOfMemoryError: Java heap space
			//while문이 무한루프를 돌아서 생기는 에러. while문을 사용할때는 주의 하도록한다.
			page++;
			
		}
		
		// ▶다음
		
		if(totalPage-currentPageSetup > numPerBlock){
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">▶다음</a>&nbsp;");
			//<a herf="list.jsp?pageNum=11">▶다음</a>&nbsp;
		}
		
		//System.out.println(sb.toString());
		//다르게 출력된다. 에러를 확인할때만 사용하고 주석처리한다.
		
		return sb.toString();
	}
	
}
