<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/headerFo.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>
	<c:when test="${mailingResult == 1 }">
		성공적으로 선물을 전달했습니다!<br><br>
		
		받는 사람<br>
		이름 : ${orderr.o_rec_name }<br>
		메일 : ${orderr.o_rec_mail }<br><br>
		
		상품 정보<br>
		제목 : ${orderr.nb_title }<br>
		수량 : ${orderr.o_de_count }개<br><br>
		
		자세한 내용은 마이페이지 주문 현황에서 확인해주세요.
	</c:when>
	<c:otherwise>
		선물 전달에 실패했습니다.<br><br>
		
		잠시 후 재시도해주세요.
	</c:otherwise>
</c:choose>

<%@ include file="../common/footerFo.jsp" %>
</body>
</html>