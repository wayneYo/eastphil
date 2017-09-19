<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
<head>
	<script type="text/javascript" src="js/onclick.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
	<title>花之盛宴</title>

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
	
	<script>
		function pageClick(pageNum) {
			top.location.href="page.action?pageNum="+pageNum;
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

					</div>
				</div>
			</div>
		</div>
		<div class="section pt-7 pb-7">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-push-3">
						<div class="shop-filter">
							<div class="col-md-6">
								<p class="result-count"> 展示搜索结果</p>
							</div>
							<div class="col-md-6">
								<div class="shop-filter-right">
									<div class="switch-view">
										<a href="shop.html" class="switcher active" data-toggle="tooltip" data-placement="top" title="列表" data-original-title="Gird"><i class="ion-grid"></i></a>
									</div>
									<form class="commerce-ordering">
										<select name="orderby" class="orderby" onchange="javascript:location.href=this.value;">
											<option value="${ctx}/shop" >综合排序</option>
											<option value="${ctx}/orderBy">按照商品受欢迎度排序</option>
											<option value="${ctx}/orderBy">按照新品排序</option>
											<option value="${ctx}/orderByPrice" >按照价格由低到高排序</option>
											<option value="${ctx}/orderByPriceDesc">按照价格由高到底排序</option>
										</select>
									</form>
								</div>
							</div>
						</div>
						<div class="category-carousel-2 mb-3" data-auto-play="true" data-desktop="3" data-laptop="3" data-tablet="2" data-mobile="1">
							<c:forEach items="${categoriesList}" var="c" >
							<div class="cat-item">
								<div class="cats-wrap" data-bg-color="${c.cateColor}">
									<a href="${ctx}/categories?cateId=${c.cateId}">
										<img src="${c.picture}" alt="" />
										<h2 class="category-title">
											${c.cateName} <mark class="count"></mark>
										</h2>
									</a>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="product-grid">
							<c:forEach items="${productsList}" var="prod">
							<div class="col-md-4 col-sm-6 product-item text-center mb-3">
								<div class="product-thumb">
									<a href="${ctx}/shop-detail?productId=${prod.productId}" >
										<div class="badges">

											<span class="hot"<c:if test="${prod.state!=1}">style="display: none" </c:if>>Hot</span>
											<span class="onsale"<c:if test="${prod.state!=2}">style="display: none"</c:if>>Sale!</span>
										</div>
										<img src="${prod.imgurl}" alt="" />
									</a>
									<div class="product-action">
										<span class="add-to-cart">
											<a href="${ctx}/addToCart?productId=${prod.productId}" data-toggle="tooltip" data-placement="top" title="加入购物车"></a>
										</span>
									</div>
								</div>
								<div class="product-info">
									<a href="${ctx}/shop-detail">
										<h2 class="title">${prod.productName}</h2>
										<span class="price">
											<del>${prod.oldprice}</del>
											<ins>￥${prod.price}</ins>
										</span>
									</a>
								</div>
							</div>
							</c:forEach>
						</div>
						<div class="pagination">
							<c:forEach begin="0" end="${pageCount}" step="1" varStatus="s">

								<a class="page-numbers"  onclick="pageClick(${s.index})" <c:if test="${s.index==pageNum}">style="background-color: #4cae4c"</c:if>>${s.index+1}</a>
							</c:forEach>
						</div>
					</div>
					<div class="col-md-3 col-md-pull-9">
						<div class="sidebar">
							<div class="widget widget-product-search">
								<form class="form-search" method="post" action="${ctx}/search">
									<input type="text" id="se" class="search-field" placeholder="搜索商品…" value="" name="s" />
									<input type="submit" value="Search" />
								</form>
							</div>
							<div class="widget widget-product-categories">
								<h3 class="widget-title">产品分类</h3>
								<c:forEach items="${categoriesList}" var="c">
								<ul class="product-categories">
									<li><a href="${ctx}/categories?cateId=${c.cateId}">${c.cateName}</a> <span class="count">♥</span></li>
								</ul>
								</c:forEach>
							</div>

							<div class="widget widget_price_filter">
								<h3 class="widget-title">价格区间</h3>
								<div class="price_slider_wrapper">
									<div class="price_slider" style="display:none;"></div>
									<div class="price_slider_amount">
										<form action="updatePrice">
											<input type="text" id="min_price" name="min_price" value="" data-min="0" placeholder="Min price">
											<input type="text" id="max_price" name="max_price" value="" data-max="999" placeholder="Max price">
											<button type="submit" class="button">筛选</button>
										</form>

										<div class="price_label" style="display:none;">
											价格: <span class="from"></span> &mdash; <span class="to"></span>
										</div>
										<div class="clear"></div>
									</div>
								</div>
							</div>
							<div class="widget widget-products">
								<h3 class="widget-title">产品</h3>
								<ul class="product-list-widget">
									<c:forEach items="${productsMoneyList}" var="pm">
									<li>
										<a href="${ctx}/shop-detail?productId=${pm.productId}">
											<img src="${pm.imgurl}" alt="" />
											<span class="product-title">${pm.productName}</span>
										</a>
										<del>${pm.oldprice}</del>
										<ins>￥${pm.price}</ins>
									</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<jsp:include page="errorInfo.jsp"/>
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