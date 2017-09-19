<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>留言信息</title>
</head>
<body>
	<table border="1px" width="65%" align="center">
		<tr>
			<td colspan="6" align="center"><h3>留言信息表</h3></td>
		</tr>
		<tr>
			<th>Id</th>
			<th>姓名</th>
			<th>邮箱</th>
			<th>标题</th>
			<th>内容</th>
		</tr>
		
		<c:forEach items="${contactMsgList}" var="u">
			<tr>
				<th>${u.msgId}</th>
				<th>${u.msgName}</th>
				<th>${u.msgEmail}</th>
				<th>${u.msgTitle}</th>
				<th>${u.msgContent}</th>
			</tr>
		</c:forEach>
		<tr align="center">
		</tr>
	</table>
</body>
</html>