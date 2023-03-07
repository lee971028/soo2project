<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.SmartDto"%>
<%@page import="data.dao.SmartDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
span.day{
  color: gray;
  font-size: 0.8em;
}
</style>
</head>
<body>
<%

	SmartDao dao=new SmartDao();

	String num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//조회수증가
	dao.updateReadcount(num);
	
	//dto가져오기
	SmartDto dto=dao.getData(num);
	
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
%>

<div style="margin: 30px 30px;">
  <table class="table table-bordered" style="width: 500px;">
    <caption>
            <h3><b><%=dto.getSubject() %></b></h3></caption>
       
       <tr>
         <td>
           <b>작성자: <%=dto.getWriter() %></b><br>
           <span class="day"><%=sdf.format(dto.getWriteday()) %>
           &nbsp;&nbsp;조회 <%=dto.getReadcount() %>
           </span>
         </td>
       </tr>
       
       <tr>
         <td>
           <%=dto.getContent() %>
         </td>
       </tr>
       
       <tr>
         <td align="right">
           <button type="button" class="btn btn-default" 
           onclick="location.href='index.jsp?main=board/smartform.jsp'">
           <span class="glyphicon glyphicon-pencil"></span>글쓰기</button>
           
           
           <button type="button" class="btn btn-default" 
           onclick="location.href='index.jsp?main=board/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>'">
           <span class="glyphicon glyphicon-edit"></span>수정</button>
           
           
           <button type="button" class="btn btn-default" 
           onclick="funcdel(<%=num%>,<%=currentPage%>)"><span class="glyphicon glyphicon-remove"></span>삭제</button>
           
           
           <button type="button" class="btn btn-default" 
           onclick="location.href='index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage%>'">
            <span class="glyphicon glyphicon-th-list"></span>목록</button>
         </td>
       </tr>
  </table>
</div>


<script type="text/javascript">
  function funcdel(num,currentPage){
	  
	 // alert(num+","+currentPage);
	 
	 var a=confirm("삭제하려면 [확인] 을 눌러주세요");
	 
	 if(a){
		 location.href="board/delete.jsp?num="+num+"&currentPage="+currentPage;
	 }
	 
  }

</script>
</body>
</html>