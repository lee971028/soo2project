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
<div style="width: 800px; text-align: right; margin: 50px 50px; font-size: 2em;">
  <span class="glyphicon glyphicon-th-large list1" style="cursor: pointer;"></span>
  <span class="glyphicon glyphicon-th-list list2" style="cursor: pointer;"></span>
</div>


<div class="restlist" style="margin-top: 50px; margin-left: 50px;"></div>


<script type="text/javascript">

   //1번째 아이콘
   $("span.list1").click(function(){
	   
	   $("span.list1").css("color","red");
	   $("span.list2").css("color","black");
	   
	   //$(".restlist").html("출력1");
	   
	   $.ajax({
		  
		   type:"get",
		   dataType:"json",
		   url:"list1",
		   success:function(res){
			  
			   var tag="";
			   tag+="<table class='table' style='width:800px;'>";
			   
			   $.each(res,function(i,elt){
				   
				   tag+="<tr height='110'><td>";
				   tag+="<h3><b>"+elt.subject+"</b></h3>";
				   tag+=elt.content+"<br>";
				   
				   if(elt.photo!='no'){
					   tag+="<span style='float:right'>";
					   tag+="<img width='50' height='50' src='../photo/"+elt.photo+"'><br>";
					   tag+="</span>";
				   }
				   tag+="작성자: "+elt.writer;
				   tag+="</td></tr>";
				   
			   });
			   
			   tag+="</table>";
			   $(".restlist").html(tag);
		   }
	   });
   });
   
   
   //2번째 아이콘
   $("span.list2").click(function(){
	   
	   $("span.list2").css("color","red");
	   $("span.list1").css("color","black");
	   //$(".restlist").html("출력2");
	   
	   $.ajax({
			type:"get",
			dataType:"json",
			url:"list1",			
			success:function(data){
				var tag="";
				tag+="<table class='table' style='width:800px;'>";
				tag+="<tr>";
				var n=0;
				$.each(data, function(i, elt) {
					if(elt.photo!='no'){
						n++;
						tag+="<td width='200'>";					
						tag+="<img width='200' height='200' src='../photo/"+elt.photo+"'><br>";
						tag+="<h4><b>"+elt.subject+"</b></h4>";
						tag+="작성자:"+elt.writer+"<br>";
						tag+="조회: "+elt.readcount+"&nbsp;&nbsp;";
						tag+="</td>";
						if(n%4==0){
							tag+="</tr><tr>";
						}
					}
					
				});
				tag+="</table>";
				$(".restlist").html(tag);
			}
		});

   });

</script>


</body>
</html>