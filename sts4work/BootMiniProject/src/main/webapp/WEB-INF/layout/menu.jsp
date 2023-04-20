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
<!-- add menu -->
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/menu/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="${root}/menu/css/menu.css">
<script type="text/javascript" src="${root}/menu/js/function.js"></script>

<style type="text/css">
     
  /*  ul.menu{
      list-style: none;
   }
   
   ul.menu li{
      
      width: 120px;
      float: left;
      border: 1px solid gray;
      height: 60px;
      line-height: 60px;
      margin-right: 10px;
      text-align: center;
      font-size: 20px;
      background-color: #7fffd4;
      cursor: pointer;
      font-family: 'Jua';
      border-radius: 20px;
     
      
   }
   
  ul.menu li a{
      color: black;
      text-decoration: none; */
      
      #main-menu{
		width: 1000px;
		font-size: 26px;
		font-family:'Jua';
		background-color: black;
		margin-left: 200px;
	}
      
    
      
  }
</style> 
</head>
<body>

 <%-- <ul class="menu">
    <li>
      <a href="${root }/">Home</a>
    </li>
    <li>
      <a href="${root }/ipgo/form">상품등록</a>
    </li>
    <li>
      <a href="${root }/ipgo/list">상품목록</a>
    </li>
    <li>
      <a href="${root }/board/list">게시판</a>
    </li>
    <li>
      <a href="${root }/member/list">회원목록</a>
    </li>
    <li>
      <a href="${root }/login/main">로그인</a>
    </li>
    <li>
      <a href="${root }/member/form">회원가입</a>
    </li>
    <li>
      <a href="${root }/member/myinfo">나의정보</a>
    </li>
    <li>
      <a href="${root }/load/map">오시는길</a>
    </li>
 </ul> --%>
 
 <ul id="main-menu">
					<li class="current-menu-item"><a href="${root}/">Home</a></li>
					<li class="parent">
						<a href="#">Shop</a>
						<ul class="sub-menu">
							<li><a href="${root}/ipgo/form"><i class="icon-gift"></i>상품등록</a></li>
							<li><a href="${root}/ipgo/list"><i class="icon-credit-card"></i>상품목록</a></li>
							<li><a href="#"><i class="icon-wrench"></i> Icons</a></li>							
						</ul>
					</li>
					<li><a href="${root}/board/list">게시판</a></li>
					
					<li class="parent">
						<a href="#">MEMBER</a>
						<ul class="sub-menu">
							<li><a href="${root}/member/form"><i class="icon-gift"></i>회원가입</a></li>
							
							<c:if test="${sessionScope.loginok!=null and sessionScope.myid=='admin' }">
							<li><a href="${root}/member/list"><i class="icon-credit-card"></i>회원목록</a></li>
							</c:if>
							
							<li><a href="${root }/member/myinfo"><i class="icon-wrench"></i> 나의정보</a></li>							
						</ul>
					</li>
					<li><a href="${root}/login/main">로그인</a></li>
					
					<li><a href="${root}/load/map">오시는길</a></li>
				</ul>
 
</body>
</html>