<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach var="image" items="${imageList }">
    <span class="rounded border border-primary">
        <img src="${image}" onclick="selectImage('${image}')" width="170px" height="170px" alt="회원이미지" class="rounded">
    </span>
</c:forEach>


<script type="text/javascript">
	// 선택한 이미지의 url 을 부모창으로 전달하고 팝업 닫음
	function selectImage(imageUrl){
        window.opener.changeImage(imageUrl);
        window.close();
    }
</script>
