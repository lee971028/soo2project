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
  <h2>JSTL연산자 연습</h2>
  
  <!-- 변수선언 -->
  <c:set var="su1" value="7"/>
  <c:set var="su2" value="4"/>
  
  <b>두 변수값 출력(su1:${su1 },su2:${su2})</b>
  
  <table class="table table-bordered" style="width: 400px;">
     <tr>
       <th width="250">\${su1+su2 }</th>
       <td>
         ${su1+su2 }
       </td>
     </tr>
     
     <tr>
       <th width="250">\${su1-su2 }</th>
       <td>
         ${su1-su2 }
       </td>
     </tr>
     
     <tr>
       <th width="250">\${su1*su2 }</th>
       <td>
         ${su1*su2 }
       </td>
     </tr>
     
     <tr>
       <th width="250">\${su1/su2 }</th>
       <td>
         ${su1/su2 }
       </td>
     </tr>
     
     <tr>
       <th width="250">\${su1 div su2 }</th>
       <td>
         ${su1 div su2 }
       </td>
     </tr>
     
     <tr>
       <th width="250">\${su1%su2 }</th>
       <td>
         ${su1%su2 }
       </td>
     </tr>
     
     <tr>
       <th width="250">\${su1 mod su2 }</th>
       <td>
         ${su1 mod su2 }
       </td>
     </tr>
     
     <tr>
       <th>su1증가</th>
         <td>
           증가전 su1:<c:out value="${su1 }"></c:out><br>
           <c:set var="su1" value="${su1+1 }"/>
           
          증가후 su1:${su1 }
        </td>
     </tr>
     
  </table>
</body>
</html>