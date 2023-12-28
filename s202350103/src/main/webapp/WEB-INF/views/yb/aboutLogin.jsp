<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="../assets/js/jquery.js"></script>
<script type="text/javascript">
	
	// 아이디에 focus
	window.onload = function() {
	    document.getElementById('m_id').focus();
	};

	// 아이디 기억하기
	$(document).ready(function(){
		 
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var key = getCookie("key");
	    $("#m_id").val(key); 
	     
	    if($("#m_id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            setCookie("key", $("#m_id").val(), 1); // 1 일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("key");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#m_id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            setCookie("key", $("#m_id").val(), 1); // 1일 동안 쿠키 보관
	        }
	    });
	});
	//쿠키값 set
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	//쿠키값 delete
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	//쿠키값 get
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
		

	
	function loginChk(m_id, m_pw) {		
	
		//alert("loginChk");
		$.ajax({
					url:"<%=request.getContextPath()%>/memberChk",
					data : {chk_Id : m_id, 
							chk_Pw : m_pw},
					dataType : 'text',
					success : function(strResult) {
						//alert('strResult -> '+strResult);
						if(strResult == "1"){
// 							alert("로그인 성공! 환영합니다.");
							location.href = "memberLogin?m_id="+ m_id + "&m_pw=" +m_pw;		
							return true;
						} else if(strResult == "2") {
							alert("탈퇴한 회원입니다.");
							$('#msg').html("탈퇴한 회원입니다.");
							$('#msg').css("color", "red");
							$('#m_id').val('');
							$('#m_pw').val('');
							return false;
						} else if(strResult == "0"){
							alert("아이디 혹은 비밀번호를 확인해주세요.");
							$('#msg').html("아이디 혹은 비밀번호를 확인해주세요.");
							$('#msg').css("color", "red");
// 							$('#m_id').val('');
							$('#m_pw').val('');
							return false;
						}	
					}
		});
		
		
	} 
	


</script>
</body>
</html>