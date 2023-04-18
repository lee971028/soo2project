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
<form action="update" method="post" enctype="multipart/form-data">
<!--hidden  -->
<input type="hidden" name="num" value="${dto.num }">
   <table class="table table-bordered" style="width: 400px;">
      <caption><b>상품정보 수정</b></caption>
        <tr>
          <th bgcolor="#ddd">상품명</th>
            <td>
              <input type="text" name="sang" class="form-control" style="width: 200px;" required="required"
              value="${dto.sang }">
            </td>
        </tr>
        
        <tr>
          <th bgcolor="#ddd">단가</th>
            <td>
              <input type="text" name="dan" class="form-control" style="width: 200px;" required="required"
              value="${dto.dan }">
            </td>
        </tr>
        
        <tr>
          <th bgcolor="#ddd">사진</th>
            <td>
              <input type="file" name="photo" class="form-control" style="width: 250px;" >
            </td>
        </tr>
        
        <tr>
          <td colspan="2" align="center">
             <button type="submit" class="btn btn-info"
             style="width: 100px;">수정</button>
             <button type="button" class="btn btn-info"
             style="width: 100px;" onclick="location.href='list'">목록</button>
          </td>
        </tr>
   </table>
</form>
</body>
</html>