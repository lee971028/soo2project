<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
   AjaxBoardDao dao=new AjaxBoardDao();
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
   
   
 //변수
   int totalCount;
   int totalPage;
   int startPage;
   int endPage;
   int start;
   int perPage=5;
   int perBlock=5;
   int currentPage;
   int no;


   totalCount=dao.getTotalCount();

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
   
   List<AjaxBoardDto> list=dao.getpagelist(start, perPage);
   
   //json라이브러리 이용해서 json데이타 생성
   JSONArray arr=new JSONArray();
   
   for(AjaxBoardDto dto:list)
   {
	   JSONObject ob=new JSONObject();
	   ob.put("num", dto.getNum());
	   ob.put("writer", dto.getWriter());
	   ob.put("subject", dto.getSubject());
	   ob.put("content", dto.getContent());
	   ob.put("avata", dto.getAvata());
	   ob.put("writeday", sdf.format(dto.getWriteday()));
	   
	   arr.add(ob);
   }
%>

<%=arr.toString()%>