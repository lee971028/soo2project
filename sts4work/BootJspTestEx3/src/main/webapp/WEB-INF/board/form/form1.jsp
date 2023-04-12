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
<h1>폼 데이타 각각 읽기</h1>
<form action="read1" method="post">
  <table class="table table-bordered" style="width: 300px;">
     <tr>
       <th width="100">이름</th>
         <td>
           <input type="text" name="name" class="form-control">
         </td>
     </tr>
     <tr>
       <th width="100">자바점수</th>
         <td>
           <input type="text" name="java" class="form-control">
         </td>
     </tr>
     
     <tr>
       <th width="100">스프링점수</th>
         <td>
           <input type="text" name="spring" class="form-control">
         </td>
     </tr>
     
     <tr>
       <td colspan="2" align="center">
         <button type="submit" class="btn btn-success">서버에 전송</button>
       </td>
     </tr>
  </table>
</form>
</body>
</html>