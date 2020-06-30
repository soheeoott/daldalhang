<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
<c:if test="${logID != null}">
	${logID}님 안녕 하세요 ~~ <br>
</c:if>  
</h1>
<a href="loginf">로그인 하러 가기 </a><br>
<a href = "joinf">회원가입</a>
</body>
</html>
