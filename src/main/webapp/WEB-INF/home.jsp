<%--
  Created by IntelliJ IDEA.
  User: BIG
  Date: 2017/9/13
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <title>Home</title>

    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/ionicons.min.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/owl.carousel.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/owl.theme.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/settings.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all">
    <link rel="stylesheet" href="css/custom.css" type="text/css" media="all">
    <link href="http://fonts.googleapis.com/css?family=Great+Vibes%7CLato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="http://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
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
        <div class="section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12 p-0">
                        <div id="rev_slider" class="rev_slider fullscreenbanner">
                            <ul>
                                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
                                    <img src="images/slider/slide_bg_4.jpg" alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" />
                                    <div class="tp-caption rs-parallaxlevel-2"
                                         data-x="center" data-hoffset=""
                                         data-y="center" data-voffset="-80"
                                         data-width="['none','none','none','none']"
                                         data-height="['none','none','none','none']"
                                         data-type="image" data-responsive_offset="on"
                                         data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['inherit','inherit','inherit','inherit']"
                                         data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]"
                                         data-paddingleft="[0,0,0,0]">
                                        <img src="images/slider/slide_6.png" alt="" />
                                    </div>
                                    <div class="tp-caption rs-parallaxlevel-1"
                                         data-x="center" data-hoffset=""
                                         data-y="center" data-voffset="-80"
                                         data-width="['none','none','none','none']"
                                         data-height="['none','none','none','none']"
                                         data-type="image" data-responsive_offset="on"
                                         data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['inherit','inherit','inherit','inherit']"
                                         data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                                        <img src="images/slider/slide_7.png" alt="" />
                                    </div>
                                    <a class="tp-caption btn-2 hidden-xs" href="${ctx}/shop"
                                       data-x="['center','center','center','center']"
                                       data-y="['center','center','center','center']" data-voffset="['260','260','260','260']"
                                       data-width="['auto']" data-height="['auto']"
                                       data-type="button" data-responsive_offset="on"
                                       data-responsive="off"
                                       data-frames='[{"delay":0,"speed":300,"frame":"0","from":"opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"},{"frame":"hover","speed":"300","ease":"Power0.easeIn","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgb(95,189,116);bg:rgba(51, 51, 51, 0);"}]'
                                       data-textAlign="['inherit','inherit','inherit','inherit']"
                                       data-paddingtop="[16,16,16,16]" data-paddingright="[30,30,30,30]"
                                       data-paddingbottom="[16,16,16,16]" data-paddingleft="[30,30,30,30]">购买
                                    </a>
                                </li>
                                <li data-transition="fade" data-slotamount="default" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Slide">
                                    <img src="images/slider/slide_bg_5.jpg"  alt="" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat" data-bgparallax="off" class="rev-slidebg" />
                                    <div class="tp-caption rs-parallaxlevel-1"
                                         data-x="center" data-hoffset=""
                                         data-y="center" data-voffset="-120"
                                         data-width="['none','none','none','none']"
                                         data-height="['none','none','none','none']"
                                         data-type="image" data-responsive_offset="on"
                                         data-frames='[{"delay":0,"speed":1500,"frame":"0","from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","to":"o:1;","ease":"Power3.easeInOut"},{"delay":"wait","speed":300,"frame":"999","to":"opacity:0;","ease":"Power3.easeInOut"}]'
                                         data-textAlign="['inherit','inherit','inherit','inherit']"
                                         data-paddingtop="[0,0,0,0]" data-paddingright="[0,0,0,0]"
                                         data-paddingbottom="[0,0,0,0]" data-paddingleft="[0,0,0,0]">
                                        <img src="images/slider/slide_8.png" alt="" />
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section section-bg-1 section-cover pt-17 pb-3">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="mt-3 mb-3">
                            <img src="images/oranges.png" alt="" />
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="mb-1 section-pretitle default-left">Welcome to</div>
                        <h2 class="section-title mtn-2 mb-3">Eastphil Store</h2>
                        <h2 class="mb-4">
                            Eastphil伊思菲儿，原创鲜花，美好值得等待！
                        </h2>
                        <a class="organik-btn arrow" href="${ctx}/shop">购买</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="section section-bg-2 section-cover pt-14">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="text-center">
                            <div class="mb-1 section-pretitle white">热卖商品</div>
                            <h2 class="section-title mtn-2 mb-3">自然而开 花开为你</h2>
                            <p class="white mb-4">
                                三生三世，钟爱一生
                            </p>
                            <div class="countdown-wrap mb-4">
                                <div class="countdown-content">
                                    <div class="pl-clock countdown-bar" data-time="2017/10/10"></div>
                                </div>
                            </div>
                            <a class="organik-btn brown" href="${ctx}/shop">购买</a>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="text-center floating">
                            <img src="images/can.png" alt="" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section section-bg-3 pt-6 pb-6">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="text-center mb-1 section-pretitle">新品</div>
                        <h2 class="text-center section-title mtn-2">Eastphil Store</h2>
                        <div class="organik-seperator mb-9 center">
                            <span class="sep-holder"><span class="sep-line"></span></span>
                            <div class="sep-icon"><i class="organik-flower"></i></div>
                            <span class="sep-holder"><span class="sep-line"></span></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="organik-special-title">
                            <div class="number">01</div>
                            <div class="title">Romantic</div>
                        </div>
                        <p></p>
                        <div class="mb-8"></div>
                        <div class="organik-special-title">
                            <div class="number">02</div>
                            <div class="title">Love</div>
                        </div>
                        <p></p>
                    </div>
                    <div class="col-md-4">
                        <div class="mb-8"></div>
                    </div>
                    <div class="col-md-4">
                        <div class="organik-special-title align-right">
                            <div class="number">03</div>
                            <div class="title">Marry</div>
                        </div>
                        <p></p>
                        <div class="mb-8"></div>
                        <div class="organik-special-title align-right">
                            <div class="number">04</div>
                            <div class="title">Souvenir</div>
                        </div>
                        <p></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="section border-bottom mt-6 mb-5">
            <div class="container">
                <div class="row">
                    <div class="organik-process">
                        <div class="col-md-3 col-sm-6 organik-process-small-icon-step">
                            <div class="icon">
                                <i class="organik-delivery"></i>
                            </div>
                            <div class="content">
                                <div class="title">包邮</div>
                                <div class="text"></div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 organik-process-small-icon-step">
                            <div class="icon">
                                <i class="organik-hours-support"></i>
                            </div>
                            <div class="content">
                                <div class="title">全天营业</div>
                                <div class="text"></div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 organik-process-small-icon-step">
                            <div class="icon">
                                <i class="organik-credit-card"></i>
                            </div>
                            <div class="content">
                                <div class="title">安全放心</div>
                                <div class="text"></div>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 organik-process-small-icon-step">
                            <div class="icon">
                                <i class="organik-lettuce"></i>
                            </div>
                            <div class="content">
                                <div class="title">用心制作</div>
                                <div class="text"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="section pt-12 pb-9">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="text-center mb-1 section-pretitle">products</div>
                        <h2 class="text-center section-title mtn-2">热卖商品</h2>
                        <div class="organik-seperator center">
                            <span class="sep-holder"><span class="sep-line"></span></span>
                            <div class="sep-icon"><i class="organik-flower"></i></div>
                            <span class="sep-holder"><span class="sep-line"></span></span>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 p-0">
                        <div class="text-center">
                            <ul class="masonry-filter">
                                <li><a href="#" data-filter="" class="active">热卖</a></li>
                                <li><a href="#" data-filter=".dried">清新</a></li>
                                <li><a href="#" data-filter=".fruits">热恋</a></li>
                                <li><a href="#" data-filter=".vegetables">长情</a></li>
                                <li><a href="#" data-filter=".juice">感恩</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="product-grid masonry-grid-post">
                        <div class="col-md-3 col-sm-6 product-item masonry-item text-center juice">
                            <div class="product-thumb">
                                <a href="shop-detail.html">
                                    <div class="badges">
                                        <span class="hot">Hot</span>
                                        <span class="onsale">Sale!</span>
                                    </div>
                                    <img src="images/shop/shop_1.jpg" alt="" />
                                </a>
                                <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
									<span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
									</span>
									<span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
									<span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                </div>
                            </div>
                            <div class="product-info">
                                <a href="shop-detail.html">
                                    <h2 class="title">康乃馨</h2>
									<span class="price">
										<del>￥158.00</del>
										<ins>￥128.00</ins>
									</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 product-item masonry-item text-center fruits">
                            <div class="product-thumb">
                                <a href="shop-detail.html">
                                    <div class="badges">
                                        <span class="hot">Hot</span>
                                    </div>
                                    <img src="images/shop/shop_2.jpg" alt="" />
                                </a>
                                <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
									<span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
									</span>
									<span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
									<span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                </div>
                            </div>
                            <div class="product-info">
                                <a href="shop-detail.html">
                                    <h2 class="title">紫色花束</h2>
                                    <span class="price">￥99.00</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 product-item masonry-item text-center dried">
                            <div class="product-thumb">
                                <a href="shop-detail.html">
                                    <div class="badges">
                                        <span class="hot">Hot</span>
                                    </div>
                                    <img src="images/shop/shop_3.jpg" alt="" />
                                </a>
                                <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
									<span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
									</span>
									<span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
									<span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                </div>
                            </div>
                            <div class="product-info">
                                <a href="shop-detail.html">
                                    <h2 class="title">依恋</h2>
                                    <span class="price">￥88.00</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 product-item masonry-item text-center fruits">
                            <div class="product-thumb">
                                <a href="shop-detail.html">
                                    <img src="images/shop/shop_4.jpg" alt="" />
                                </a>
                                <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
									<span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
									</span>
									<span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
									<span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                </div>
                            </div>
                            <div class="product-info">
                                <a href="shop-detail.html">
                                    <h2 class="title">粉色玫瑰</h2>
                                    <span class="price">￥158.00</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 product-item masonry-item text-center vegetables">
                            <div class="product-thumb">
                                <a href="shop-detail.html">
                                    <div class="badges">
                                        <span class="hot">Hot</span>
                                    </div>
                                    <img src="images/shop/shop_5.jpg" alt="" />
                                </a>
                                <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
									<span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
									</span>
									<span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
									<span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                </div>
                            </div>
                            <div class="product-info">
                                <a href="shop-detail.html">
                                    <h2 class="title">粉百合</h2>
                                    <span class="price">￥128.00</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 product-item masonry-item text-center vegetables">
                            <div class="product-thumb">
                                <a href="shop-detail.html">
                                    <span class="outofstock"><span>Out</span>of stock</span>
                                    <img src="images/shop/shop_6.jpg" alt="" />
                                </a>
                                <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
									<span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
									</span>
									<span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
									<span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                </div>
                            </div>
                            <div class="product-info">
                                <a href="shop-detail.html">
                                    <h2 class="title">百合</h2>
                                    <span class="price">￥99.00</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 product-item masonry-item text-center vegetables">
                            <div class="product-thumb">
                                <a href="shop-detail.html">
                                    <img src="images/shop/shop_7.jpg" alt="" />
                                </a>
                                <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
									<span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
									</span>
									<span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
									<span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                </div>
                            </div>
                            <div class="product-info">
                                <a href="shop-detail.html">
                                    <h2 class="title">向日葵</h2>
                                    <span class="price">￥88.00</span>
                                </a>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 product-item masonry-item text-center fruits">
                            <div class="product-thumb">
                                <a href="shop-detail.html">
                                    <div class="badges">
                                        <span class="hot">Hot</span>
                                    </div>
                                    <img src="images/shop/shop_8.jpg" alt="" />
                                </a>
                                <div class="product-action">
									<span class="add-to-cart">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
									</span>
									<span class="wishlist">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
									</span>
									<span class="quickview">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
									</span>
									<span class="compare">
										<a href="#" data-toggle="tooltip" data-placement="top" title="Compare"></a>
									</span>
                                </div>
                            </div>
                            <div class="product-info">
                                <a href="shop-detail.html">
                                    <h2 class="title">红玫瑰</h2>
                                    <span class="price">￥199.00</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="loadmore-contain">
                        <a class="organik-btn small" href="${ctx}/shop"> 更多商品 </a>
                    </div>
                </div>
            </div>
        </div>--%>
        <jsp:include page="bottom.jsp"/>
   </div>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/modernizr-2.7.1.min.js"></script>
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.countdown.min.js"></script>
<script type="text/javascript" src="js/imagesloaded.pkgd.min.js"></script>
<script type="text/javascript" src="js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.init.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<script type="text/javascript" src="js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.video.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.slideanims.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.actions.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.layeranimation.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.kenburn.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.navigation.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.migration.min.js"></script>
<script type="text/javascript" src="js/extensions/revolution.extension.parallax.min.js"></script>
</body>
</html>