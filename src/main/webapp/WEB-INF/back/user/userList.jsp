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
		function checkAll(who,obj) {
			var curCheckBox = document.getElementsByName(who);
			for(i=0;i<curCheckBox.length;i++){
				curCheckBox.item(i).checked = obj.checked;
			}
		}

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

	<div id="wrapper">
		<!-- MAIN -->
		<div class="main">

			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">

							<div class="actionButton">
								<a href="#" onclick="fromSubmit('toViewUser');this.blur()">
								<button type="button" class="btn btn-primary btn-lg">查看</button>
								</a>
							</div>
							<div class="actionButton">
								<a onclick="fromSubmit('toCreateUser');this.blur()">
								<button type="button" class="btn btn-primary btn-lg">增加</button>
								</a>
							</div>
							<div class="actionButton">
								<a onclick="fromSubmit('toUpdateUser');this.blur()">
								<button type="button" class="btn btn-primary btn-lg">修改</button>
								</a>
							</div>
							<div class="actionButton">
								<a onclick="fromSubmit('toDeleteUser');this.blur()">
								<button type="button" class="btn btn-primary btn-lg">删除</button>
								</a>
							</div>

						<div class="actionButton">
							<button type="button" class="btn btn-primary btn-lg" onclick="window.location.href='${ctx}/back/downloadUserList'">打印</button>
						</div>


							<div class="panel" style="text-align: center">
								<div class="panel-heading">
									<h3 class="panel-title" id="useListH3">用户列表</h3>
								</div>
								<div class="panel-body">
									<form name="icform" method="post">
									<table class="table table-bordered">
										<thead>
										<tr>
											<th><input type="checkbox" name="selid" onclick="checkAll('userId',this)"/></th>
											<th>序号</th>
											<th>用户ID</th>
											<th>用户名</th>
											<th>邮箱</th>
											<th>电话号码</th>
											<th>状态</th>
											<th>用户等级</th>
										</tr>
										</thead>
										<tbody>
										<c:forEach items="${pageUserList}" var="user" varStatus="status">

										<tr <c:if test="${status.index%2 != 0}">style="background-color: #f5f5f5"</c:if>	>
											<td><input type="checkbox" name="userId" value="${user.userId}"/></td>
											<td>${status.index+1+(pageNum-1)*everyPage}</td>
											<td>${user.userId}</td>
											<td>${user.username}</td>
											<td>${user.email}</td>
											<td>${user.phonenumber}</td>
											<td>${user.userInfo.statment}</td>
											<td>${user.userInfo.userLevel}</td>

										</tr>
										</c:forEach>
										</tbody>
									</table>
									</form>
									<script>
										function submitPageNum(num) {
											top.location.href="${ctx}/back/user?pageNum="+num
										}
										function showAllPageButton(thisObj) {

											$(".pageButton_user").show();

										}
									</script>
									<style>
										.pageButton_user{
											width: 40px;
											height: 40px;
											margin: 0 5px;
											background-color: rgba(255, 255, 255, 0.91);
											border: 1px solid;


										}
										.pageButton_u{
											height: 40px;
											margin: 0 5px;
											background-color: rgba(255, 255, 255, 0.91);
											border: 1px solid;

										}
									</style>
									<div >
										<button class="pageButton_u" onclick="submitPageNum(${pageNum-2})">上一页</button>
										<c:forEach  begin="0" end="${pageNums-1}" step="1" varStatus="id">
											<button class="pageButton_user" type="button"
													<c:if test="${pageNum == (id.index+1)}">style="background-color: #00a0f0"</c:if>
													<c:if test="${id.index>4}">style="display:none"</c:if>
													onclick="submitPageNum(${id.index})"
											>${id.index+1}</button>
										</c:forEach>
										<span <c:if test="${id.index<=4}">style="display:none"</c:if> onclick="showAllPageButton(this)">...</span>
										<button class="pageButton_u"
												onclick="submitPageNum(${pageNum})">下一页</button>
										<button class="pageButton_u"
												onclick="submitPageNum(${pageNums-1})">尾页</button>
									</div>
								</div>


							</div>

					</div>
				</div>
			</div>


		</div>
	</div>


	</body>
</html>

	<!-- END WRAPPER -->
	<!-- Javascript -->

</body>

</html>
