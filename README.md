# DADOK

# SpringBoot Project
* 도서 구매 및 중고거래 플랫폼
* 7인의 구성원이 약 5주 간 개발 진행

# 📌 담당 기술 구현 - 김용빈

**1) 회원관리(INTERCEPTOR) 및 독후감 게시판**
- `로그인 / 로그아웃`
  - **SESSION** 이용하여 로그인 / 로그아웃 구현 
  - ID 기억하기 : 로그인 시 ID 정보 **COOKIE** 저장
    
- `비밀번호 찾기 -> 변경` 
  - 이메일, 핸드폰 번호 인증후 회원정보 찾기. 문자전송 API 와 이메일전송 객체 사용
  - 가입된 회원만 인증번호전송, 랜덤인증번호 와 입력인증번호 일치 시 비밀번호 변경 페이지 이동

- `INTERCEPTOR`
  - 로그인 필요한 페이지 접근 시 로그인 페이지로 이동 처리 ( 일반 회원 / 관리자 구분)
  - 관리자 페이지 일반 회원이 접근 시 접근제한 페이지로 이동 처리
  - 로그인 페이지 이동 시 이전 URL 저장 -> 로그인 후 해당 URL 이동 처리
  
- `독후감`
  - 목록 > 전체 독후감, 로그인 회원 해당 독후감 페이징 처리
  - 독후감 등록 > 팝업 처리, 등록 된 책 상품 선택 후 상세내용 및 **다중파일 업로드** 구현
  - 수정, 삭제  > 자신이 올린 독후감 상세 페이지에서 수정,삭제 가능 (작성한 회원만 button 볼 수 있게 처리)
  - 좋아요 > 한 게시물 - 회원 당 한번만 가능 ( 재클릭 시 좋아요 비활성화 )

- `마이페이지`
  - 내 포인트 > 포인트 적립 및 차감 관련 목록 조회
  - 장바구니  > 장바구니에 담은 상품 목록 조회 / 상품 없을 시 상품목록으로 이동 버튼 활성화
  - 찜목록    > 찜한 상품 목록 조회 / 상품 없을 시 상품목록으로 이동 버튼 활성화
  - 중고판매 현황 > 중고상품 판매 현황 목록 조회
    

## 📰 UI
* 로그인 / 로그아웃
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/2ca45119-8a6d-4b3a-a5d4-454cf40d1157)

* 비밀번호 찾기 -> 변경
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/93d0030a-1aac-419d-8a41-e5059debb097)
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/d0a4edd0-4cdc-48f6-a7bc-f289c091f7d9)
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/4b48752e-fa46-41aa-b790-3f538f101657)
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/40a333ac-c600-40ed-8437-6e55fe77a55c)

* INTERCEPTOR
  > 접근 권한
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/1a0583f9-7a67-4244-8577-c0a384489efe)
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/70e9ffee-a74d-4dc2-a4b5-22f913161b4f)
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/ff826a25-d546-452a-a9bc-6624c87c54a3)

* 내포인트 목록
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/90a28a5d-ee8b-4f7d-8e26-6adbce5f5a6a)

* 내 중고판매 현황
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/d2517b4c-1b69-4f73-8132-08f7beb3cbb1)

* 내 찜목록
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/47275623-67f5-4a22-99fa-b227a72ed703)

* 내 장바구니
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/0e886b79-c4b6-4a5d-ab5c-7a4638ae8121)

* 독후감 게시판
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/957b8571-687d-4858-893e-0e1c12ed0e86)
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/3e74e90c-aca2-4c18-9d77-a876481937b9)
![image](https://github.com/kimyongbinn/DADOK/assets/42797251/ff141d1f-ed87-4f10-92a1-48b4e99795e4)

# ⏰ 개발 기간
- 2023.10.27 ~ 2023.11.29


# 🖥️ 개발 환경
- Java 11.0.12
- STS 2.7.17
- Oracle 11.2.0.2.0
- JDBC 8
