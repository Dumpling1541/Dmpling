<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D.C</title>
<link rel="stylesheet" href="/resource/css/initial.css" />
<link rel="stylesheet" href="/resource/css/style.css" />
<link href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro-v6@44659d9/css/all.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/hung1001/font-awesome-pro@4cac1a6/css/all.css" />
</head>
<body>
	<div class="home_wrap board_list">
		<div class="title_login">
			<c:choose>
				<c:when test="${sessionScope.logon}">
					<h4>${logonUser.id}님 로그온</h4>
				</c:when>
				<c:otherwise>
					<a href="/user/login">로그인</a>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="title">
			<h3>디지털컨버전스 - 공공데이터융합 자바 웹개발자 양성 과정</h3>
		</div>
		
		<%-- 수정페이지 --%>
		<c:choose>
			<c:when test="${sessionScope.logon}">
				<div class="delete_main">
					<div class="delete_text">
						<h3>해당 글을 수정하시겠습니까?</h3>
					</div>
					<form action="/post/modify-task" method="post">
						<input type="hidden" name="id" value="${param.id }">
						<div  class="delete_btn">
							<button type="submit">수정하기</button>
						</div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="delete_main">
					<div class="delete_text">
						<h3>해당 글을 수정하시겠습니까?</h3>
					</div>
					<form action="/post/modify-task" method="post">
						<input type="hidden" name="id" value="${param.id }">
						<div class="delete_pass">
							<h3>작성시 설정했던 비밀번호를 입력하세요.</h3>
							<input type="password" name="userpass" placeholder="비밀번호">
						</div>
						<c:if test="${param.error eq 1 }">
							<p style="color: red; font-size: 16px;">비밀번호가 일치하지 않습니다.</p>
						</c:if>
						<div  class="delete_btn">
							<button type="submit">수정하기</button>
						</div>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="back_btn">
		<a href="/post/post-list">돌아가기</a>
	</div>
</body>
</html>