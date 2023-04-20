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
<div style="margin: 100px 100px;">
  <form action="loginprocess" method="post">
     <table class="table table-bordered" style="width: 250px;">
        <caption><b>회원로그인</b></caption>
          <tr height="60">
            <td>
              <input type="text" name="id" class="form-control" placeholder="아이디입력"
              required="required" autofocus="autofocus" style="width: 200px;"
              value="${sessionScope.saveok==null?'':sessionScope.myid}">
            </td>
          </tr>
          
          <tr height="60">
            <td>
              <input type="password" name="pass" class="form-control" placeholder="비밀번호입력"
              required="required" autofocus="autofocus" style="width: 200px;">
            </td>
          </tr>
          <tr height="60">
             <td>
                <input type="checkbox" name="cbsave" 
                ${sessionScope.saveok==null?"":"checked"}>아이디저장 &nbsp;&nbsp;
                <button type="submit" class="btn btn-success" >회원로그인</button>
             </td>
          </tr>
     </table>
  </form>
</div>
</body>
</html>