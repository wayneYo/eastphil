<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	</style>
	<script type="text/Javascript">
		function fromSubmit(toWhere){
			document.forms[0].action = "${pageContext.request.contextPath}/back/"+toWhere;//发起请求，delete
			document.forms[0].submit();
		}
	</script>
</head>

<body>
	<!--引入top和left界面-->
	<jsp:include page="backBase1.jsp" />
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
								<a onclick="fromSubmit('product');this.blur()">
								<button type="button" class="btn btn-primary btn-lg">返回</button>
								</a>
							</div>
							<div class="panel" style="text-align: center">
								<div class="panel-heading">
									<h3 class="panel-title" id="useListH3">商品查看</h3>
								</div>
								<div class="panel-body">
									<table class="table table-bordered">
										<tbody>
										<tr>
											<td>商品ID</td>
											<td>${product.productId}</td>
											<td>种类</td>
											<td>${product.category.cateName}</td>
										</tr>
										<tr>
											<td>商品名称</td>
											<td>${product.productName}</td>
											<td>库存</td>
											<td>${product.pnum}</td>
										</tr>
										<tr>
											<td>原价</td>
											<td>${product.oldprice}</td>
											<td>现价</td>
											<td>${product.price}</td>
										</tr>
										<tr>
											<td>图片地址</td>
											<td>${product.imgurl}</td>
											<td>商品描述</td>
											<td>${product.description}</td>
										</tr>
										<tr>
											<td>商品简介</td>
											<td>${product.presentation}</td>
											<td>状态</td>
											<td>${product.state}</td>
										</tr>
										<tr>
											<td>商品上架时间</td>
											<td>${product.createTime}</td>
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
