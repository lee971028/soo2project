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
<script type="text/javascript">
	$(function(){
		
		
		//전체선택하면 체크박스 선택 헤제
		$("#allcheck").click(function(){
			
			//체크값을 얻는다
			var chk=$(this).is(":checked");
			console.log(chk);
			
			//전체체크값을 아래의 체크에 일괄전달
			$(".del").prop("checked",chk);
			
		});
		
		$("#btnmemberdel").click(function(){
			
			//체크한 상품 개수구하기
			var cnt=$(".del:checked").length;
			//alert(cnt);
			
			if(cnt==0){
				alert("먼저 삭제번호를 선택해주세요");
				return;//종료
			}
			
			$(".del:checked").each(function(i,elt){
				
				var num=$(this).attr("num");
				console.log(num); //선택한 num만 나오는지 확인할것
				
				
				//삭제 ajax
				$.ajax({
					
					type:"get",
					url:"delete",
					dataType:"html",
					data:{"num":num},
					success:function(){
						
						alert("삭제되었습니다");
						//새로고침
						location.reload();
					}
				});
				
			});
			
		});
		
		
	});
</script>
</head>
<body>
<h2 class="alert alert-info">총 ${count }명의 회원이 있습니다</h2>
<br>
<table class="table table-bordered" style="width: 1000px;">
  <caption><b>전체 회원명단</b></caption>
   <tr style="background-color: #ddd">
       <th style="width: 50px;">번호</th>
       <th style="width: 150px;">이름</th>
       <th style="width: 100px;">아이디</th>
       <th style="width: 120px;">핸드폰</th>
       <th style="width: 350px;">주소</th>
       <th style="width: 200px;">이메일</th>
       <th style="width: 50px;">
         <input type="checkbox" id="allcheck">
       </th>
   </tr>
   
   <c:forEach  var="dto" items="${list }" varStatus="i">
      <tr>
        <td>${i.count}</td>
        <td>
        <img alt="" src="../photo/${dto.photo }" style="width: 30px; height: 30px;">&nbsp;&nbsp;&nbsp;
        ${dto.name}</td>
        <td>${dto.id}</td>
        <td>${dto.hp}</td>
        <td>${dto.addr}</td>
        <td>${dto.email}</td>
        <td><input type="checkbox" class="del" num=${dto.num }></td>
      </tr>
   </c:forEach>
   
   <tr>
     <td colspan="7">
     <button type="button" class="btn btn-danger"
style="margin-left: 650px;" id="btnmemberdel">DELETE</button>
     </td>
   </tr>
</table>


</body>
</html>