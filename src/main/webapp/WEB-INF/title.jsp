<%@ page import="com.springboot.pojo.Products" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="base.jsp" %>

<div class="topbar">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="topbar-text">
                    <span>工作时间：</span>
                    <span>周一到周日: 08AM-06PM</span>
                    <span id="time">
                        <script>
                            document.getElementById('time').innerHTML =
                                    new Date().toLocaleString()+ ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
                            setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
                                    1000);
                        </script>
                    </span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="topbar-menu">
                    <ul class="topbar-menu" <c:if test="${!empty user}">hidden="hidden"</c:if>>
                        <li><a href="${ctx}/login">登录</a></li>
                        <li><a href="${ctx}/regist">注册</a></li>
                    </ul>
                    <ul class="topbar-menu" <c:if test="${empty user}">hidden="hidden"</c:if>>
                        <li>您好：${user.username}</li>
                        <li><a href="${ctx}/loginOut">退出</a></li>
                        <li <c:if test="${user.userInfo.userLevel != 2}">style="display: none"</c:if> ><a href="${ctx}/back/saleList">后台管理系统</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<header id="header" class="header header-desktop header-2">
    <div class="top-search">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <form class="form-search" method="post" action="${ctx}/arch">
                        <input type="search" class="top-search-input" name="s" placeholder="您想搜索什么呢?" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <a href="#" id="logo">
                    <img class="logo-image" src="images/logo.png" alt="Organik Logo" />
                </a>
            </div>
            <div class="col-md-9">
                <div class="header-right">
                    <nav class="menu">
                        <ul class="main-menu">
                            <li><a href="${ctx}/home">花鲜物语</a></li>
                            <li><a href="${ctx}/shop">花之盛宴</a></li>
                            <li><a href="${ctx}/cart">我的花房</a></li>
                            <li><a href="${ctx}/checkout">结算中心</a></li>
                            <li><a href="${ctx}/contact-us">联系我们</a></li>
                            <li><a href="${ctx}/user-center">用户中心</a></li>
                        </ul>
                    </nav>
                    <div class="btn-wrap">
                        <div class="mini-cart-wrap">
                            <div class="mini-cart">
                                <%
                                    //为购物车商品数量赋值
                                    int size;
                                    Map<Products,Integer> cart = ((Map<Products,Integer>)session.getAttribute("Cart"));
                                    if (cart == null || cart.isEmpty()) {
                                        size = 0;
                                    } else {
                                        size = cart.size();
                                    }
                                %>
                                <div class="mini-cart-icon" data-count="<%= size %>">
                                    <i class="ion-bag"></i>
                                </div>
                            </div>
                            <div class="widget-shopping-cart-content">
                                <ul class="cart-list">
                                    <%-- 总费用--%>
                                        <table class="table shop-cart" >
                                            <tbody>
                                    <c:set var="money" value="0"/>
                                    <c:set var="cart" value="<%= cart %>"/>
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
                                            <td>
											<span id="prods_buynum">
												<input id="${entry.key.productId}" style="width: 50px; border: hidden" class="buyNumInp1" type="text" value="${entry.value}" />
											</span>
                                            </td>
                                            <td class="product-subtotal">
                                                <span class="amount">￥${entry.key.price * entry.value}</span>
                                            </td>
                                            <c:set var="money" value="${money+entry.key.price * entry.value}"/>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                </ul>
                                <p class="total">
                                    <strong>总计:</strong>
                                    <span class="amount">￥${money}</span>
                                </p>
                                <p class="buttons">
                                    <a href="${ctx}/cart" class="view-cart">查看花房</a>
                                    <a href="${ctx}/toCheckout" class="checkout">前往结算</a>
                                </p>
                            </div>
                        </div>
                        <div class="top-search-btn-wrap">
                            <div class="top-search-btn">
                                <a href="javascript:void(0);">
                                    <i class="ion-search"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>