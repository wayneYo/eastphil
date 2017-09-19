<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="base.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
	<title>商品列表</title>

	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all" />
	<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
	<link rel='stylesheet' href='css/prettyPhoto.css' type='text/css' media='all'>
	<link rel='stylesheet' href='css/slick.css' type='text/css' media='all'>
	<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
	<link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
	<link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.js"/>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<script src="${ctx}/js/cart.js"/>

	<![endif]-->
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
						<h2 class="page-title text-center">Shop Detail</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumbs">

						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-7 pb-7">
			<div class="container">
				<div class="row">
					<div class="col-md-9 col-md-push-3">
						<div class="single-product">
							<div class="col-md-6">
								<div class="image-gallery">
									<div class="image-gallery-inner">
										<c:forEach items="${imgurlList}" var="img">
										<div>
											<div class="image-thumb">
												<a href="${img}" data-rel="prettyPhoto[gallery]">
													<img src="${img}" alt="" />
												</a>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
								<!-- 商品详情的小图-->
								<div class="image-gallery-nav">
									<c:forEach items="${imgurlList}" var="img">
										<div class="image-nav-item">
											<div class="image-thumb">
												<img src="${img}" alt="" />
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
							<div class="col-md-6">
								<div class="summary">
									<h1 class="product-title">${prod.productName}</h1>
									<div class="product-rating">
										<div class="star-rating">
											<span style="width:100%"></span>
										</div>
										<i>(有2个客户评论)</i>
									</div>
									<div class="product-price">

										<del>${prod.oldprice}</del>
										<ins>￥${prod.price}</ins>
									</div>
									<div class="mb-3">
										<p>${prod.presentation}</p>
									</div>
									<form class="cart" action="${ctx}/addToCart?productId=${prod.productId}">
										<input type="hidden" name="productId" value="${prod.productId}"/>
										<span id="prods_buynum">
												<input type="hidden" id="hid_${prod.productId}" />
												<a href="javascript:void(0)" class="delNum" >-</a>
												<input id="${prod.productId}" style="width: 60px;" class="buyNumInp1" type="text" value="1" >
												<a href="javascript:void(0)" class="addNum" >+</a>
										</span>
										<%--<div class="quantity-chooser">
											<div class="quantity">
												<span class="qty-minus" data-min="1"><i class="ion-ios-minus-outline"></i></span>
												<input type="text" name="quantity" value="1" title="Qty" class="input-text qty text" size="4">
												<span class="qty-plus" data-max=""><i class="ion-ios-plus-outline"></i></span>
											</div>
										</div>--%>
										<button type="submit" class="single-add-to-cart">加入购物车</button>
									</form>
									<div class="product-tool">
										<a class="compare" data-toggle="tooltip" data-placement="top" title="Add to compare"> 分享 </a>
										<div class="bdsharebuttonbox"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a></div>
									</div>
									<div class="product-meta">
										<table>
											<tbody>
											<tr>
												<td class="label">分类</td>
												<td>${prod.category.cateName}</td>
											</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<div class="col-md-12">
								<div class="commerce-tabs tabs classic">
									<ul class="nav nav-tabs tabs">
										<li class="active">
											<a data-toggle="tab" href="#tab-description" aria-expanded="true">描述</a>
										</li>
										<li class="">
											<a data-toggle="tab" href="#tab-reviews" aria-expanded="false">评论</a>
										</li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade active in" id="tab-description">
											<p>
												${prod.description}
											</p>
										</div>
										<div id="tab-reviews" class="tab-pane fade">
											<div class="single-comments-list mt-0">
												<div class="mb-2">
														<h2 class="comment-title">2个人评论夏日清新</h2>
												</div>
												<ul class="comment-list">
													<li>
														<div class="comment-container">
															<div class="comment-author-vcard">
																<img alt="" src="images/avatar/avatar.png" />
															</div>
															<div class="comment-author-info">
																<span class="comment-author-name">爱哭的小熊</span>
																<a href="#" class="comment-date">2017/09/12</a>
																<p>鲜花都非常好啊！已经送到啦！非常快，准时，而且服务很到位。鲜花的颜色是我想要的颜色，而且每一只都很新鲜。第一次在网上购买鲜花就这么顺利呢？很满意。</p>
															</div>
														</div>
														<ul class="children">
															<li>
																<div class="comment-container">
																	<div class="comment-author-vcard">
																		<img alt="" src="images/avatar/avatar.png" />
																	</div>
																	<div class="comment-author-info">
																		<span class="comment-author-name">月光女神</span>
																		<a href="#" class="comment-date">2017/09/05</a>
																		<p> 好友生日恰逢我不在国内，事先预定了他们家的鲜花速递服务。开始担心花的品质和送达的时间，咨询了好久，他们都一一耐心回答，包括祝福的贺词提醒。结果，他们家信守时间承诺，好友在饭点时间收到了惊喜，开心地不行！真是一次完美的体验，下次鲜花速递还找你家，放心，全五星啊</p>
																	</div>
																</div>
															</li>
														</ul>
													</li>
													<li>
														<div class="comment-container">
															<div class="comment-author-vcard">
																<img alt="" src="images/avatar/avatar.png" />
															</div>
															<div class="comment-author-info">
																<span class="comment-author-name">刘老师</span>
																<a href="#" class="comment-date">2017/08/21</a>
																<p>宝贝特别新鲜！闺蜜特别喜欢！时间刚刚好在我们去餐厅吃饭的时候送到！服务态度很好特别周到谢谢！</p>
															</div>
														</div>
													</li>
												</ul>
											</div>
											<%--<div class="single-comment-form mt-0">
												<div class="mb-2">
													<h2 class="comment-title">留言</h2>
												</div>
												<form class="comment-form">
													<div class="row">
														<div class="col-md-12">
															<textarea id="comment" name="comment" cols="45" rows="5" placeholder="写下你的评论吧 "></textarea>
														</div>
													</div>
													<div class="row">
														<div class="col-md-4">
															<input id="author" name="author" type="text" value="" size="30" placeholder="姓名 *" class="mb-2">
														</div>
														<div class="col-md-4">
															<input id="email" name="email" type="email" value="" size="30" placeholder="Email	 *" class="mb-2">
														</div>
													</div>
													<div class="row">
														<div class="col-md-2">
															<input name="submit" type="submit" id="submit" class="btn btn-alt btn-border" value="提交">
														</div>
													</div>
												</form>
											</div>--%>
										</div>
									</div>
								</div>
								<div class="related">
									<div class="related-title">
										<div class="text-center mb-1 section-pretitle fz-34">你可能会喜欢</div>
										<h2 class="text-center section-title mtn-2 fz-24">产品</h2>
									</div>
									<div class="product-carousel p-0" data-auto-play="true" data-desktop="3" data-laptop="2" data-tablet="2" data-mobile="1">
										<c:forEach items="${productsNumList}" var="pn">
										<div class="product-item text-center">
											  <div class="product-thumb">
												<a href="${ctx}/shop-detail?productId=${pn.productId}">
													<div class="badges">
														<span class="hot"<c:if test="${pn.state!=1}">style="display: none" </c:if>>Hot</span>
														<span class="onsale"<c:if test="${pn.state!=2}">style="display: none"</c:if>>Sale!</span>
													</div>
													<img src="${pn.imgurl}" alt="" />
												</a>
												<div class="product-action">
													<span class="add-to-cart">
														<a href="${ctx}/cart" data-toggle="tooltip" data-placement="top" title="加入购物车"></a>
													</span>
													<%--<span class="wishlist">
														<a href="${ctx}/wishList" data-toggle="tooltip" data-placement="top" title="收藏"></a>
													</span>--%>
												</div>
											</div>
											<div class="product-info">
												<a href="${ctx}/shop-detail?productId=${pn.productId}">
													<h2 class="title">${pn.productName}</h2>
													<del class="price">${pn.oldprice}</del>
													<span class="price">￥${pn.price}</span>
												</a>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-md-pull-9">
						<div class="sidebar">
							<div class="widget widget-product-search">
								<form class="form-search">
									<input type="text" class="search-field" placeholder="Search products…" value="" name="s" />
									<input type="submit" value="Search" />
								</form>
							</div>
							<div class="widget widget-product-categories">
								<h3 class="widget-title">产品分类</h3>
									<c:forEach items="${categoriesList}" var="c">
										<ul class="product-categories">
											<li><a href="${ctx}/categories?cateId=1">${c.cateName}</a> <span class="count">♥</span></li>
										</ul>
									</c:forEach>
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
	<jsp:include page="bottom.jsp"/>
</div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"Eastphil伊思菲儿，原创鲜花，美好值得等待！自然而生，花开为你！","bdMini":"2","bdMiniList":false,"bdPic":"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1505538558384&di=0c2ec23c28385222e5607f99c118ff53&imgtype=0&src=http%3A%2F%2Fi6.topit.me%2F6%2F12%2Fa2%2F1125606948e7ea2126o.jpg","bdStyle":"1","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.countdown.min.js"></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.init.min.js'></script>
<script type='text/javascript' src='js/slick.min.js'></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>