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
<h2>상품정보 출력</h2>
<div style="color: ${dto.color};">
   상품명:${dto.sang }<br>
   수량:<fmt:formatNumber value="${dto.su }" pattern="#,##0"/><br>
   단가:<fmt:formatNumber value="${dto.dan }" type="currency"/><br>
   총금액:<fmt:formatNumber value="${dto.su*dto.dan }" type="currency"/><br>
</div>
</body>
</html>