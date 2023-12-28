<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/none.jsp" %>

<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:choose>
	<c:when test="${result == 1 }">
		성공적으로 주문을 업로드했습니다!
	</c:when>
	<c:otherwise>
		주문 업로드에 실패했습니다.<br><br>
		
		잠시 후 재시도해주세요.
	</c:otherwise>
</c:choose>

</body>
</html>