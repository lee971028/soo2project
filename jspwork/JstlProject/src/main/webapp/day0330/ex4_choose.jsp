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

<fmt:requestEncoding value="utf-8"/>
<form action="ex4_choose.jsp" method="post" style="width: 300px;">
  <h3>이름을 입력해주세여</h3>
  <input type="text" name="irum" class="form-control">
  
  <h3>여행가고싶은 나라를 입력해주세여</h3>
  <input type="text" name="nara" class="form-control">
  
  <br>
  
  <button type="submit" class="btn btn-info">결과확인</button>
</form>

<c:if test="${!empty param.irum }">

   <h3>이름: ${param.irum }</h3>
   <h3>가고싶은나라: ${param.nara }</h3>


	<c:choose>
	  <c:when test="${param.nara=='캐나다' }">
	    <h3 style="color: green;">캐나다 항공권은 200만원 입니다</h3>
	  </c:when>
	  <c:when test="${param.nara=='하와이' }">
	    <h3 style="color: green;">하와이 항공권은 180만원 입니다</h3>
	  </c:when>
	  <c:when test="${param.nara=='괌' }">
	    <h3 style="color: green;">괌 항공권은 80만원 입니다</h3>
	  </c:when>
	  <c:when test="${param.nara=='뉴욕' }">
	    <h3 style="color: green;">뉴욕 항공권은 250만원 입니다</h3>
	  </c:when>
	  <c:otherwise>
	     <h3 style="color: red;">${param.nara }로 가는 항공권이 없습니다</h3>
	  </c:otherwise>
	</c:choose>
</c:if>


</body>
</html>