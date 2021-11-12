<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/login</title>
<style type="text/css">
	table {margin:auto; margin-top:20px;}
	table tr td {padding:2px 8px;}
	table tr td b{color:#702727; padding:2px 8px;} 
	table label{font-size:13px; color:#702727;}
	.chkBox{font-size:13px; color:#702727;margin-left:10px;}
	<%--.mem_reg{margin-left:30px;} --%>
	.btn_login{padding:14px 9px; background-color:#D2B3B3;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<form action="${contextPath }/member/user_check" method="post">
			<table>
				<tr>
					<td><b>ID</b></td>
					<td><input type="text" name="id" placeholder="input id"></td>
					<td rowspan="2"> <input type="submit" value="로그인" class="btn_login"></td>
				</tr>
				<tr>
					<td><b>PASSWORD</b></td>
					<td> <input type="password" name="pw" placeholder="input password"></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: right;">
						<label class="mem_reg" onclick="location.href='register_form'">회원가입</label> &ensp; <label>아이디/비밀번호 찾기</label>
						<!-- label안쓰고 바로 a href 사용해도 된다 -->
						<input type="checkbox" name="autoLogin" class="chkBox"><label>자동로그인</label>  &ensp;
					</td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>