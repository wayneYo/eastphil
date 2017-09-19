<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="base.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2gCYlui0bPzYmHZRKAbfQIva36u9DWq3"></script>
	<jsp:include page="title.jsp"/>
	<script type="text/javascript" src="${ctx}/js/datepicker/WdatePicker.js"></script>

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
	<!--校验生日输入时间不超过现在时间-->
	<script>
		$("#birthday").datepicker({
			dateFormat: "yy-mm-dd"});
		$("#birthday").change(function(){
			var thetime=$(this).val();
			var d=new Date(Date.parse(thetime.replace(/-/g,"/")));
			var curDate=new Date();if(d >curDate){alert("请选择小于今天的时间！");
				$(this).val("");$(this).focus();}});
	</script>

	<!--留言板非空校验-->
	<script type="text/javascript">
		function checkContent()
		{

			if($("#username").val()=="" || $("#password").val()=="" || $("#nickname").val()==""|| $("#email").val()==""
					|| $("#phonenumber").val()==""|| $("#cardNo").val()==""|| $("#birthday").val()==""|| $("#remark").val()=="" )
			{
				alert("表格内容请填写完整哦~");
				return false;
			}  else {
			alert("修改成功！");
			return true;
		}
		}
	</script>
</head>
<body>


<div class="noo-spinner">
	<div class="spinner">
		<div class="cube1"></div>
		<div class="cube2"></div>
	</div>
</div>

<jsp:include page="menu-slideout.jsp"></jsp:include>

	<div id="main">
		<div class="section section-bg-10 pt-11 pb-17">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="page-title text-center" style="top: 0">用户中心</h2>
					</div>
				</div>
			</div>
		</div>

		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumbs">
							<li>用户中心</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div class="section pt-10 pb-10">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<hr class="mt-4 mb-7" />
						<div class="text-center mb-1 section-pretitle">个人信息</div>
						<div class="organik-seperator mb-6 center">
							<span class="sep-holder"><span class="sep-line"></span></span>
							<div class="sep-icon"><i class="organik-flower"></i></div>
							<span class="sep-holder"><span class="sep-line"></span></span>
						</div>

						<div class="contact-form-wrapper">


							<form class="contact-form" action="/updateUser-UserInfo" method="post" onsubmit="return checkContent()" name="myform">
									<div class="row">
								<div class="col-md-6">
									<label>您的用户名 <span class="required">*</span></label>
									<div class="form-wrap">
										<input id="username" type="text" value="${userCenterList.username}" size="40" name="username" />
									</div>
								</div>
								<div class="col-md-6">
									<label>您的密码 <span class="required">*</span></label>
									<div class="form-wrap">
										<input id="password" type="password" value="${userCenterList.password}" size="40" name="password"/>
									</div>
								</div>
							</div>
								<div class="row">
									<div class="col-md-6">
										<label>您的昵称 <span class="required">*</span></label>
										<div class="form-wrap">
											<input id="nickname" type="text" value="${userCenterList.nickname}" size="40" name="nickname" />
										</div>
									</div>
									<div class="col-md-6">
										<label>您的邮箱 <span class="required">*</span></label>
										<div class="form-wrap">
											<input id="email" type="email"  value="${userCenterList.email}" size="40" name="email"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>联系方式 <span class="required">*</span></label>
										<div class="form-wrap">
											<input id="phonenumber" type="text"  value="${userCenterList.phonenumber}" size="40" name="phonenumber" />
										</div>
									</div>
									<div class="col-md-6">
										<label>身份证号 <span class="required">*</span></label>
										<div class="form-wrap">
											<input id="cardNo" type="text" value="${userCenterList.userInfo.cardNo}" size="40" name="userInfo.cardNo"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<label>您的生日<span class="required">*</span></label>
										<div class="form-wrap">
											<input id="birthday" type="text" style="width:121px;" name="userInfo.birthday"
												   onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM-dd'});"
												   value="<fmt:formatDate value="${userCenterList.userInfo.birthday}" pattern="yyyy-MM-dd"/>"/>
										</div>
									</div>
									<td>
										<label>&nbsp;&nbsp;&nbsp;&nbsp;性别<span class="required">*</span></label>
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="userInfo.gender" value="男" <c:if test="${userCenterList.userInfo.gender =='男'}">checked="checked"</c:if>/>&nbsp;&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;&nbsp;
										<input type="radio" name="userInfo.gender" value="女" <c:if test="${userCenterList.userInfo.gender =='女'}">checked="checked"</c:if>/>&nbsp;&nbsp;&nbsp;&nbsp;女
									</td>
								</div>
								<div class="row">
									<div class="col-md-12">
										<label>个性签名 <span class="required">*</span></label>
										<div class="form-wrap">
											<input id="remark" type="text"  value="${userCenterList.userInfo.remark}" size="40" name="userInfo.remark" />
										</div>
									</div>
								</div>


								<div class="row" hidden="hidden">
									<div class="col-md-12">
										<div class="form-wrap">
											<input type="text"  value="${userCenterList.userId}" size="40" name="userId" />
										</div>
									</div>
								</div>

								<div class="row" hidden="hidden">
									<div class="col-md-12">
										<div class="form-wrap">
											<input type="text"  value="${userCenterList.userId}" size="40" name="userInfo.userInfoId" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-wrap text-center">
											<input type="submit" value="修改个人信息" />
										</div>
									</div>
								</div>
							</form>


						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="bottom.jsp"></jsp:include>

</div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.countdown.min.js"></script>
<script type="text/javascript" src="js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="js/jquery.prettyPhoto.init.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>

</body>
</html>

