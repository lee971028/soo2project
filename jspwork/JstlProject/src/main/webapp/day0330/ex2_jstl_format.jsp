<%@page import="java.util.Date"%>
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
<!-- 변수선언 -->
<c:set var="name" value="이지민"/>
<c:set var="age" value="24"/>
<c:set var="today" value="<%=new Date() %>"/>

<!--변수출력  -->
<!-- c:out이 변수출력인데 생략가능 -->
<h2>이름: <c:out value="${name }"/></h2>
<h2>이름: ${name }</h2>
<h2>나이: ${age }</h2>
<h2>오늘날짜: ${today }</h2>

<!-- pattern 을 이용한 fmt날짜 형식-->
<pre>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd a hh:mm"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEE"/>
<fmt:formatDate value="${today }" pattern="yyyy-MM-dd HH:mm EEEE"/>
</pre>

<c:set var="money" value="6789000"/>
<c:set var="num1" value="123.45687"/>


<!--jstl에서의 숫자출력양식  -->
<pre>
   ${money }
   ${num1 }
   
   <!-- 3자리마다 컴마 -->
   <fmt:formatNumber value="${money }" type="number"/>
   
   
   <!-- 3자리마다 컴마와 화폐단위-->
   <fmt:formatNumber value="${money }" type="currency"/>
   
   
   <!-- pattern -->
   <fmt:formatNumber value="${num1 }" pattern="0.00"/>
   <fmt:formatNumber value="1.2" pattern="0.00"/>
   <fmt:formatNumber value="1.2" pattern="0.##"/>
</pre>
</body>
</html>