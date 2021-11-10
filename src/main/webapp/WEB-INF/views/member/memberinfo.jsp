<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/membership</title>
<style type="text/css">
	table {margin:auto; margin-top: 30px; text-align:center;} 
	table caption{font-size : 40px; font-family:Gabriola; color:#702727; text-align:center;}
	table tr:nth-child(odd){background-color:#F6E8E8;}
	table tr th{font-size:17px; color:#702727; background-color:#E4D1D1; padding:2px 25px;}
	table tr td {color : #682323; padding:2px 25px; }
	table tr td a {color:#682323;}
	button {background-color:#D2B3B3; margin-top:10px;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap"> 

		<table>
			<caption><b>Member Information</b></caption>	<!-- caption:제목 -->
			<tr>
				<th>아이디</th><th>비밀번호</th><th>주소</th>
			</tr>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td><a href="info?id=${member.id }">${member.id }</a></td>
					<td>${member.pw }</td>
					<td>${member.addr }</td>
				</tr>
			</c:forEach>	
		</table> 
		
		<button type="button" onclick="location.href=#"> 등록</button>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>