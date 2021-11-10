<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>default/header</title>
<style type="text/css">
	*{margin:0}
	.wrap {width:1000px; margin:0 auto; text-align:center;}
	.header{width:1000px; background-color:white;}
	.navdiv{width:100%; background-color:#9E4545; }
	nav{background-color:#9E4545;width: 1000px; }
	nav ul { list-style: none; display: flex; justify-content: flex-end; }
	nav ul li { margin: 0 3px; padding: 10px 10px; }
	nav ul li a { text-decoration: none; color: white; }
	nav ul li a:hover { color: white; padding-bottom: 3px; border-bottom:1px solid white;  }
	.title {text-shadow: 10px 10px 15px #D79D9D; font-size: 70pt;
   			text-align: center; margin-top: 0px; padding-bottom: 20px;
   			color:#CA5252; font-family:Gabriola; }
	.content{ margin-top: 50px; }
</style>
</head>
<body>
	<div class="wrap">
		<div class="header"> 
			<h1 class="title" onclick="location.href='${contextPath}/index'">CARE LAB</h1>
		</div>
	</div>
	<div class="navdiv">
		<div class="wrap">
			<nav>
				<ul>
					<li><a href="${contextPath }/index">HOME</a></li>
					<li>
						<c:choose>
							<c:when test="${loginUser!=null }">	<!-- 세션이 있다면 -->
								<a href="${contextPath }/member/memberInfo">MEMBERSHIP</a>
							</c:when>
							<c:otherwise>	<!-- 세션이 없다면 -->
								<a href="${contextPath }/member/login">MEMBERSHIP</a>
							</c:otherwise>
						</c:choose>
					</li>
					<li>
						<c:choose>
							<c:when test="${loginUser!=null }">	<!-- 세션이 있다면 -->
								<a href="${contextPath }/member/logout">LOGOUT</a>
							</c:when>
							<c:otherwise>	<!-- 세션이 없다면 -->
								<a href="${contextPath }/member/login">LOGIN</a>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>