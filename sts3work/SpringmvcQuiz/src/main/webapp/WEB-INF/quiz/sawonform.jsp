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
<form action="read" method="post">
   <table class="table table-bordered" style="width: 400px;">
     <caption><b>사원정보입력</b></caption>
     <tr>
       <th>사원명</th>
       <td>
         <input type="text" name="name" size="10">
       </td>
     </tr>
     
     <tr>
       <th>부서명</th>
       <td>
         <input type="text" name="buseo" size="10">
       </td>
     </tr>
     
     <tr>
       <th>급여</th>
       <td>
         <input type="text" name="pay" size="10">
       </td>
     </tr>
     
     <tr>
       <th>나이</th>
       <td>
         <input type="text" name="age" size="10">
       </td>
     </tr>
     
     <tr>
       <th>혈액형</th>
       <td>
         <input type="text" name="blood" size="10">
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