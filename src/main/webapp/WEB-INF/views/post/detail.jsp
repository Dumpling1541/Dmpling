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
		
		<%-- 게시글 상세페이지 --%>
		<div class="board_view">
			<div class="bov_title">
				<h2>${findPost.title }</h2>
			</div>
			<div  class="bov_info">
				<div>
					<h4><i class="fa-regular fa-user"></i>${findPost.userId }</h4>
				</div>
				<div>
					<h4><i class="fa-regular fa-calendar"></i> ${findPost.dates } | <i class="fa-regular fa-eye"></i> ${findPost.views } | 
					<i class="fa-regular fa-thumbs-up"></i> ${likeCnt}</h4>
				</div>
			</div>
			<div class="bov_content">
	  			 ${findPost.content }
			</div>
		</div>
		
		<c:choose>
				<c:when test="${sessionScope.logon }">
						<div class="bov_btn">
							<a href="/post/modify?id=${findPost.id}">수정</a>
							<a href="/post/delete?id=${findPost.id}">삭제</a>
						</div>
						<c:choose>
							<c:when test="${likeUser}">
								<div class="bov_btn_like">
									<a style="background: black; color: white;">추천중</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="bov_btn_like">
									<a href="/post/like?id=${findPost.id}">추천</a>
								</div>
							</c:otherwise>
						</c:choose>
				</c:when>
				<c:otherwise>
					<div class="bov_btn">
						<a href="/post/modify?id=${findPost.id}">수정</a>
						<a href="/post/delete?id=${findPost.id}">삭제</a>
					</div>
				</c:otherwise>
		</c:choose>		
		</div>
</body>
</html>