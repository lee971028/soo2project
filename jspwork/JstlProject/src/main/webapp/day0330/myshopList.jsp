<%@page import="myshop.model.MyshopDto"%>
<%@page import="java.util.List"%>
<%@page import="myshop.model.MyshopDao"%>
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
   <%
   		MyshopDao dao=new MyshopDao();
        List<MyshopDto> list=dao.selectShop();
        request.setAttribute("list", list);
   
   %>
   
   <div style="margin: 30px 30px;">
      <h3 class="alert alert-danger" style="width: 800px;">MyShop목록출력하기</h3>
      <br>
      
      <table class="table table-bordered" style="width: 800px;">
         <tr>
            <th width="50">No.</th>
            <th width="300">상품명</th>
            <th width="150">가격</th>
            <th width="150">입고일</th>
            <th width="200">등록일</th>
            
         </tr>
         
         <c:forEach var="dto" items="${list }" varStatus="i">
            <tr>
              <td align="center">${i.count }</td>
              <td>
                 <img alt="" src="../image/${dto.photo }.jpg" width="50" height="50" class="img-thumbnail">
                 <b>${dto.sangpum }</b>
              </td>
              <td align="right">
                 <fmt:setLocale value="ko_kr"/>
                 <fmt:formatNumber value="${dto.price }" type="currency"/>
                 <br>
                 <c:if test="${dto.price>=50000 }">
                    <b style="color: blue;">고가제품</b>
                 </c:if>
                 
                 <c:if test="${dto.price<=20000 }">
                    <b style="color: green;">저가제품</b>
                 </c:if>
              </td>
              
              <td>${dto.ipgoday }</td>
              <td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH시"/></td>
            </tr>
         </c:forEach>
       
      </table>
   </div>
   
   
   
</body>
</html>