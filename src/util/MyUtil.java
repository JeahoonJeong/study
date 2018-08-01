package util;

public class MyUtil {

	// ����¡ ó��
	
	//��ü ������ ��
	public int getPageCount (int numPerPage, int dataCount){
		int pageCount = 0 ;
		pageCount = dataCount / numPerPage;
		
		//������ ���� 5��, �������� ������ ���� 3�� �ΰ�� ī��Ʈ�� 0 �� �ȴ�..
		if(dataCount % numPerPage != 0){
			pageCount ++;
		}
		return pageCount; // ��ü ������ �� 
	}
	
	//����¡ó�� �޼ҵ�
	// currentPage : ���� ǥ���� ������
	// totalPage : ��ü ���̽ü�
	// listUrl : ��ũ�� ������ url
	
	public String pageIndexList(int currentPage, int totalPage, String listUrl){
		
		int numPerBlock = 5;
		
		int currentPageSetup; // ǥ���� ù������ -1
		
		int page ;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage == 0 || totalPage ==0){
			return "";
		}
		
		// list.jsp 
		// list.jsp?searchKey=subject&sarchValue='����' �� ��ܿ´�(get�������( 
		
		if(listUrl.indexOf("?") != -1){//?���� ��� true(�˻����� ���) 
			listUrl = listUrl+ "&";
			//parameter�� ���� �������(�˻����� ���)
		}else{
			listUrl = listUrl+ "?";
			//parameter�� ���� ���� �ʾ��� ���(�˻����� �ʾ��� ���)
		}
		
		//ǥ���� �������� -1�Ѱ�
		currentPageSetup = (currentPage/numPerBlock) * numPerBlock ;
						 //(���������� ������ numperBlock ������ ���� ��)

		//���� ������� currentPageSetup�� ������ ��� +1 �� ���ð��� ��´�.
		if(currentPage % numPerBlock ==0){
		//(������������ ���� �������϶�)	
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		//������
		
		if(totalPage > numPerBlock && currentPageSetup > 0){
		//(��ü �������� ���� �������� �۰� ���� ���� �������� 1�� �ƴҶ�)
			//���� ���� �������� 1�̶�� currentPageSetup�� 0�̴�.
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">������</a>&nbsp;");
			//<a herf="list.jsp?pageNum=5">������</a>&nbsp;
		}
		
		//�ٷΰ��� ������
		page = currentPageSetup +1;
		//���� ������-1�� currentPageSetup�� �ʱ� ������
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)){
			//�������� ���� ù��°������ ������������ ����
			//��ü ������������ �۰ų� ���� ������ ������ ������
			if(page == currentPage){
				sb.append("<font color =\"Fuchsia\">" + page + "</font>&nbsp;");
				// <font color ="Fuchsia">page</font>&nbsp;
				
			}else{
				sb.append("<a href=\"" + listUrl + "pageNum="+page+"\">" + page + "</a>&nbsp;");
				//<a herf="list.jsp?pageNum=9">9</a>&nbsp;
			}
			
			//java.lang.OutOfMemoryError: Java heap space
			//while���� ���ѷ����� ���Ƽ� ����� ����. while���� ����Ҷ��� ���� �ϵ����Ѵ�.
			page++;
			
		}
		
		// ������
		
		if(totalPage-currentPageSetup > numPerBlock){
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">������</a>&nbsp;");
			//<a herf="list.jsp?pageNum=11">������</a>&nbsp;
		}
		
		//System.out.println(sb.toString());
		//�ٸ��� ��µȴ�. ������ Ȯ���Ҷ��� ����ϰ� �ּ�ó���Ѵ�.
		
		return sb.toString();
	}
	
}
