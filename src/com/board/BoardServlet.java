package com.board;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBCPConn;
import util.MyUtil;

public class BoardServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
	}
	
	
	//포워드 메소드, url을 받아서 포워딩 한다.
	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		
		Connection conn = DBCPConn.getConnection();
		BoardDAO dao = new BoardDAO(conn);
		
		MyUtil myUtill = new MyUtil();
		
		String url ="";
		String uri = req.getRequestURI();
		
		//study/bbs/list.jsp   - 실제주소
		//study/sboard/list.do - 가상주소
		
		//created.do
		if(uri.indexOf("created.do")!=-1){
			
			url ="/bbs/created.jsp";
			forward(req,resp,url);
			
		//created_ok.do	
		}else if(uri.indexOf("created_ok.do")!=-1){
			
			BoardDTO dto = new BoardDTO();
			
			int maxNum = dao.getMaxNum();
			
			dto.setNum(maxNum+1);
			dto.setName(req.getParameter("name"));
			dto.setContent(req.getParameter("content"));
			dto.setEmail(req.getParameter("email"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setSubject(req.getParameter("subject"));
			dto.setIpAddr(req.getRemoteAddr());
			
			dao.insertData(dto);
			
			//insert, update, delete, (session이 바뀌었을때..)
			//redirect한다.
			
			url=cp+"/sboard/list.do";//가상의 주소를 사용해야한다.
			resp.sendRedirect(url);
		//list.do
		}else if(uri.indexOf("list.do")!=-1){
			
			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			if(pageNum!=null){
				currentPage = Integer.parseInt(pageNum);
			}
			
			//검색
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchKey==null){
				searchKey="subject";
				searchValue="";
			}else{
				if(req.getMethod().equalsIgnoreCase("GET")){
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
				
			}
			
			//전체 데이터 갯수
			int numPerPage = 5;
			int dataCount = dao.getDataCount(searchKey, searchValue);
			int totalPage = myUtill.getPageCount(numPerPage, dataCount);
			
			//삭제로 전체 페이지수보다 표시할 페이지가 큰경우
			if(currentPage>totalPage){
				currentPage=totalPage;
			}
			
			//가져올 데이터의 시작과 끝 인덱스
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);
			
			//페이징 처리
			String param = "";
			if(!searchValue.equals("")){
				param = "searchKey="+ searchKey;
				param += "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			String listUrl = cp+"/sboard/list.do";
			
			//검색을 했을경우
			if(!param.equals("")){
				listUrl = listUrl+"?"+param;
			}
			//footer
			String pageIndexList = myUtill.pageIndexList(currentPage, totalPage, listUrl);
			
			
			//글보기 주소
			String articleUrl = cp +"/sboard/article.do?pageNum="+currentPage;
			if(!param.equals("")){
				articleUrl = articleUrl+"&"+param;
			}
			
			//포워딩 페이지에 데이터를 넘김
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);//footer
			req.setAttribute("dataCount", dataCount);//footer
			req.setAttribute("articleUrl", articleUrl);//pageNum,searchKey,searchValue
			
			url="/bbs/list.jsp";
			forward(req,resp,url);
		//article.do
		}else if(uri.indexOf("article.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue!=null){
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			
			//조회수 증가
			dao.updateHitCount(num);
			
			//데이터 읽기
			BoardDTO dto = dao.getReadData(num);
			
			if(dto==null){
				url = cp + "/sboard/list.do";
				resp.sendRedirect(url);
			}
			
			int lineNum = dto.getContent().split("\n").length;
			dto.setContent(dto.getContent().replaceAll("\n", "<br/>"));
			
			String param = "pageNum="+pageNum;
			if(searchKey!=null){
				param += "&searchKey="+searchKey;
				param += "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			req.setAttribute("dto", dto);
			req.setAttribute("params", param);
			req.setAttribute("lineNum", lineNum);
			req.setAttribute("pageNum", pageNum);
			
			
			url = "/bbs/article.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("update.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			if(searchValue!=null){
				searchValue = URLDecoder.decode(searchValue, "UTF-8");
			}
			
			BoardDTO dto = dao.getReadData(num);
			
			if(dto==null){
				url = cp+"/sboard/list.do";
				resp.sendRedirect(url);
			}
			
			String param = "pageNum="+pageNum;
			if(searchKey!=null){
				param += "&searchKey="+searchKey;
				param += "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			
			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("params", param);
			req.setAttribute("searchKey", searchKey);
			req.setAttribute("searchValue", searchValue);
			
			url = "/bbs/update.jsp";
			forward(req, resp, url);
		//update_ok.do	
		}else if(uri.indexOf("update_ok.do")!=-1){
			
			String pageNum = req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			BoardDTO dto = new BoardDTO();
			
			dto.setNum(Integer.parseInt(req.getParameter("num")));
			dto.setSubject(req.getParameter("subject"));
			dto.setName(req.getParameter("name"));
			dto.setContent(req.getParameter("content"));
			dto.setEmail(req.getParameter("email"));
			dto.setPwd(req.getParameter("pwd"));
			
			dao.updateData(dto);
			
			
			String param = "pageNum="+pageNum;
			if(searchKey!=null){
				param += "&searchKey="+searchKey;
				param += "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			
			url = cp +"/sboard/list.do?"+param; 
			resp.sendRedirect(url);
			
			
		}else if(uri.indexOf("delete_ok.do")!=-1){
			
			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");
			
			dao.deleteData(num);
			
			String param = "pageNum="+pageNum;
			if(searchKey!=null){
				param += "&searchKey="+searchKey;
				param += "&searchValue="+URLEncoder.encode(searchValue, "UTF-8");
			}
			
			
			url = cp +"/sboard/list.do?"+param; 
			resp.sendRedirect(url);
			
			
		}
			
		
		
	}
		
	
	
}
















































