<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D.C</title>
<link rel="stylesheet" href="/resource/css/style2.css" />
</head>
<body>
	<div style="display: flex;">
		<form action="/post/post-task" method="post">
			<div>
			<textarea style="border: 1px solid #ccc;" class="comment_formta" 
			name="title" placeholder="제목을 입력하세요."></textarea>
			</div>
			<textarea style="border: 1px solid #ccc;" class="comment_formta" 
			name="content" placeholder="내용을 입력하세요."></textarea>
			<button type="submit">글등록</button>
		</form>
	</div>
</body>
</html>