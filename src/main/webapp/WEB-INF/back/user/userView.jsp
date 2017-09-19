<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!doctype html>
<html lang="en">

<head>
	<title></title>
	<!--功能标签-->
	<c:set value="${pageContext.request.contextPath}" var="ctx"></c:set>


	<style type="text/css">
		body{
			background: #F5F5F5;
		}
		h1{
			text-align: center;
		}
		table{
			margin: 0px auto;
			text-align: center;
		}

		table th{
			text-align: center;
		}

		.actionButton{
			display: inline-block;
			margin: 10px 10px 0px 10px;
		}
		.strongSize{
			font-weight: bold;
		}

	</style>

	<script type="text/Javascript">

		function fromSubmit(toWhere){
			top.location.href="${ctx}/back/"+toWhere;
		}

	</script>



</head>

<body>
	<!--引入top和left界面-->
	<jsp:include page="../backBase2.jsp" />


	<!-- MAIN -->
	<form name="icform" method="post">
	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">

							<div class="actionButton">
								<a onclick="window.history.go(-1);this.blur()">
								<button type="button" class="btn btn-primary btn-lg">返回</button>
								</a>
							</div>



							<div class="panel" style="text-align: center">
								<div class="panel-heading">
									<h3 class="panel-title" id="useListH3">用户查看</h3>
								</div>
								<div class="panel-body">
									<table class="table table-bordered">

										<tbody>

										<tr>
											<td class="strongSize">用户Id：</td>
											<td>${user.userId}</td>
											<td class="strongSize">用户名：</td>
											<td>${user.username}</td>
										</tr>

										<tr>
											<td class="strongSize">昵称：</td>
											<td>${user.nickname}</td>
											<td class="strongSize">邮箱：</td>
											<td>${user.email}</td>
										</tr>

										<tr>
											<td class="strongSize">电话号码：</td>
											<td>${user.phonenumber}</td>
											<td class="strongSize">身份证号</td>
											<td>${user.userInfo.cardNo}</td>
										</tr>

										<tr>
											<td class="strongSize">真实姓名：</td>
											<td>${user.userInfo.name}</td>
											<td class="strongSize">注册时间：</td>
											<td><fmt:formatDate value="${user.userInfo.joinDate}" pattern="yyyy-MM-dd"/></td>

										</tr>

										<tr>
											<td class="strongSize">性别：</td>
											<td>${user.userInfo.gender}</td>
											<td class="strongSize">生日：</td>
											<td><fmt:formatDate value="${user.userInfo.birthday}" pattern="yyyy-MM-dd"/></td>
										</tr>

										<tr>
											<td class="strongSize">激活状态：</td>
											<td><c:if test="${user.userInfo.statment == 0}">未激活</c:if>
												<c:if test="${user.userInfo.statment == 1}">已激活</c:if>
											</td>
											<td class="strongSize">用户级别：</td>
											<td><c:if test="${user.userInfo.userLevel == 1}">用户</c:if>
												<c:if test="${user.userInfo.userLevel == 2}">管理员</c:if>
											</td>
										</tr>
										<tr class="odd">
											<td class="strongSize" style="vertical-align: middle">备注信息:</td>
											<td colspan="3">
												<textarea style="width: 100%;height: 80px" readonly="readonly">${user.userInfo.remark }</textarea>
											</td>
										</tr>

										</tbody>
									</table>
								</div>
							</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	</form>
	</body>
</html>

	<!-- END WRAPPER -->
	<!-- Javascript -->

</body>

</html>
