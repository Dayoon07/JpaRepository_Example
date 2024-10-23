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
	
	<div class="container mx-auto mt-10">
        <h1 class="text-2xl font-bold mb-5">사용자 정보 수정</h1>

        <form action="${ cl }/updating/${ userentityinfo.ID }" method="post" class="bg-white border shadow-md rounded px-8 pt-6 pb-8 mb-4">
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="username">이름 </label>
                <input type="text" id="username" name="username" value="${ userentityinfo.username }" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="email">이메일</label>
                <input type="email" id="useremail" name="useremail" value="${ userentityinfo.useremail }" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline" required>
            </div>

            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="phone">비밀번호</label>
                <input type="text" id="userpassword" name="userpassword" value="${ userentityinfo.userpassword }" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>

            <div class="flex items-center justify-between">
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">수정하기</button>
		        <a href="${ cl }/select"><button type="button" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">목록으로 돌아가기</button></a>
            </div>
        </form>
    </div>
    
    <div class="max-w-7xl mx-auto px-4">
	    <table class="table-auto border-collapse border border-gray-300 w-full text-left">
	        <tr class="bg-gray-200">
	            <th class="border border-gray-300 px-4 py-2">아이디</th>
	            <th class="border border-gray-300 px-4 py-2">이름</th>
	            <th class="border border-gray-300 px-4 py-2">이메일</th>
	            <th class="border border-gray-300 px-4 py-2">비밀번호</th>
	            <th class="border border-gray-300 px-4 py-2">삭제 여부</th>
	        </tr>
	        <c:forEach var="user" items="${ updateBottomList }">
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
	    </table>
	</div>
	
</body>
</html>