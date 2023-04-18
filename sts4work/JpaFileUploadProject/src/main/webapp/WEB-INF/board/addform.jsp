<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@100;300;400;500&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div style="margin: 50px 200px;">
  <form action="insert" method="post" enctype="multipart/form-data">
     <table class="table table-bordered" style="width: 500px;">
         <caption><b>새글쓰기</b></caption>
           <tr>
             <th width="120" bgcolor="lightgray">작성자</th>
             <td>
               <input type="text" name="writer" required="required" class="form-control"
               style="width: 150px;">
             </td>
           </tr>
           
           <tr>
             <th width="120" bgcolor="lightgray">제목</th>
             <td>
               <input type="text" name="subject" required="required" class="form-control"
               style="width: 350px;">
             </td>
           </tr>
           
           <tr>
             <th width="120" bgcolor="lightgray">사진</th>
             <td>
               <input type="file" name="upload"  class="form-control"
               style="width: 250px;">
             </td>
           </tr>
           
           <tr>
             <td colspan="2">
                 <textarea style="width: 480px; height: 150px;" name="content" required="required"></textarea>
             </td>
           </tr>
           
           <tr>
             <td colspan="2" align="center">
               <button type="submit" class="btn btn-info">저장</button>
               <button type="button" class="btn btn-info" onclick="location.href='list'">목록</button>
             </td>
           </tr>
     </table>
  </form>
</div>
</body>
</html>