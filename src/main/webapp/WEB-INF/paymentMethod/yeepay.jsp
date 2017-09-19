<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>选择银行</title>
	<link href="${ctx}/css/pay.css" rel="stylesheet" type="text/css">
</head>
<body>
<form action="${ctx}/pay" method="post">
	<dl class="payment_page">
		<dt>
			<strong>订单号：</strong>
			<input class="idinp" name="orderId" readonly="readonly" type="text" value="${orderId}">
			<strong>支付金额：</strong>
			<input class="moneyinp" name="money" type="text" readonly="readonly" type="text" value="${param.money}">元
		</dt>
		<dd class="payment_page_name">
			<strong>请您选择在线支付银行 :</strong>
		</dd>
		<dd class="banks">
			<ul>
				<li>
					<input name="pd_FrpId" type="radio" value="ICBC-NET-B2C">
					<img src="${ctx}/images/pay/yeepay/01gs.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="CMBCHINA-NET-B2C">
					<img src="${ctx}/images/pay/yeepay/02zs.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="CCB-NET-B2C">
					<img src="${ctx}/images/pay/yeepay/03js.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/04ny.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/05zg.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/06jt.jpg" width="130" height="52">
				</li>
				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/07hx.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/08xy.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/09gd.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/10sz.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/11ms.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/12sh.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/13zx.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/14gd.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/15cq.jpg" width="130" height="52">
				</li>

				<li>
					<input name="pd_FrpId" type="radio" value="">
					<img src="${ctx}/images/pay/yeepay/16bh.jpg" width="130" height="52">
				</li>
			</ul>
		</dd>
		<div style="clear: both;"></div>
		<dd class="ok_dd">
			<input type="hidden" name="userId" value="${user.userId}"/>
			<input  type="submit" class="ok_pay" style="background: #5FBD74" value="确认支付">
		</dd>
	</dl>
</form>
</body>
</html>
