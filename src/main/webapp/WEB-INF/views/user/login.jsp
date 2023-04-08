<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D.C</title>
<link rel="stylesheet" href="/resource/css/initial.css" />
<link rel="stylesheet" href="/resource/css/style.css" />
</head>
<body>
	<div class="root login_area">
		<form action="/user/login-task" method="post" class="join-form">
			<h2>#로그인</h2>
			<div class="user_input">
			    <label>아이디</label>
				<input type="text" placeholder="아이디" name="id" value="${idsave }"
					class="join-input" required />
			</div>
			<div class="user_input">
			    <label>비밀번호</label>
				<input type="password" placeholder="비밀번호" name="pass" class="join-input" />
			</div>
			<c:if test="${error eq 1}">
				<p class="error_text" style="color: red">로그인에 실패하였습니다.</p>
			</c:if>
			<div>
				<button type="submit" class="join-btn">다음</button>
			</div>
		</form>
	</div>
</body>
</html>