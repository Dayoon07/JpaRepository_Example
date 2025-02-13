<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jpa repository 연습</title>
    <link rel="stylesheet" href="${ cl }/source/css/style.css">
</head>
<body>

	<div style="width: 500px;">
		<form action="${ cl }/update" method="post" autocomplete="on">
            <div id="time" style="margin-left: 20px; margin-top: 20px;"></div>
            <div class="form-input-ui">
	            <h2>아이디 (id) : ${ edit.id }</h2>
	            <input type="hidden" name="id" id="id" required readonly value="${ edit.id }">
            </div>
            <div class="form-input-ui">
	            <h2>이름 (name)</h2>
	            <input type="text" name="name" id="name" required 
	            placeholder="이름을 입력하세요" value="${ edit.name }">
            </div>
            <div class="form-input-ui">
	            <h2>이메일 (email)</h2>
	            <input type="email" name="email" id="email" required
	            placeholder="이메일을 입력하세요" value="${ edit.email }"> 
            </div>
            <div class="form-input-ui">
	            <h2>비밀번호 (password)</h2>
	            <input type="text" name="password" id="password" required
	            placeholder="비밀번호를 입력하세요" value="${ edit.password }">
            </div>
            <div class="form-input-ui">
            	<button type="submit" class="submitBtn">update</button>
            </div>
		</form>
	</div>
		
	<script src="${ cl }/source/js/script.js"></script>
</body>
</html>