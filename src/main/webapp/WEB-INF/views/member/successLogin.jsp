<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/successLogin</title>
<style type="text/css">
	h3 {color:#702727; }
	label {color:#702727;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
	
	<h3>로그인 성공</h3>
	<label> ${loginUser }님 환영합니다! </label>
	
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>