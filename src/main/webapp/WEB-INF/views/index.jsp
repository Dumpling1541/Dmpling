<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D.C</title>
<link rel="stylesheet" href="/resource/css/style.css" />
</head>
<body>
	<div>
		<div>
			<c:choose>
				<c:when test="${sessionScope.logon }">
					<h2>${logonUser.id} 님 환영합니다!</h2>
				</c:when>
				<c:otherwise>
					<a href="/user/login">로그인 하지마 쉣</a>
				</c:otherwise>
			</c:choose>
		</div>
		
		<div>
			<a href="/post/post-list">글목록</a>
		</div>
	</div>
</body>
</html>