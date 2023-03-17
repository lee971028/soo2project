<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link
        href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
        rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<style type="text/css">
  div.list,div.detail,div.updateform{
  	position: absolute;
  	left: 100px;
  	top: 100px;
  	font-size: 13pt;
  	font-family: 'Single Day';
  
  }


div.writeform{
	position: absolute;
  	left: 900px;
  	top: 100px;
  	font-size: 13pt;
  	font-family: 'Single Day';
}

span.detail{
  cursor: pointer;
}

div.detail button{
  width: 80px;
  margin-right: 10px;
}

#page{
	position: absolute;
  	left: 200px;
  	top: 700px;
  	font-size: 13pt;
  	
}
</style>


<%
int currentPage;

if(request.getParameter("currentPage")==null)
	currentPage=1;
else
	currentPage=Integer.parseInt(request.getParameter("currentPage"));

%>


<script type="text/javascript">

$(function(){
	
	
	currentPage=<%=currentPage%>;
	
	
	list();
	pagebu();
	
	
	//입력폼 처음에 안보이게
	$("div.writeform").hide();
	
	//updateform안나오게
	$("div.updateform").hide();
	
	
	
	//글쓰기 버튼 누르면 입력폼 나오게
	$("#btnwrite").click(function(){
		$("div.writeform").toggle();
	});
	//db추가
	$("#btnadd").click(function(){
		
		var writer=$("#writer").val();
		var subject=$("#subject").val();
		var avata=$("#avata").val();
		var content=$("#content").val();
		
		//var data="writer="+writer+"&subject="+subject+"&content="+content+"&avata="+avata; 방법1
		
		//console.log(writer,subject,content,avata);
		
		$.ajax({
			
			type:"post",
			dataType:"html",
			url:"insertboardproc.jsp",
			data:{"writer":writer,"subject":subject,"content":content,"avata":avata}, //방법2
			success:function(){
				
				
				//insert성공시 처리
				$("#writer").val("");
				$("#subject").val("");
				$("#content").val("");
				
				//alert("success");
				//다시출력
				list();
				
				//입력폼 사라지게
				$("div.writeform").hide();
			}
			
		});
		
		
	});
	
	//제목클릭시 내용보기 이벤트
	$(document).on("click","span.detail",function(){
		
		//span태그에 넣어둔 num
		var num=$(this).attr("num");
		//alert(num);
		
		$.ajax({
			
			type:"get",
			dataType:"json",
			data:{"num":num},
			url:"detailboard.jsp",
			success:function(res){
				
				var s="<table class='table table-bordered' style='width:500px;'>";
				s+="<caption><b>내용확인</b></caption>";
				s+="<tr bgcolor='lightgray'>";
				s+="<td><b style='font-size:2em;'>"+res.subject+"</b><br>";
				s+="<span>"+res.writer+"</span>";
				s+="<span style='float:right; color:gray;'>"+res.writeday+"</span></td></tr>";
				
				
				s+="<tr><td>";
				s+="<img src='"+res.avata+"' width='40' align='left'><br>";
				s+="<pre style='background:white; border:0px;'>"+res.content+"</pre></td></tr>";
				
				//버튼들
				s+="<tr><td align='right' num='"+res.num+"'>";
				s+="<button type='button' class='btn btn-info btnlist'>목록</button>";
				s+="<button type='button' class='btn btn-warning btnmod'>수정</button>";
				s+="<button type='button' class='btn btn-danger btndel'>삭제</button>";
				
				s+="</td></tr>";
				
				s+="</table>";
				$("div.detail").html(s);
				
				//list숨기기
				$("#board").hide();
				
				//detail페이지 보이게
				$("div.detail").show();
			}
			
		});
	});
	
	
	//목록보기
	$(document).on("click",".btnlist",function(){
		
		$("div.detail").hide();
		$("#board").show();
	});
	
	//삭제
	$(document).on("click",".btndel",function(){
		
		//부모태그 td로부터 num값 가져오기
		var num=$(this).parent().attr("num");
		//alert(num);
		
		$.ajax({
			
			type:"get",
			dataType:"html",
			url:"deleteboard.jsp",
			data:{"num":num},
			
			success:function(){
				
				list(); 
				
				//내용보기 안보이게
				$("div.detail").hide();
				//목록보이게
				$("#board").show();
			}
			
		});
	});
	
	
	
	//수정버튼
	$(document).on("click",".btnmod",function(){
		
		
		var num=$(this).parent().attr("num");
		//alert(num);
		
		//내용보기에서 사용하던 detailboard.jsp 로부터 json얻어서 수정폼보이게 
		$.ajax({
			
			type:"get",
			dataType:"json",
			url:"detailboard.jsp",
			data:{"num":num},
			success:function(res){
				
				//수정폼에 데이타 넣어주기
				$("#unum").val(res.num);
				$("#uwriter").val(res.writer);
				$("#usubject").val(res.subject);
				$("#ucontent").val(res.content);
				$("#uavata").val(res.avata);
				
				//내용보기 안보이게
				$("div.detail").hide();
				
				//수정폼 보이게
				$("div.updateform").show();
			}
		});
		
	});
	
});



//사용자함수 list

function list()
{
	$.ajax({
		
		type:"get",
		dataType:"json",
		url:"listproc.jsp",
		data:{"currentPage":currentPage},
		success:function(data){
			
			//alert(data.length);
			
			//제목출력
			var s="<table class='table table-bordered' style='width:700px;'>";
			s+="<caption><b>Ajax게시판</b></caption>";
			s+="<tr bgcolor='#ccf'>";
			s+="<th width='60'>번호</th>";
			s+="<th width='360'>제목</th>";
			s+="<th width='120'>작성자</th>";
			s+="<th width='160'>작성일</th>";
			s+="<tr>";
			
			if(data.length==0){
				s+="<tr>";
				s+="<td colspan='4' align='center'>";
				s+="<b>저장된 글이 없습니다</b>";
				s+="</td></tr>";
			}else{
				//데이터가 1개이상 있을때
				$.each(data,function(i,item){
					
					s+="<tr>";
					s+="<td align='center'>"+(i+1)+"</td>";
					s+="<td>";
					s+="<span num='"+item.num+"' class='detail'>"+item.subject+"</span>";
					s+="</td>";
					s+="<td>"+item.writer+"</td>";
					s+="<td>"+item.writeday+"</td>";
				});
			}
			
			
			s+="</table>";
			$("#board").html(s);
			
		}
	});
}




//ajax page 버튼
function pagebu() 
{
	//var searchtool=$("#searchtool").val();
	//alert(searchtool);
	
	$.ajax({
		type:"get",
		dataType:"json",
		data:{"currentPage":currentPage},
		url:"paging.jsp",
		success:function(res){
			alert(res.startPage);
			
			var s="<ul class='pagination'>";
			
			if(res.startPage>1){
				s+="<li class='page-item'><a class='page-link' href='home.jsp?currentPage="+(res.startPage-1)+"'>이전</a></li>";
			}
			for(var pp=res.startPage;pp<=res.endPage;pp++){
				if(pp==res.currentPage){
					s+="<li class='page-item'><a class='page-link' href='home.jsp?currentPage="+pp+'>"+pp+"</a></li>";
				}else{
					s+="<li class='page-item'><a class='page-link' href='home.jsp?currentPage="+pp+"'>"+pp+"</a></li>";
				}
			}
			if(res.endPage<res.totalPage){
				s+="<li class='page-item'><a class='page-link' href='home.jsp?currentPage="+(res.endPage+1)+"'>다음</a></li>";
			}
			s+="</ul>";
			
			$("#page").html(s);
		}
	});
}


</script>




</head>
<body>
<div>
     <button type="button" class="btn btn-info" id="btnwrite">글쓰기</button>
     <div id="board">list</div>
     <div class="detail">detail</div>
  </div>
  
  <div class="writeform">
       <form action="#" >
          <table class="table table-bordered" style="width: 400px;">
             <caption><b>게시글 추가</b></caption>
               <tr>
                 <th bgcolor="#fcc">작성자</th>
                   <td>
                     <input type="text" id="writer" style="width: 120px;"
                     class="form-control">
                   </td>
               </tr>
               
               <tr>
                 <th bgcolor="#fcc">제목</th>
                   <td>
                     <input type="text" id="subject" style="width: 220px;"
                     class="form-control">
                   </td>
               </tr>
               
               <tr>
                 <th bgcolor="#fcc">이미지</th>
                   <td>
                     <select id="avata" class="form-control">
                       <option value="../image/01.png">미니1</option>
                       <option value="../image/02.png">미니2</option>
                       <option value="../image/03.png">미니3</option>
                       <option value="../image/04.png">미니4</option>
                       <option value="../image/05.png">미니5</option>
                     </select>
                   </td>
               </tr>
               
               <tr>
                 <td colspan="2" align="center">
                   <textarea style="width: 300px; height: 100px;"
                   id="content" class="form-control"></textarea>
                 </td>
               </tr>
               
               <tr>
                 <td colspan="2" align="center">
                   <button type="button" class="btn btn-danger"
                   id="btnadd">DB추가</button>
                 </td>
               </tr>
          </table>
       </form>
  </div>
  
  <!-- 입력폼을 복사해서 수정폼 만든것임!!! -->
  <div class="updateform">
       <form action="#" id="updatefrm">
       
       <!-- num hidden으로 주기 -->
       <input type="hidden" name="unum" id="unum">
          <table class="table table-bordered" style="width: 400px;">
             <caption><b>게시글 수정</b></caption>
               <tr>
                 <th bgcolor="#fcc">작성자</th>
                   <td>
                     <input type="text" id="uwriter" name="uwriter" style="width: 120px;"
                     class="form-control">
                   </td>
               </tr>
               
               <tr>
                 <th bgcolor="#fcc">제목</th>
                   <td>
                     <input type="text" id="usubject" name="usubject" style="width: 220px;"
                     class="form-control">
                   </td>
               </tr>
               
               <tr>
                 <th bgcolor="#fcc">이미지</th>
                   <td>
                     <select id="uavata" name="uavata" class="form-control">
                       <option value="../image/01.png">미니1</option>
                       <option value="../image/02.png">미니2</option>
                       <option value="../image/03.png">미니3</option>
                       <option value="../image/04.png">미니4</option>
                       <option value="../image/05.png">미니5</option>
                     </select>
                   </td>
               </tr>
               
               <tr>
                 <td colspan="2" align="center">
                   <textarea style="width: 300px; height: 100px;"
                   id="ucontent" name="ucontent" class="form-control"></textarea>
                 </td>
               </tr>
               
               <tr>
                 <td colspan="2" align="center">
                   <button type="button" class="btn btn-danger"
                   id="btnupdate">DB수정</button>
                 </td>
               </tr>
          </table>
       </form>
  </div>
  
  <div style="width: 800px; margin-left: 500px; display: flex; justify-content: center;" class='container mt-3' id='page'></div>
  
  
</body>
</html>