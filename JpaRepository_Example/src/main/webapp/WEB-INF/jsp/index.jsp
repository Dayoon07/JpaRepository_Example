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

	<main class="main">
        <div class="left">
            <form action="${ cl }/insert" method="post" autocomplete="on">
            	<div id="time" style="margin-left: 20px; margin-top: 10px;"></div>
                <div class="form-input-ui">
                    <h2>이름 (name)</h2>
                    <input type="text" name="name" id="name" required 
                        placeholder="이름을 입력하세요">
                </div>
                <div class="form-input-ui">
                    <h2>이메일 (email)</h2>
                    <input type="email" name="email" id="email" required
                        placeholder="이메일을 입력하세요">
                </div>
                <div class="form-input-ui">
                    <h2>비밀번호 (password)</h2>
                    <input type="password" name="password" id="password" required
                        placeholder="비밀번호를 입력하세요">
                </div>
                <div class="form-input-ui">
                    <button type="submit" class="submitBtn">insert</button>
                </div>
            </form>
        </div>
        <div class="right">
            <table border="1">
            	<tr>
            		<td>아이디 (id)</td>
            		<td>이름 (name)</td>
            		<td>이메일 (email)</td>
            		<td>비밀번호 (password)</td>
            		<td bgcolor="black"></td>
            	</tr>
            	<c:forEach var="user" items="${ users }">
            		<tr>
	                    <td>${ user.id }</td>
	                    <td>${ user.name }</td>
	                    <td><a href="/edit?id=${ user.id }">${ user.email }</a></td>
	                    <td>${ user.password }</td>
	                    <td>
	                        <form action="${ cl }/delete?id=${ user.id }" method="post" autocomplete="off">
	                            <button type="submit">delete</button>
	                        </form>
	                    </td>
	                </tr>
            	</c:forEach>
            </table>
        </div>
    </main>
	
	<script src="${ cl }/source/js/script.js"></script>
</body>
</html>