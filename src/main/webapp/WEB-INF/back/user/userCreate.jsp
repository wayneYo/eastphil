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
			document.forms[0].action="${ctx}/back/"+toWhere;
			document.forms[0].submit();
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
							<a onclick="fromSubmit('toSave');this.blur()">
								<button type="button" class="btn btn-primary btn-lg">保存</button>
							</a>
						</div>
							<div class="actionButton">
								<a onclick="window.history.go(-1);this.blur()">
								<button type="button" class="btn btn-primary btn-lg">返回</button>
								</a>
							</div>



							<div class="panel" style="text-align: center">
								<div class="panel-heading">
									<h3 class="panel-title" id="useListH3">用户新增</h3>
								</div>
								<div class="panel-body">
									<table class="table table-bordered">

										<tbody>

										<tr>
											<td class="strongSize">用户名：</td>
											<td><input type="text" name="username"/></td>
											<td class="strongSize">密码：</td>
											<td><input type="password" name="password"/></td>
										</tr>

										<tr>
											<td class="strongSize">昵称：</td>
											<td><input type="text" name="nickname"/></td>
											<td class="strongSize">邮箱：</td>
											<td><input type="text" name="email"/></td>
										</tr>

										<tr>
											<td class="strongSize">电话号码：</td>
											<<td><input type="text" name="phonenumber"/></td>
											<td class="strongSize">身份证号</td>
											<td><input type="text" name="userInfo.cardNo"/></td>
										</tr>


										<tr>
											<td class="strongSize">性别：</td>
											<td><input type="radio" name="userInfo.gender" value="男"/>男
												<input type="radio" name="userInfo.gender" value="女"/>女
												<input type="radio" name="userInfo.gender" value="其他"/>其他
											</td>
											<td class="strongSize">生日：</td>
											<td><input type="text" name="userInfo.birthday"
												onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM-dd'});"/></td>
										</tr>

										<tr>
											<td class="strongSize">激活状态：</td>
											<td>
												<input type="radio" name="userInfo.statment" value="1"/>激活
												<input type="radio" name="userInfo.statment" value="0"/>不激活
											</td>
											<td class="strongSize">用户级别：</td>
											<td>
												<input type="radio" name="userInfo.userLevel" value="1"/>用户
												<input type="radio" name="userInfo.userLevel" value="2"/>管理员
											</td>
										</tr>
										<tr class="odd">
											<td class="strongSize" style="vertical-align: middle">备注信息:</td>
											<td colspan="3">
												<textarea style="width: 100%;height: 80px" name="userInfo.remark"></textarea>
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
