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
  <h3 class="alert alert-warning">Ex2 예제</h3>
  <br>
  <button type="button" id="btn2" class="btn btn-warning">list2 json배열데이타 출력하기</button>
  <div id="out2"></div>
    
  
  <script type="text/javascript">
  	  $("#btn2").click(function(){
  		  
  		  $.ajax({
  			  type:"get",
  			  dataType:"json",
  			  url:"list2",
  			  success:function(res){
  				  
  				  var s="";
  				  $.each(res,function(i,elt){
  					  
  					  s+="<figure>";
  					  s+="<img src='upload/"+elt.photo+"' width=150>";
  					  s+="<figcaption><b>";
  					  s+=elt.name;
  					  s+="</b></figcaption>";
  					  s+="</figure>";
  				  });
  				  
  				  $("#out2").html(s);
  			  }
  		  });
  	  });
  </script>
  
  
</body>
</html>