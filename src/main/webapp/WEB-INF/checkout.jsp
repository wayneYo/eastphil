<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en-US">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
<title>结算中心</title>

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
<![endif]-->
	<%--<style type="text/css">
		body{ background:#EEEEEE;margin:0; padding:0; font-family:"微软雅黑", Arial, Helvetica, sans-serif; }
		a{ color:#006600; text-decoration:none;}
		a:hover{color:#990000;}
		.top{ margin:5px auto; color:#990000; text-align:center;}
		.info select{ border:1px #993300 solid; background:#FFFFFF;}
		.info{ margin:5px; text-align:center;}
		.info #show{ color:#3399FF; }
		.bottom{ text-align:right; font-size:12px; color:#CCCCCC; width:1000px;}
	</style>--%>

	<script type="text/javascript" src="${ctx}/js/city.js"></script>
	<script type="text/javascript" src="${ctx}/js/jquery-1.4.2.js"></script>
	<script type="text/javascript">
		/* 注册表单的js校验 */
		var formObj = {
			/* 检查输入项是否为空 */
			"checkNull" : function(name, msg){
				var value = $("#receiveName").val().trim();
				var value1 = $("#addDetail").val().trim();
				var value2 = $("#phonenum").val().trim();
				var value3 = $("#s_province").val();
				var value4 = $("#s_city").val();
				//清空之前的提示消息
				formObj.setMsg(name, "");
				if(value == "" || value == null){
					formObj.setMsg(name, msg);
					return false;
				}
				if(value1 == "" || value1 == null){
					formObj.setMsg(name, msg);
					return false;
				}
				if(value2 == "" || value2 == null){
					formObj.setMsg(name, msg);
					return false;
				}if(value3 == "省份" ){
					formObj.setMsg(name, msg);
					return false;
				}if(value4 == "地级市"){
					formObj.setMsg(name, msg);
					return false;
				}
				return true;
			},
			/* 设置错误提示消息 */
			"setMsg" : function(name, msg){
				$("#"+name+"_msg").html(msg);
				$("#"+name+"_msg").css("color", "red");
			}
			,
			/* 注册表单js校验  */
			"checkForm" : function(){
				//1.非空校验
				var res1 = formObj.checkNull("receiveName", "收货人姓名不能为空");
				var res2 = formObj.checkNull("province", "省份不能为空");
				var res3 = formObj.checkNull("city", "城市不能为空");
				var res4 = formObj.checkNull("addDetail", "具体地址不能为空");
				var res5 = formObj.checkNull("phonenum", "电话号码不能为空");
				//2.邮箱格式是否正确
				var res6 = formObj.checkEmail("email", "邮箱格式不正确");
				var res7 = res1&&res2&&res3&&res4&&res5&&res6;

				if(!res7) {
					alert("收货信息未填写完整")
				}

				return res7;

			},
			/* 检查邮箱格式是否正确  */
			"checkEmail" : function(name, msg){
				var email = $("#email").val().trim();

				if(email == ""){
					formObj.setMsg("email", "邮箱不能为空");
				}

				if(email != ""){
					var reg = /^\w+@\w+(\.\w+)+$/;
					if(!reg.test(email)){
						formObj.setMsg(name, msg);
						return false;
					}
				}
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
<div class="site">

	<jsp:include page="title.jsp"></jsp:include>

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
							<a href="cart.jsp">
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
						<h2 class="page-title text-center">Accounting Center</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="section border-bottom pt-2 pb-2">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<ul class="breadcrumbs">
							<li style="font-size: 28px">结算中心</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<form onsubmit="return formObj.checkForm()" method="post" action="${ctx}/paymentMethod">
		<div class="section section-checkout pt-7 pb-7">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h4>收货人信息</h4>
						<br/>
							<div class="row">
								<div class="col-md-6">
									<label>姓名 <span class="required">*</span></label>
									<div class="form-wrap">
										<input onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('不能为空!')" type="text" name="receiveName" id="receiveName" value="" size="40"
											   style="border-width: 1px; border-color: rgb(170,170,170)"/>
										<%--<input onfocus="formObj.setMsg('receiveName', '')" onblur="formObj.checkNull('receiveName', '收货人姓名不能为空')"--%>
											   <%--value="${ param.receiveName }" type="text" name="receiveName" id="receiveName" value="" size="40"--%>
											   <%--style="border-width: 1px; border-color: rgb(170,170,170)"/>--%>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<label>地址 <span class="required">*</span></label>
									<div class="address">
										<select onblur="if(this.value.replace(/^ +| +$/g,'')=='省份')alert('不能为空!')" id="s_province" name="province"></select>
										<select onblur="if(this.value.replace(/^ +| +$/g,'')=='地级市')alert('不能为空!')" id="s_city" name="city" ></select>
										<%--<select onfocus="formObj.setMsg('province', '')" onblur="formObj.checkNull('province', '收货省份不能为空')"--%>
												<%--value="${ param.province }" id="s_province" name="province"></select>--%>
										<%--<select onfocus="formObj.setMsg('city', '')" onblur="formObj.checkNull('city', '收货城市不能为空')"--%>
												<%--value="${ param.city }" id="s_city" name="city" ></select>--%>
										<script class="resources library" src="area.js" type="text/javascript"></script>
										<script type="text/javascript">_init_area();</script>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<label>具体地址 <span class="required">*</span></label>
									<div class="address-info">
										<input onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('不能为空!')" type="text" name="addDetail" id="addDetail" value="" size="40"
											   style="border-width: 1px; border-color: rgb(170,170,170)"/>
										<%--<input onfocus="formObj.setMsg('addDetail', '')" onblur="formObj.checkNull('addDetail', '具体地址不能为空')"--%>
											   <%--value="${ param.addDetail }" type="text" name="addDetail" id="addDetail" value="" size="40" --%>
											   <%--style="border-width: 1px; border-color: rgb(170,170,170)"/>--%>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>电话号码 <span class="required">*</span></label>
									<div class="form-wrap">
										<input onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('不能为空!')" type="text" name="phonenum" id="phonenum" value="" size="40"
											   style="border-width: 1px; border-color: rgb(170,170,170)"/>
										<%--<input onfocus="formObj.setMsg('phonenum', '')" onblur="formObj.checkNull('phonenum', '电话号码不能为空')"--%>
											   <%--value="${ param.phonenum }" type="text" name="phonenum" id="phonenum" value="" size="40"--%>
											   <%--style="border-width: 1px; border-color: rgb(170,170,170)"/>--%>
									</div>
								</div>
								<div class="col-md-6">
									<label>电子邮箱 </label>
									<div class="form-wrap">
										<input type="email" name="email" value="" id="email" size="40" style="border-width: 1px; border-color: rgb(170,170,170)"/>
									</div>
								</div>
							</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h4 class="mt-3">订单列表</h4>
						<br/>
						<div>
							<div>
								<div>
									<tr>
										<td>订单号：</td>
										<td>${orderId}</td>
									</tr>
									<input type="hidden" name="orderId" value="${orderId}"/>
								</div>
							</div>
						</div>
						<div>
							<div>
								<div>
									<tr>
										<td>订单时间：</td>
										<td>${ordertime}</td>
									</tr>
									<input type="hidden" name="ordertime" value="${ordertime}"/>
								</div>
							</div>
						</div>
						<div class="order-review">
							<table class="checkout-review-order-table">
								<thead>
									<tr>
										<th class="product-name">商品列表</th>
									</tr>
								</thead>
								<tbody>
								<c:set var="moneyInfo" value="0"/>
									<c:forEach items="${cart}" var="entry">
										<tr>
											<td class="product-name">${entry.key.productName}
												&nbsp;<strong class="product-quantity">× ${entry.value}</strong>
											</td>
											<td class="product-total">
												${entry.key.price * entry.value}元
											</td>
										</tr>
										<c:set var="moneyInfo" value="${moneyInfo+entry.key.price * entry.value}"/>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<th width="40%">总计</th>
										<td>${moneyInfo}元</td>
									</tr>
									<tr>
										<th>邮费</th>
										<td>
											<c:if test="${moneyInfo >= 88}"><c:set var="postMoney" value="0"></c:set>0元</c:if>
											<c:if test="${moneyInfo < 88}"><c:set var="postMoney" value="0"></c:set>0元</c:if>
										</td>
									</tr>
									<tr>
										<th>优惠</th>
										<td>
											<c:if test="${moneyInfo >= 288}"><c:set var="Cashback" value="20"></c:set>20元</c:if>
											<c:if test="${moneyInfo < 288}"><c:set var="Cashback" value="0"></c:set>0元</c:if>
										</td>
									</tr>
									<tr class="order-total">
										<th>总付款费用</th>
										<td><strong>${moneyInfo + postMoney - Cashback}元</strong></td>
									</tr>
								</tfoot>
							</table>
							<input type="hidden" name="money" value="${moneyInfo + postMoney - Cashback}"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<h4 class="mt-3">付款方式</h4>
						<div class="checkout-payment">
							<ul class="payment-method">
								<li>
									<input id="payment_method_cod" type="radio" class="input-radio" name="paymentMethod" value="cod" checked="checked" data-order_button_text="">
									<span>货到付款</span>
								</li>
								<li>
									<input id="payment_method_unionpay" type="radio" class="input-radio" name="paymentMethod" value="unionpay" data-order_button_text="Proceed to PayPal">
									银联支付 <img src="images/pay/unionpay.jpg" alt="">
								</li>
								<li>
									<input id="payment_method_yeepay" type="radio" class="input-radio" name="paymentMethod" value="yeepay" data-order_button_text="Proceed to PayPal">
									易宝支付 <img src="images/pay/yeepay.jpg" alt="">
								</li>
								<li>
									<input id="payment_method_alipay" type="radio" class="input-radio" name="paymentMethod" value="alipay" data-order_button_text="Proceed to PayPal">
									支付宝 <img src="images/pay/alipay.jpg" alt="">
								</li>
								<li>
									<input id="payment_method_wechatpay" type="radio" class="input-radio" name="paymentMethod" value="wechatpay" data-order_button_text="Proceed to PayPal">
									微信支付 <img src="images/pay/wechatpay.jpg" alt="">
								</li>
							</ul>
							<div class="" align="left">
								<input  type="submit" name="" value="提交结算"/>
								<!--<a class="organik-btn mt-6" href="#" > 提交 </a>-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
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