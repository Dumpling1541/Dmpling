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
			<h4>개발공부를 하면서 몰랐던 것이나 고민이 있다면 글을 남겨주세요</h4>
		</div>
		
		<%-- 게시판 리스트 --%>
		<div class="bov_top">
			<ul>
				<c:choose>
					<c:when test="${param.sort eq 'dates'}">
						<li><a style="color: blue;">등록순</a></li>
					</c:when>
					<c:when test="${param.sort != 'dates' || param.sort == null}">
						<li><a href="/post/post-list?sort=dates">등록순</a></li>
					</c:when>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.sort eq 'views'}">
						<li><a style="color: blue;">조회순</a></li>
					</c:when>
					<c:when test="${param.sort != 'views' || param.sort == null}">
						<li><a href="/post/post-list?sort=views">조회순</a></li>
					</c:when>
				</c:choose>
				
				<c:choose>
					<c:when test="${param.sort eq 'likes'}">
						<li><a style="color: blue;">추천순</a></li>
					</c:when>
					<c:when test="${param.sort != 'likes' || param.sort == null}">
						<li><a href="/post/post-list?sort=likes">추천순</a></li>
					</c:when>
				</c:choose>
			</ul>
			<ul>
				<li><a href="/post/posting-view">글쓰기</a></li>
			</ul>
		</div>
		<div>
			<table>
				<thead class="table_head">
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회</th>
					<th>추천</th>
				</thead>
				<tbody>
					<c:forEach items="${postList }" var="post" varStatus="num">
						<tr>
							<td>${param.page eq 1 ? num.count : (idx - 10) + num.count}</td>
							<td><a href="/post/detail?id=${post.id }">${post.title}</a></td>
							<td>${post.userId }</td>
							<td>${post.dates }</td>
							<td>${post.views}</td>
							<td>2</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="page">
		<%-- prve 처리 --%>
		<div class="page_prev">
			<c:choose> 
				<c:when test="${existPrev }">
					<a href="/post/post-list?page=${start - 1}">
					<i style="color: black" class="fa-solid fa-angle-left"></i></a>
				</c:when>
				<c:otherwise>
					<a><i style="color: white" class="fa-solid fa-angle-left"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
		<%-- next 처리 --%>
		<div>
			<c:forEach begin="${start }" end="${last}" var="idx">
				<a href="/post/post-list?page=${idx}">${idx }</a>
			</c:forEach>
		</div>
		
		<%-- next 처리 --%> 
		<div class="page_next">
			<c:choose>
				<c:when test="${existNext }">
					<a href="/post/post-list?page=${end - 1}">
					<i style="color: black" class="fa-solid fa-angle-right"></i></a>
				</c:when>
				<c:otherwise>
					<a><i style="color: white" class="fa-solid fa-angle-right"></i></a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</body>
</html>