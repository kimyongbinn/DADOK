<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/headerBo.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="search">
	회원 번호    : <input type="text" name="m_num"> 
	이벤트 번호 : <input type="text" name="e_num">
	적립 날짜    : <input type="date" name="p_par_pdate">
	<button type="submit">검색</button>
</form>

<table>
	<tr>
		<th>No.</th><th>이름</th><th>적립 날짜</th><th>포인트</th><th>관리</th>
	</tr>
	<c:forEach var="pl" items="${pointList }">
	<tr>
		<td>${pl.rn }</td>
		<td>${pl.m_num }</td>
		<td>${pl.a_par_pdate }</td>
		<td>${pl.m_point }</td>
		<td><button onclick="">수정</button> <button onclick="">삭제</button>></td>
	</tr>
	</c:forEach>
</table>
</body>
</html>