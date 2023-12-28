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

카카오페이 결제가 정상적으로 완료되었습니다.
 
결제일시:        ${kakaoResponse.approved_at}<br/>
주문번호:        ${kakaoResponse.partner_order_id}<br/>
상품명:         ${kakaoResponse.item_name}<br/>
상품수량:        ${kakaoResponse.quantity}<br/>
결제금액:        ${kakaoResponse.amount.total}<br/>
결제방법:        ${kakaoResponse.payment_method_type}<br/>
매입 카드사 한글명:  ${kakaoResponse.card_info.purchase_corp}<br/>
매입 카드사 코드:    ${kakaoResponse.card_info.purchase_corp_code}<br/>
카드 발급사 한글명:  ${kakaoResponse.card_info.issuer_corp}<br/>
카드 발급사 코드:    ${kakaoResponse.card_info.issuer_corp_code}<br/>
카드사 승인번호:    ${kakaoResponse.card_info.approved_id}<br/>

 
</body>
</html>