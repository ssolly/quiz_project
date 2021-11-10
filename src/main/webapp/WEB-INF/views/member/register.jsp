<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/register</title>
<style type="text/css">
	form {margin-top:20px;}
	table{margin:auto;}
	form input{margin-top:10px; margin-left:8px;}
	table tr td b{color:#702727;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">	
		<form action="register" method="post">
			<table>
				<tr>
					<td><b>ID</b></td>
					<td><input type="text" name="id" placeholder="input id"></td>
				</tr>
				<tr>
					<td><b>PASSWORD</b></td>
					<td> <input type="password" name="pw" placeholder="input password"></td>
				</tr>
				<tr>
					<td><b>ADDRESS</b></td>
					<td><input type="text" name="addr" placeholder="input address"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원가입" style="background-color:#D2B3B3;"></td>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>