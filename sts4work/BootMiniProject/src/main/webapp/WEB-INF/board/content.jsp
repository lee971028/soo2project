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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.day{
   color: gray;
   margin-left: 150px;
   margin-right: 30px;
   font-size: 0.9em;
}

.amod,.adel{
   cursor: pointer;
   font-size: 0.8em;
   color: green;
}

</style>
<script type="text/javascript">
$(function(){
	
	
	
	//num값은 전역변수로 선언..
	num=$("#num").val();
	loginok="${sessionScope.loginok}";  //yes
	myid="${sessionScope.myid}";
	
	//alert(loginok+","+myid+","+num);
	
	list();
	
	//insert
	$("#btnansweradd").click(function(){
		
		var content=$("#content").val();
		
		if(content.trim().length==0){
			alert("댓글을 입력해 주세요");
			return;
		}
		
		
		//입력했을시 ajax
		$.ajax({
			
			type:"post",
			dataType:"text",
			url:"ainsert",
			data:{"num":num,"content":content},
			success:function(){
				alert("인서트 성공");
				
				list();
				
				//입력값 지우기
				$("#content").val("");
			}
		});
	});
	
	
	
	//삭제
	$(document).on("click","span.adel",function(){
		
		var idx=$(this).attr("idx");
		//alert(idx);
		
		var a=confirm("해당댓글을 삭제할까요?");
		
		if(a==true){
			
			$.ajax({
				
				type:"get",
				dataType:"text",
				url:"adelete",
				data:{"idx":idx},
				success:function(){
					
					
					list();
				}
			});
		}
	});
	
	
	//수정창띄우기
	$(document).on("click","span.amod",function(){
		
		 idx=$(this).attr("idx");
		
		 $.ajax({
			 
			 type:"get",
			 dataType:"json",
			 url:"adata",
			 data:{"idx":idx},
			 success:function(res){
				 
				 $("#ucontent").val(res.content);
			 }
		 });
		
		
		$("#myUModal").modal();
		
		
	});
	
	
	
	//수정
	$(document).on("click","#btnupdate",function(){
		
		var content=$("#ucontent").val();
		//alert(idx+","+content);
		
		$.ajax({
			
			type:"post",
			dataType:"text",
			url:"aupdate",
			data:{"idx":idx,"content":content},
			success:function(){
				
				list();
			}
		});
	});
	
	
	
});



//사용자 함수 list
function list()
{
		
	$.ajax({
		
		type:"get",
		dataType:"json",
		url:"alist",
		data:{"num":num},
		success:function(res){
			
			$("span.acount").text(res.length);
			
			var s="";
			
			$.each(res,function(i,dto){
				
				s+="<b>"+dto.name+"</b>:"+dto.content;
				s+="<span class='day'>"+dto.writeday+"</span>";
				
				if(loginok=='yes' && myid==dto.myid){
					s+="<span class='glyphicon glyphicon-pencil amod' idx='"+dto.idx+"'></span>";
					s+="&nbsp;";
					s+="<span class='glyphicon glyphicon-trash adel' idx='"+dto.idx+"'></span>";
				}
				
				s+="<br>";
			});
			
			$("div.alist").html(s);
		}
	});
	
}

</script>
</head>
<body>
  <table class="table table-bordered" style="width: 600px; margin: 100px 100px;">
      <tr>
        <td>
           <h3><b>${dto.subject }</b>
               <span style="color: gray; float: right; font-size: 14px;"><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>  </span>
           </h3>
           
           <span>작성자: ${dto.name }(${dto.myid })</span>
           
           <c:if test="${dto.uploadfile!='no' }">
               <span style="float: right;">
                   <a href="download?clip=${dto.uploadfile }">
                      <span class="glyphicon glyphicon-download-alt"></span>
                      
                      <b>${dto.uploadfile }</b>
                   </a>
               </span>
           </c:if>
           
        </td>
      </tr>
      
      <tr>
         <td>
            <c:if test="${bupload==true }">
               <h3>업로드 파일이 이미지입니다</h3>
                 <img alt="" src="../photo/${dto.uploadfile }" style="max-width: 400px;">
            </c:if>
            
            <br><br><br>
            <pre style="background-color: #fff; border: 0px;">
              ${dto.content }
            </pre>
            <br>
            <b>조회: ${dto.readcount }</b>&nbsp;&nbsp;&nbsp;
            <b>댓글: <span class="acount"></span></b>
         </td>
      </tr>
      
      <tr>
        <td>
        <!--리스트 출력  -->
           <div class="alist"></div>
            <input type="hidden" id="num" value="${dto.num }">
           <c:if test="${sessionScope.loginok!=null }">
              <div class="aform">
                  <div class="form-inline">
                 
                    <input type="text" class="form-control" placeholder="댓글을 입력하세여"
                    id="content" style="width: 500px;">
                    <button type="button" class="btn btn-info" style="width: 60px;"
                    id="btnansweradd">등록</button>
                  </div>
              </div>
           </c:if>
        </td>
      </tr>
      
      
      
      
      
      <!-- 버튼들 -->
      
      <tr>
        <td align="right">
        
          <!-- 글쓰기는 로그인 중일때만 -->
          
          <c:if test="${sessionScope.loginok!=null }">
           <button type="button" class="btn btn-default" onclick="location.href='form'" style="width: 80px;">글쓰기</button>
          </c:if>
           <button type="button" class="btn btn-default" onclick="location.href='list?currentPage=${currentPage}'" style="width: 80px;">목록</button>
           
           
          <!-- 로그인중이면서 자기글만 수정,삭제 버튼 보이게 -->
          <c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
           <button type="button" class="btn btn-default" onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage}'" style="width: 80px;">수정</button>
           <button type="button" class="btn btn-default" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage}'" style="width: 80px;">삭제</button>
          </c:if>
        </td>
      </tr>
      
  </table>
  
  <!-- 수정 Modal -->
  <div class="modal fade" id="myUModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글수정</h4>
        </div>
        
        
        
        
        <div class="modal-body">
          <input type="text" id="ucontent" class="form-control">
        </div>
        
        
        
        
        <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  
  
</body>
</html>