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
	<h3 class="alert alert-info">Ex3번 예제</h3>
<br>
<h4>메뉴이름을 입력후 엔터를 눌러주세요</h4>
<input type="text" id="search" class="form-control" style="width: 130px;">
<br><br>
<h2 id="fname"></h2>
<img src="" id="photo">

<script type="text/javascript">
	//메뉴명을 입력후 엔터누를때 출력하기
	$("#search").keyup(function(e) {
		if(e.keyCode==13){
			//입력값
			var name=$(this).val();
			//alert(name);
			
			$.ajax({
				type:"get",
				dataType:"json",
				url:"list3",
				data:{"name":name},
				success:function(res){
					$("#fname").text(res.name);
					$("#photo").attr("src","upload/"+res.photo);
					$("#search").val('');//입력값 지우기
				}
			});
		}
	});
</script>
</body>
</html>