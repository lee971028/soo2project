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
	<form action="process3" method="post">
   <table class="table table-bordered" style="width: 300px;">
     <caption><b>시험점수입력</b></caption>
     <tr>
       <th style="width: 100px;">학생명</th>
       <td>
         <input type="text" name="name" class="form-control input-sm">
       </td>
     </tr>
     
     <tr>
       <th style="width: 100px;">자바점수</th>
       <td>
         <input type="text" name="java" class="form-control input-sm">
       </td>
     </tr>
     
     <tr>
       <th style="width: 100px;">오라클점수</th>
       <td>
         <input type="text" name="oracle" class="form-control input-sm">
       </td>
     </tr>
     
     <tr>
       <th style="width: 100px;">스프링점수</th>
       <td>
         <input type="text" name="spring" class="form-control input-sm">
       </td>
     </tr>
     
     
     
     <tr>
       <td colspan="2" align="center">
         <input type="submit" value="전송" class="btn btn-info">
       </td>
     </tr>
   </table>
</form>
</body>
</html>