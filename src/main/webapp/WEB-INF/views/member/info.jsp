<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/info</title>
<style type="text/css">
	h2{font-size : 40px; font-family:Gabriola; color:#702727; text-align:center; margin-top:20px;}
	table{margin:auto; text-align:center;}
	table tr td b{font-size:15px; color:#702727; padding:2px 20px;}
	table tr td{color : #682323; padding:2px 20px;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
	<h2>Member Information</h2>
	<table>
		<tr>
			<td> <b>ID</b> </td> <td> ${info.id } </td>
		</tr>
		<tr>
			<td> <b>PASSWORD</b> </td> <td> ${info.pw } </td>
		</tr>
		<tr>
			<td> <b>ADDRESS</b> </td> <td> ${info.addr } </td>
		</tr>
	</table>

	<br><hr><br>
	<button type="button" onclick="#"
			style="background-color:#D2B3B3;">수정</button>
			
	<c:set var="userId" value="${mem.id }" scope="session" />
	<button  type="button" onclick="#"
			 style="background-color:#D2B3B3;">삭제</button>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>