<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
<head>
	<script type="text/javascript" src="js/onclick.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
	<title>花之心愿</title>

	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
	<link rel='stylesheet' href='css/prettyPhoto.css' type='text/css' media='all'>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
	<link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>

<jsp:include page="errorInfo.jsp"/>

<div class="noo-spinner">
	<div class="spinner">
		<div class="cube1"></div>
		<div class="cube2"></div>
	</div>
</div>
<jsp:include page="menu-slideout.jsp"/>
<div class="site">
	<jsp:include page="title.jsp"/>
	<header class="header header-mobile">
		<div class="container">
			<div class="row">
				<div class="col-xs-2">
					<div class="header-left">
						<div id="open-left"><i class="ion-navicon"></i></div>
					</div>
				</div>
				<div class="col-xs-8">
					<div class="header-center">
						<a href="#" id="logo-2">
							<img class="logo-image" src="images/logo.png" alt="Organik Logo" />
						</a>
					</div>
				</div>
				<div class="col-xs-2">
					<div class="header-right">
						<div class="mini-cart-wrap">
							<a href="cart.html">
								<div class="mini-cart">
									<div class="mini-cart-icon" data-count="2">
										<i class="ion-bag"></i>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div id="main">
		<div class="section section-bg-10 pt-11 pb-17">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<h2 class="page-title text-center">Shop</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumbs">
							<li><a href="#">花鲜物语</a></li>
							<li><a href="#">花之盛宴</a></li>
							<li>心愿展示</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-7 pb-7">
						<div class="product-grid">
							<c:forEach items="${wishList}" var="entry">

							<div class="col-md-4 col-sm-6 product-item text-center mb-3">
								<div class="product-thumb">
									<a href="#" >
										<div class="badges">

											<span class="hot"<c:if test="${entry.key.state!=1}">style="display: none" </c:if>>Hot</span>
											<<span class="onsale"<c:if test="${entry.key.state!=2}">style="display: none"</c:if>>Sale!</span>
										</div>
										<img src="${entry.key.imgurl}" alt="" />
									</a>
									<div class="product-action">
										<span class="add-to-cart">
											<a href="${ctx}/cart" data-toggle="tooltip" data-placement="top" title="加入购物车"></a>
										</span>
									</div>
								</div>
								<div class="product-info">
									<a href="${ctx}/shop-detail">
										<h2 class="title">${entry.key.productName}</h2>
										<span class="price">
											<del>${entry.key.oldprice}</del>
											<ins>￥${entry.key.price}</ins>
										</span>
									</a>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="pagination">
							<a class="prev page-numbers" href="#">前一页</a>
							<a class="page-numbers" href="#">1</a>
							<span class="page-numbers current">2</span>
							<a class="page-numbers" href="#">3</a>
							<a class="next page-numbers" href="#">下一页</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="bottom.jsp"/>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.countdown.min.js"></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.init.min.js'></script>
<script type="text/javascript" src="js/script.js"></script>

<script type="text/javascript" src="js/core.min.js"></script>
<script type="text/javascript" src="js/widget.min.js"></script>
<script type="text/javascript" src="js/mouse.min.js"></script>
<script type="text/javascript" src="js/slider.min.js"></script>
<script type="text/javascript" src="js/jquery.ui.touch-punch.js"></script>
<script type="text/javascript" src="js/price-slider.js"></script>
</body>
</html>