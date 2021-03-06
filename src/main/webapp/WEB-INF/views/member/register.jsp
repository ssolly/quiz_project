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
<script src="<%=request.getContextPath()%>/resources/js/daumpost.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	<!-- jquery -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function register(){
    addr1 = $("#addr1").val()
	addr2 = $("#addr2").val()
	addr3 = $("#addr3").val()
	addr = addr1 +"/" +addr2 + "/" +addr3
	$("#addr1").val(addr)
	fo.submit()
}
</script>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">	
		<form action="register" method="post" id="fo">
			<table>
				<tr>
					<td><b>ID</b></td>
					<td><input type="text" name="id" placeholder="input id"></td>
				</tr>
				<tr>
					<td><b>PASSWORD</b></td>
					<td><input type="password" name="pw" placeholder="input password"></td>
				</tr>
				<tr>
					<td rowspan="4"><b>ADDRESS</b></td>
					<td><input type="text" readonly id="addr1" name="addr" placeholder="zonecode"></td>
				</tr>
				<tr>
					<td><input type="text" readonly id="addr2" placeholder="address">
				</tr>
				<tr>
					<td><input type="text" id="addr3" placeholder="detail address">
				</tr>
				<tr>
					<td><input type="button" onclick="daumPost()" value="우편번호찾기" style="background-color:#DFC8C8;"></td>
				</tr>
				<tr>
					<!-- <td colspan="3"><input type="submit" value="회원가입" style="background-color:#D2B3B3;"></td> -->
					<td colspan="3"><input type="button" onclick="register()" value="회원가입" style="background-color:#D2B3B3;"></td>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>