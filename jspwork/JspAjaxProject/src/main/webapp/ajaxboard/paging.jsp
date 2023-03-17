<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 	

AjaxBoardDao dao=new AjaxBoardDao();

//변수
int totalPage;
int startPage;
int endPage;
int start;
int perPage=3;
int perBlock=5;
int currentPage;
int no;

String searchtool=request.getParameter("searchtool");

int totalCount=dao.getTotalCount();





if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

startPage=(currentPage-1)/perBlock*perBlock+1;
endPage=startPage+perBlock-1;

if(endPage>totalPage)
	endPage=totalPage;

start=(currentPage-1)*perPage;


//검색 내용 추가 필요
//String searchtool=request.getParameter("searchtool");
//
//if(searchtool==null){
//	List<AdminboardDto> list=dao.getlistsearch(start, perPage, "");
//}else{
//	List<AdminboardDto> list=dao.getlistsearch(start, perPage, searchtool);
//}


List<AjaxBoardDto> list=dao.getpagelist(start, perPage);

no=totalCount-(currentPage-1)*perPage;

SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");

JSONObject ob=new JSONObject();

ob.put("startPage", startPage);
ob.put("endPage", endPage);
ob.put("currentPage", currentPage);
ob.put("totalPage", totalPage);
ob.put("list", list);

%>

<%=ob.toString()%>
