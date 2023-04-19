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
<style type="text/css">
		#showimg{
			border: 1px solid gray;
			width: 130px;
			height: 160px;
		}
</style>

<script type="text/javascript">
  $(function(){
	  
	  
	  //버튼클릭시 사진불러오는 이벤트 추가
	  $("#btnphoto").click(function(){
		  
		  $("#myphoto").trigger("click");
	  });
	  
	  //사진불러오면 이미지 미리보기하기
	//사진 불러오면 미리보기하기
		$("#myphoto").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showimg").attr("src",e.target.result);
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
	  
	  
	  
	  
	  //중복체크 버튼 클릭시 아이디체크_ajax
	  
	  
	  
	  //2번째 비밀번호 입력시 체크

  });

  
  //submit전테 호출
  function check(){
	  
	  //사진
	  if($("#myphoto").val()==''){
		  alert("사진을 넣어주세요");
		  return false;
	  }
	  
	  //중복체크
	  if($("span.idsuccess").text()!='ok'){
		  alert("아이디 중복체크를 해주세요");
		  return false;
	  }
	  
	  
	  //비밀번호
	  if($("span.passsuccess").text()!='ok'){
		  alert("비밀번호가 서로 다릅니다");
		  return false;
	  }
  }
  
  
</script>
</head>
<body>
<button type="button" class="btn btn-info" 
onclick="location.href='list'">전체 회원 목록</button>


<form action="insert" method="post" enctype="multipart/form-data" onsubmit="return check()">
   <table class="table table-bordered" style="width: 600px;">
       <caption><b>회원가입</b></caption>
         <tr>
           <td style="width: 200px;" rowspan="4" align="center">
             <input type="file" id="myphoto" name="myphoto" style="display: none;">
               <button type="button" id="btnphoto" class="btn btn-success">사진선택</button>
               <br>
               <img id="showimg">
           </td>
           
           <td>
             <div class="form-inline">
               <input type="text" placeholder="아이디입력" id="loginid" name="id"
               class="form-control" style="width: 120px;" required="required">
               
               <button type="button" class="btn btn-danger" id="btnidcheck">중복체크</button>
               &nbsp;<span class="idsuccess" style="width: 60px; color: green;"></span>
             </div>
           </td>
         </tr>
         
         
         <tr>
           <td>
             <div class="form-inline">
               <input type="password" style="width: 120px;" class="form-control"
               name="pass" id="pass" placeholder="숫자4자리" required="required">
               
               <input type="password" style="width: 120px;" class="form-control"
               name="pass" id="pass2" placeholder="숫자4자리" required="required">
               
               &nbsp;<span class="passsuccess" style="width: 60px;"></span>
             </div>
           </td>
         </tr>
         
         <tr>
           <td>
             <input type="text" name="name" class="form-control" style="width: 130px;"
             placeholder="이름을 입력" required="required">
           </td>
         </tr>
         
         <tr>
           <td>
             <input type="email" name="email" class="form-control" style="width: 130px;"
             placeholder="이메일을 입력" required="required">
           </td>
         </tr>
         
         
         <tr>
           <td colspan="2">
            <div class="form-inline">
             <input type="text" name="hp" class="form-control" style="width: 200px;"
             placeholder="(-) 없이 hp숫자만입력" required="required">
             
             <input type="text" name="addr" class="form-control" style="width: 300px;"
             placeholder="간단주소입력" required="required">
             </div>
           </td>
         </tr>
         
         <tr>
           <td colspan="2" align="center">
             <button type="submit" class="btn btn-info">회원가입</button>
           </td>
         </tr>
   </table>
</form>
</body>
</html>