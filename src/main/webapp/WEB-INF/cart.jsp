<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>我的花房</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
<link rel='stylesheet' href='css/prettyPhoto.css' type='text/css' media='all'>
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
<link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

	<style>

		.bb {
			border: 1px solid #5FBD74;
		}
	</style>

	<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.js"></script>
	<script  type="text/javascript" src="${ctx}/js/cart.js"></script>
	<script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<script>

		//-
		function delBuyNum(obj) {
			var num = $(obj).next().val() - 1;
			var id = $(obj).next().attr("id");
			//异步修改session中值
			$.get("editCartProduct?productId="+id+"&bnum="+num);
			if(num > 0){
				//给单条商品总价赋值
				$(obj).next().val(num);
				var amount = $(obj).parent().parent().next().children('span').text();
				var amount1 = parseInt(amount);
				$(obj).parent().parent().next().children('span').text(amount1 * num/(num+1));

				//给全部商品总价赋值
				var total = parseInt($("#total").text());
				$("#total").text(total - amount1/(num+1));
			} else {
				window.location.href="removeCartProduct?productId=" + id;
			}
		}
		//+
		function addBuyNum(obj) {
			var num = parseInt($(obj).prev().val())+1;
			var id = $(obj).prev().attr("id");
			//异步修改session中值
			$.get("editCartProduct?productId="+id+"&bnum="+num);
			//给单条商品总价赋值
			$(obj).prev().val(parseInt(num));
			var amount = $(obj).parent().parent().next().children('span').text();
			var amount1 = parseInt(amount);
			$(obj).parent().parent().next().children('span').text(amount1 * num/(num-1));

			//给全部商品总价赋值
			var total = parseInt($("#total").text());
			$("#total").text(total + amount1/(num-1));
		}
	</script>
</head>
<body>

 <jsp:include page="menu-slideout.jsp"></jsp:include>

<div class="noo-spinner">
	<div class="spinner">
		<div class="cube1"></div>
		<div class="cube2"></div>
	</div>
</div>

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
							<img class="logo-image" src="images/logo.png" alt="Eastphil Logo" />
						</a>
					</div>
				</div>
				<div class="col-xs-2">
					<div class="header-right">
						<div class="mini-cart-wrap">
							<a href="${ctx}/cart">
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
						<h2 class="page-title text-center">我的花房</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumbs">
							<li><a href="cart">我的花房</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="section pt-7 pb-7" >
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<table class="table shop-cart" >
							<tbody>
								<%-- 总费用--%>
								<c:set var="money" value="0"/>
									<%--遍历购物车--%>
									<c:forEach items="${cart}" var="entry">
									<tr class="cart_item" <c:if test="${empty entry.key}"> hidden="hidden" </c:if>>
										<td class="product-remove">
											<a href="${ctx}/removeCartProduct?productId=${entry.key.productId}" class="remove">×</a>
										</td>
										<td class="product-thumbnail">
											<a href="shop-detail">
												<img src="${entry.key.imgurl}" alt="">
											</a>
										</td>
										<td class="product-info">
											<a href="shop-detail.jsp">${entry.key.productName}</a>
											<span class="amount">￥${entry.key.price}</span>
										</td>
										<td>
											<span id="prods_buynum">
												<input type="hidden" id="hid_${entry.key.productId}" value="${entry.value}"/>
												<a style="" class="delNum" onclick="delBuyNum(this)"><button class="bb">-</button></a>
												<input id="${entry.key.productId}" style="width: 60px;" class="buyNumInp1" type="text" value="${entry.value}" />
												<a class="addNum" onclick="addBuyNum(this)"><button class="bb">+</button></a>
											</span>
										</td>

										<td class="product-subtotal">
											<span class="amount" id="amount">
												<c:if test="${empty entry.key}">0</c:if>
												<c:if test="${entry.key.price * entry.value != 0}"><fmt:formatNumber value="${entry.key.price * entry.value}"
														pattern="#.##" type="number"  maxFractionDigits="2"/></c:if>
											</span>
										</td>
										<c:set var="money" value="${money+entry.key.price * entry.value}"/>
									</tr>
							</c:forEach>

								<tr>
									<td colspan="5" class="actions">
										<a class="continue-shopping" href="shop">继续购买</a>
										<a class="update-cart" href="cart">刷新列表</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-4">
						<div class="cart-totals">
							<table>
								<tbody>
									<tr class="order-total">
										<th>付款金额</th>
										<td>
											<strong id="total">
												<c:if test="${empty cart}">0</c:if>
												<c:if test="${money != 0}"><fmt:formatNumber value="${money}"
													pattern="#.##" type="number"  maxFractionDigits="2"/></c:if></strong>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="proceed-to-checkout">
								<a href="${ctx}/toCheckout">前往结算中心</a>
							</div>
							<div class="msgtip" style="color: #FF4C41">
								<c:if test="${!empty errorInfo}">
									${errorInfo}
								</c:if>
							</div>
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
<script type='text/javascript' src='js/jquery.prettyPhoto.js'></script>
<script type='text/javascript' src='js/jquery.prettyPhoto.init.min.js'></script>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>