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
	<c:when test="${result == 1 }">
		성공적으로 선물을 수락했습니다!<br><br>
		
		보낸 사람<br>
		이름 : ${orderr.m_name }<br>
		휴대전화 : ${orderr.m_ph }<br><br>
		
		상품 정보<br>
		제목 : ${orderr.nb_title }<br>
		수량 : ${orderr.o_de_count }개<br><br>
		
		선물은 영업일 기준 5일 내 발송될 예정입니다.
	</c:when>
	<c:otherwise>
		선물 수락에 실패했습니다.<br><br>
		
		잠시 후 재시도해주세요.
	</c:otherwise>
</c:choose>

<%@ include file="../common/footerFo.jsp" %>
</body>
</html>