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
	<a href="${ cl }/"
		class="inline-block bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 m-5 rounded">
	    메인페이지 가기
	</a>
	
	<form action="${ cl }/insertIntoTESTUSER" method="post" autocomplete="off" class="max-w-md mx-auto bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
	    <div class="mb-4">
	        <label for="username" class="block text-gray-700 text-sm font-bold mb-2">Username</label>
	        <input type="text" name="username" id="username" placeholder="Username" required="required"
	            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
	    </div>
	    
	    <div class="mb-4">
	        <label for="useremail" class="block text-gray-700 text-sm font-bold mb-2">Email</label>
	        <input type="email" name="useremail" id="useremail" placeholder="Useremail" required="required"
	            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
	    </div>
	    
	    <div class="mb-4">
	        <label for="userpassword" class="block text-gray-700 text-sm font-bold mb-2">Password</label>
	        <input type="password" name="userpassword" id="userpassword" placeholder="Userpassword" required="required"
	            class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
	    </div>
	    
	    <div class="flex items-center justify-between">
	        <button type="submit" 
	            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
	            레코드 추가
	        </button>
	    </div>
	</form>

	<div class="max-w-7xl mx-auto px-4">
	    <table class="table-auto border-collapse border border-gray-300 w-full text-left">
	        <tr class="bg-gray-200">
	            <th class="border border-gray-300 px-4 py-2">아이디</th>
	            <th class="border border-gray-300 px-4 py-2">이름</th>
	            <th class="border border-gray-300 px-4 py-2">이메일</th>
	            <th class="border border-gray-300 px-4 py-2">비밀번호</th>
	            <th class="border border-gray-300 px-4 py-2">삭제 여부</th>
	        </tr>
	        <c:if test="${ not empty selectAll }">
	        	<c:forEach var="user" items="${ selectAll }">
		            <tr class="hover:bg-gray-100">
		                <td class="border border-gray-300 px-4 py-2">${ user.ID }</td>
		                <td class="border border-gray-300 px-4 py-2">${ user.username }</td>
		                <td class="border border-gray-300 px-4 py-2"><a href="${ cl }/update/${ user.ID }">${ user.useremail }</a></td>
		                <td class="border border-gray-300 px-4 py-2">${ user.userpassword }</td>
		                <td class="border border-gray-300 px-4 py-2">
							<form action="${ cl }/deleteRecord" method="post">
								<input type="hidden" name="ID" id="ID" value="${ user.ID }" readonly="readonly">
								<button type="submit">삭제</button>
							</form>
						</td>
		            </tr>
		        </c:forEach>
	        </c:if>
	        <c:if test="${ empty selectAll }">
	        	<tr class="hover:bg gray-100"><td class="border border-gray-300 px-4 py2" colspan="5"><h3 class="text-2xl px-4 py-4 text text-center">아무런 값이 저장되어 있지 않습니다.</h3></td></tr>
	        </c:if>
	    </table>
	</div>
</body>
</html>