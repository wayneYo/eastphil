<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="base.jsp"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=2gCYlui0bPzYmHZRKAbfQIva36u9DWq3"></script>
	<jsp:include page="title.jsp"/>

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
	<!--KindEditor-->
	<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
	<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script type="text/javascript" charset="utf-8" src="/js/jquery-easyui-1.4.1/jquery.min.js"></script>

	<!--KindEditor核心代码（包括解决同步问题）-->
	<script type="text/javascript">
	KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="msgContent"]', {
			resizeType : 1,
			allowPreviewEmoticons : false,
			allowImageUpload : true,
			uploadJson : 'upload.php',
			afterCreate : function() { this.sync(); }, //关键是这两个
			afterBlur: function(){this.sync();},//关键是这两个
			});
		});
	</script>

	<!--留言板非空校验-->
	<script type="text/javascript">
		function checkContent()
		{
			if($("#msgName").val()=="" || $("#msgEmail").val()=="" || $("#msgTitle").val()=="" )
			{
				alert("表格内容请填写完整哦~");
				return false;
			} else {
					if(!($("#msgContent").val()==""))
					{
						alert("感谢您的留言！");
						return true;
					}
					alert("留言内容请填写一下哦~");
					return false;
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
						<h2 class="page-title text-center" style="top: 0">联系我们</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumbs">
							<li>联系我们--地图导航</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-10 pb-10">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<div class="text-center mb-1 section-pretitle">点击放大</div>
						<div class="organik-seperator mb-6 center">
							<span class="sep-holder"><span class="sep-line"></span></span>
							<div class="sep-icon"><i class="organik-flower"></i></div>
							<span class="sep-holder"><span class="sep-line"></span></span>
						</div>
					</div>
				</div>

				<!--地图导入 -->
				<div id="allmap" style="width: 100%;height: 400px;overflow: hidden;margin: auto"></div>

				<div class="row">
					<div class="col-sm-3">
						<div class="contact-info">
							<div class="contact-icon">
								<i class="fa fa-map-marker"></i>
							</div>
							<div class="contact-inner">
								<h6 class="contact-title"> 地址</h6>
								<div class="contact-content">
									中国·杭州
									<br />
									西湖区文三路259号
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="contact-info">
							<div class="contact-icon">
								<i class="fa fa-phone"></i>
							</div>
							<div class="contact-inner">
								<h6 class="contact-title">联系电话</h6>
								<div class="contact-content">
									057188888888
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="contact-info">
							<div class="contact-icon">
								<i class="fa fa-envelope"></i>
							</div>
							<div class="contact-inner">
								<h6 class="contact-title">联系邮箱</h6>
								<div class="contact-content">
									88888888@qq.com
									<br />
									66666666@163.com
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="contact-info">
							<div class="contact-icon">
								<i class="fa fa-globe"></i>
							</div>
							<div class="contact-inner">
								<h6 class="contact-title"> 网站</h6>
								<div class="contact-content">
									www.flowers.com
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<hr class="mt-4 mb-7" />
						<div class="text-center mb-1 section-pretitle">给我们留言！</div>
						<div class="organik-seperator mb-6 center">
							<span class="sep-holder"><span class="sep-line"></span></span>
							<div class="sep-icon"><i class="organik-flower"></i></div>
							<span class="sep-holder"><span class="sep-line"></span></span>
						</div>
						<div class="contact-form-wrapper">


							<form class="contact-form" action="/contact-us-home" method="post" onsubmit="return checkContent()" name="myform">
									<div class="row">
									<div class="col-md-6">
										<label>您的名字 <span class="required">*</span></label>
										<div class="form-wrap">
											<input type="text" id="msgName" value="" size="40" name="msgName" />
										</div>
									</div>
									<div class="col-md-6">
										<label>您的邮箱 <span class="required">*</span></label>
										<div class="form-wrap">
											<input type="email" id="msgEmail" value="" size="40" name="msgEmail"/>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<label>标题 <span class="required">*</span></label>
										<div class="form-wrap">
											<input type="text" id="msgTitle" value="" size="40" name="msgTitle" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<label>信息内容</label>
										<div class="form-wrap">
											<tr>
												<td>
													<textarea id="msgContent" cols="40" rows="10" name="msgContent"></textarea>
												</td>
											</tr>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-wrap text-center">
											<input type="submit" value="发送给我们" />
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

<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(116.331398,39.897445);
	map.centerAndZoom(point,12);

	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			//alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			alert('failed'+this.getStatus());
		}
	},{enableHighAccuracy: true})
</script>

