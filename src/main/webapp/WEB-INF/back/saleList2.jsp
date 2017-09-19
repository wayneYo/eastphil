<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
	<title>销售榜单</title>
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
	<link rel="icon" type="image/png" sizes="96x96" href="../assets/img/favicon.png">
</head>

<body>
	<jsp:include page="backBase3.jsp"/>
	<!-- WRAPPER -->
	<div id="wrapper">

		<!-- MAIN -->
		<div class="main">

			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<h3 class="page-title">销售榜单</h3>

					<style type="text/css">
						#cateSale_main,#priceRange_main{
							display: inline-block;
						}
					</style>

					<!-- ECharts单文件引入 -->
					<script src="https://cdn.bootcss.com/echarts/3.7.1/echarts.min.js"></script>

					<!--表格一：根据种类分析销量-->
					<div id="cateSale_main" style="height:400px;width: 600px;margin: 130px 50px 0px 50px"></div>
					<script type="text/javascript">
						// 基于准备好的dom，初始化echarts图表
						var cateSale_main_chart = echarts.init(document.getElementById("cateSale_main"));
						option3 = {
							title: {
								text: '赠送对象分析',
							},
							tooltip: {
								trigger: 'axis'
							},
							legend: {
								data:['销量']
							},
							toolbox: {
								show: true,
								feature: {
									dataZoom: {
										yAxisIndex: 'none'
									},
									dataView: {readOnly: false},
									magicType: {type: ['line', 'bar']},
									restore: {},
									saveAsImage: {}
								}
							},
							xAxis:  {
								type: 'category',
								boundaryGap: false,
								data: ['送家人','送朋友','送爱人','送长辈']
							},
							yAxis: {
								type: 'value',
								axisLabel: {
									formatter: '{value} 件'
								}
							},
							series: [
								{
									name:'销量',
									type:'line',
									data:[${fmCate},${fdCate},${lvCate},${odCate}],
									markPoint: {
										data: [
											{type: 'max', name: '最大值'},
											{type: 'min', name: '最小值'}
										]
									},
									markLine: {
										data: [
											{type: 'average', name: '平均值'}
										]
									}
								},

							]
						};
						cateSale_main_chart.setOption(option3);
					</script>


					<div id="priceRange_main" style="height:400px;width: 600px;margin: 130px 0px 0px 50px"></div>
					<script type="text/javascript">
						// 基于准备好的dom，初始化echarts图表
						var priceRange_main_chart = echarts.init(document.getElementById("priceRange_main"));
						option4 = {
							title: {
								text: '价格区间销量分析',
							},
							color: ['#3398DB'],
							tooltip : {
								trigger: 'axis',
								axisPointer : {            // 坐标轴指示器，坐标轴触发有效
									type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
								}
							},
							grid: {
								left: '3%',
								right: '4%',
								bottom: '3%',
								containLabel: true
							},
							xAxis : [
								{
									type : 'category',
									data : ['0-100','100-200', '200-300', '300-400', '400-500', '500-600', '600-700' ],
									axisTick: {
										alignWithLabel: true
									}
								}
							],
							yAxis : [
								{
									type : 'value'
								}
							],
							series : [
								{
									name:'直接访问',
									type:'bar',
									barWidth: '60%',
									data:[${BNum},${ONum}, ${TNum}, ${THNum}, ${FNum}, ${FVNum}, ${SNum}]
								}
							]
						};
						priceRange_main_chart.setOption(option4);
					</script>
					</div>
				</div>
			</div>
			<!-- END MAIN CONTENT -->
		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
		<footer>
			<div class="container-fluid">
				<p class="copyright">Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a></p>
			</div>
		</footer>
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
</body>

</html>
