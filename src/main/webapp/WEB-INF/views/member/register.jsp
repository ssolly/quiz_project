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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	<!-- jquery -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            console.log("data.userSelectType : " + data.userSelectedType)
            console.log("data.roadAddress : " + data.roadAddress)
            console.log("data.jibunAddress : " + data.jibunAddress)
            console.log("data.zoneconde(우편번호) : " + data.zonecode)
            //문장을 하나로 합치기 위해 변수 생성
            var addr=""
            if(data.userSelectedType === 'R') { //도로명
            	addr = data.roadAddress
            } else {	//지번
            	addr = data.jibunAddress
            }
            $("#addr1").val(data.zonecode)
            $("#addr2").val(addr)
            $("#addr3").focus()
        }
    }).open();
}
</script>
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
					<td colspan="3"><input type="submit" value="회원가입" style="background-color:#D2B3B3;"></td>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>