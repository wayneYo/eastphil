<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>Charts</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="../assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/vendor/linearicons/style.css">
<link rel="stylesheet" href="../assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="../assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="../assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">


<script src="${pageContext.request.contextPath}/js/jquery-1.6.2.js"></script>

<script type="text/javascript">
	function liHoverChange(thisObj){

		thisObj.className = "active";

	}

</script>

<script type="text/javascript" src="${ctx}/js/datepicker/WdatePicker.js"></script>


<!-- WRAPPER -->
<div id="wrapper">
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="brand">
			<img src="../images/logo1.png"  class="img-responsive logo">
		</div>
	</nav>
	<!-- LEFT SIDEBAR -->
	<div id="sidebar-nav" class="sidebar">
		<div class="sidebar-scroll">
			<nav>
				<ul class="nav">

					<li><a href="${pageContext.request.contextPath}/back/saleList" onclick="liHoverChange(this)"><i class="lnr lnr-dice"></i> <span>用户分析</span></a></li>
					<li><a href="${pageContext.request.contextPath}/back/saleList2" onclick="liHoverChange(this)"><i class="lnr lnr-chart-bars"></i> <span>销售榜单</span></a></li>
					<li><a href="${pageContext.request.contextPath}/back/product" onclick="liHoverChange(this)" class="active"><i class="lnr lnr-home"></i> <span>商品管理</span></a></li>
					<li><a href="${pageContext.request.contextPath}/back/user" onclick="liHoverChange(this)"><i class="lnr lnr-code"></i> <span>用户管理</span></a></li>

				</ul>
			</nav>
		</div>
	</div>

	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="../assets/vendor/jquery/jquery.min.js"></script>
	<script src="../assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="../assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="../assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="../assets/scripts/klorofil-common.js"></script>
	<script>
		$(function() {
			var options;

			var data = {
				labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
				series: [
					[200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
				]
			};

			// line chart
			options = {
				height: "300px",
				showPoint: true,
				axisX: {
					showGrid: false
				},
				lineSmooth: false,
			};

			new Chartist.Line('#demo-line-chart', data, options);

			// bar chart
			options = {
				height: "300px",
				axisX: {
					showGrid: false
				},
			};

			new Chartist.Bar('#demo-bar-chart', data, options);


			// area chart
			options = {
				height: "270px",
				showArea: true,
				showLine: false,
				showPoint: false,
				axisX: {
					showGrid: false
				},
				lineSmooth: false,
			};

			new Chartist.Line('#demo-area-chart', data, options);


			// multiple chart
			var data = {
				labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
				series: [{
					name: 'series-real',
					data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
				}, {
					name: 'series-projection',
					data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
				}]
			};

			var options = {
				fullWidth: true,
				lineSmooth: false,
				height: "270px",
				low: 0,
				high: 'auto',
				series: {
					'series-projection': {
						showArea: true,
						showPoint: false,
						showLine: false
					},
				},
				axisX: {
					showGrid: false,

				},
				axisY: {
					showGrid: false,
					onlyInteger: true,
					offset: 0,
				},
				chartPadding: {
					left: 20,
					right: 20
				}
			};

			new Chartist.Line('#multiple-chart', data, options);

		});
	</script>

</div>
