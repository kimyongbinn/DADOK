<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../common/none.jsp" %>
<html> 
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta content="Codescandy" name="author">
  <title>Contact eCommerce HTML Template - FreshCart </title>
<!-- Favicon icon-->
<link rel="shortcut icon" type="image/x-icon" href="../assets/images/favicon/favicon.ico">


<!-- Libs CSS -->
<link href="../assets/libs/bootstrap-icons/font/bootstrap-icons.min.css" rel="stylesheet">
<link href="../assets/libs/feather-webfont/dist/feather-icons.css" rel="stylesheet">
<link href="../assets/libs/simplebar/dist/simplebar.min.css" rel="stylesheet">


<!-- Theme CSS -->
<link rel="stylesheet" href="../assets/css/theme.min.css">
<!-- Google tag (gtag.js) -->
<title>Insert title here</title>
<style type="text/css">
	#container {
		 position: absolute;
		  top: 85%;
		  left: 50%;
		
		  width: 580px;
		  height: 1400px;
		
		  padding: 20px;
		
		
		  background-color: rgb(255, 255, 255);
		  border-radius: 10px;
		  box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
		
		  transform: translateX(-50%) translateY(-50%);
			}
			
				
		.top {
	              position: relative;
	              display: flex; 
	              justify-content: space-between;
	              padding: 0.5rem 1.4rem;
	              background-color: #3CB371;
	              vertical-align: middle;
	          }
	              
	    h1.infoTit {
	                margin-top : 10px;
	                   font-size: 20px; 
	                   color:#ffffff;
	               }
	    .textBox {
	                margin-left: 5%;
	                margin-right: 5%;
	              }
</style>
<script type="text/javascript">
	function sendChildValue(title, image, nb_num){
		opener.setChildValue(title, image, nb_num);
		window.close();
	}
</script>
</head>
<body>
<main class="textBox">
   <div class="mb-6">
      <header class="top">
         <h1 class="infoTit">
           	책 검색
         </h1>
      </header>
   </div>
<div id="container">

	<form action="searchListBook" method="get">
	 <div class="input-group">
		<select name="search_type" class="w-25 rounded" style="border-color: rgb(223, 226, 225);" >
			<option value="nb_title">도서제목</option>
			<option value="nb_writer">지은이</option>
			<option value="nb_publisher">출판사</option>
		</select>&nbsp;&nbsp;
        <input name = "search_keyword" class="form-control rounded" type="search" placeholder="찾으실 도서를 검색해보세요." style="margin-right : 10px;">
        <input type="submit" class="rounded btn  btn-outline-gray-400 text-muted" value="검색">
	 </div>
	</form>
      <!-- row -->
      <div>
	        <div>
	          <div class="py-3">
	          	<div class="">
			        <table class="table table-with-checkbox" style="table-layout: auto width:120;height:80;overflow-x:hidden;overflow-y:hidden">
			                <thead class="table-light">
			                  <tr>
			                    <th></th>
			                    <th width="310px">제목</th>
			                    <td></td>
			                  </tr>
			                </thead>
			                <tbody>
			                	<c:forEach var="book" items="${searchListBook }" varStatus="status">   		          				
				                	<tr>
				                		<td>
				                			<div>
							                	<c:choose>
						                           <c:when test="${fn:contains(book.nb_image, 'http')}">
						                              <img src="${book.nb_image}" alt="Ecommerce"  width="75px" height="90px">
						                           </c:when>
						                           <c:otherwise>
						                              <img src="${pageContext.request.contextPath}/upload/${book.nb_image}" alt="Ecommerce"  width="75px" height="90px">
						                           </c:otherwise>
					                        	</c:choose>
							                </div>
				                		</td>
				                		<td width="50%" style="word-break:break-all"">

							                    <!-- 도서 제목 -->
							                    <a href="newbookDetail?nb_num=${book.nb_num }" class="text-inherit"><h6 class="mb-0">${book.nb_title }</h6></a>
							                    <span><small class="text-muted">${book.nb_publisher }</small></span>
							                    <!-- text -->
							                    <span><small class="text-muted">${book.nb_writer }</small></span>
				                		</td>
				                		<td  width="10px;" style="padding-top: 30px;">
				                			<a href="javascript:sendChildValue('${book.nb_title}', '${book.nb_image }', '${book.nb_num }')">
				                				<button type="button" class="rounded btn  btn-outline-gray-400 text-muted">선택</button>
				                			</a>
				                		</td>
				                	</tr>
				                </c:forEach>
			                </tbody>
			         </table>
			    </div>
			    
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
		
					 	<c:if test="${page.startPage > page.pageBlock }">
							<a href="searchBook?currentPage=${page.startPage-page.pageBlock }">[이전]</a>
						</c:if>
						
						<c:choose>
							<c:when test="${newbook.search_keyword != null }">
								<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
									<a href="searchListBook?currentPage=${i}&search_type=${newbook.search_type }&search_keyword=${newbook.search_keyword}">[${i}]</a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
									<a href="searchBook?currentPage=${i}">[${i}]</a>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						

						<c:if test="${page.endPage < page.totalPage }">
							<a href="searchBook?currentPage=${page.startPage+page.pageBlock }">[다음]</a>
						</c:if>
				    </ul>
			     </nav>
   

	          </div>

			    
			</div>
		</div>
</div>
</main>

</body>
</html>