<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="cl" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
		<a href="${ cl }/select"
			class="inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 m-5 rounded">
		    조회하기
		</a>
</body>
</html>