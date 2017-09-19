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
								<a onclick="fromSubmit('saveAddProduct');this.blur()">
								<button type="button" class="btn btn-primary btn-lg">保存</button>
								</a>
							</div>
							<div class="panel" style="text-align: center">
								<div class="panel-heading">
									<h3 class="panel-title" id="useListH3">商品添加</h3>
								</div>
								<div class="panel-body">
									<table class="table table-bordered">
										<tbody>
										<tr>
											<td>商品ID</td>
											<td><input type="text" name="productId" ></td>
											<td>种类</td>
											<td>
												<select name="category.cateId" style="width:121px">
													<option>请选择种类</option>
													<c:forEach items="${categoryList}" var="c">
														<option value="${c.cateId}">${c.cateName}</option>
													</c:forEach>
												</select>
											</td>
										</tr>
										<tr>
											<td>商品名称</td>
											<td><input name="productName" type="text"></td>
											<td>库存</td>
											<td><input name="pnum" type="text"></td>
										</tr>
										<tr>
											<td>原价</td>
											<td><input type="text" name="price"></td>
											<td>现价</td>
											<td><input name="oldprice" type="text"></td>
										</tr>
										<tr>
											<td>图片地址</td>
											<td><input type="file" name="imgurl"/></td>
											<td>商品描述</td>
											<td><input type="text" name="description"/></td>
										</tr>
										<tr>
											<td>商品简介</td>
											<td><input type="text" name="presentation"/></td>
											<td>状态</td>
											<td><input type="text" name="state"/></td>
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
