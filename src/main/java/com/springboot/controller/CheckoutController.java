package com.springboot.controller;

import com.springboot.pojo.Orders;
import com.springboot.pojo.Products;
import com.springboot.pojo.Receiveinfo;
import com.springboot.pojo.User;
import com.springboot.service.CheckoutService;
import com.springboot.tool.DateFormat;
import com.springboot.tool.MapRemoveNullUtil;
import com.springboot.tool.yeepay.PaymentUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

/**
 * 结算中心
 */
@Controller
public class CheckoutController {

    @Autowired
    private CheckoutService checkoutService;

    //跳转到结算中心
    @RequestMapping("toCheckout")
    public String toCheckout(HttpSession session, Model model) {
        Object cartObj = session.getAttribute("Cart");
        Map<Products,Integer> cart = null;
        if (cartObj != null) {
            cart = (Map<Products,Integer>)cartObj;
            MapRemoveNullUtil.removeNullEntry(cart); //将键值对为空的删除掉
            if (cart.isEmpty()) {
                model.addAttribute("errorInfo", "购物车为空，请前往商品页面添加商品！");
                return "cart";
            } else {
                model.addAttribute("cart", cart);
                model.addAttribute("orderId", System.currentTimeMillis()+""+(int)(Math.random() * 100000));
                model.addAttribute("ordertime", DateFormat.simpleDate(new Date()));
                //添加订单后购物车中商品清掉
                session.removeAttribute("cart");
                return "checkout";
            }
        } else {
            model.addAttribute("errorInfo", "购物车为空，请前往商品页面添加商品！");
            return "cart";
        }
    }

    //判断何种方式付款及跳转相应页面
    @RequestMapping("paymentMethod")
    public String paymentMethod(String orderId, String receiveName, String province, String city, String addDetail,
                                String phonenum, String email, String ordertime, String money, String paymentMethod,
                                HttpSession session, HttpServletResponse response, Model model) throws IOException, ParseException {
        //Orders order, Receiveinfo receiveinfo,
        Object userObj = session.getAttribute("user");

        //session没有登录用户则返回
        if (userObj == null) {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            //用UTF-8转码，而不是用默认的ISO8859
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            //提示登录
            writer.println("<script>alert('请登入用户')"+ "</script>");
            //跳转到登录页面
            writer.println("<script>window.location.href=\"/login\";</script>");
            writer.flush();
            writer.close();
            return null;
        }

        User user = (User) userObj;

        //如果订单未添加商品则跳转到购物车页面。。
        if(ordertime == null || ordertime == "") {
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter writer = response.getWriter();
            writer.println("<script>alert('订单中无商品，点击跳转到我的花房页面')"+ "</script>");
            writer.println("<script>window.location.href=\"/cart\";</script>");
            writer.flush();
            writer.close();
            return null;
        }
        //封装收货人数据
        Receiveinfo receiveinfo = new Receiveinfo();
        receiveinfo.setReceiveId(UUID.randomUUID().toString());
        receiveinfo.setOrderId(orderId);
        receiveinfo.setUserId(user.getUserId());
        receiveinfo.setReceiveName(receiveName);
        receiveinfo.setProvince(province);
        receiveinfo.setCity(city);
        receiveinfo.setAddDetail(addDetail);
        receiveinfo.setPhonenum(phonenum);
        receiveinfo.setEmail(email);
        receiveinfo.setPaymentMethod(paymentMethod);
        session.setAttribute("receiveinfo", receiveinfo);

        //封装订单数据
        Orders order = new Orders();
        order.setOrderId(orderId);
        order.setMoney(Double.parseDouble(money));
        order.setOrdertime(DateFormat.dateFormat(ordertime));
        order.setUserId(user.getUserId());
        order.setReceiveId(receiveinfo.getReceiveId());
        session.setAttribute("order", order);

        //添加订单
        checkoutService.addReceive(receiveinfo);
        //添加收货信息
        checkoutService.addOrder(order);
        //添加订单商品关联表条目
        checkoutService.addOrderitem(order, session);

        //订单号传递到页面
        model.addAttribute("orderId",orderId);

        //判断支付方式并跳转相应页面
        if ("yeepay".equals(paymentMethod)){
            return "paymentMethod/yeepay";
        } else if ("unionpay".equals(paymentMethod)) {
            return "paymentMethod/unionpay";
        } else if ("cod".equals(paymentMethod)) {
            return "paymentMethod/cod";
        } else if ("alipay".equals(paymentMethod)) {
            return "paymentMethod/alipay";
        }else {
            return "paymentMethod/wechatpay";
        }

    }

    //支付页面
    @RequestMapping("pay")
    public String pay(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        //1.准备请求需要的参数
        String p0_Cmd = "Buy";//业务类型
        String p1_MerId = "10001126856";//商户编号
        Orders order = (Orders) session.getAttribute("order");
        String p2_Order = order.getOrderId();//订单编号
        String p3_Amt = String.valueOf(order.getMoney());
        //支付金额，正式使用时订单金额需要根据订单id从数据库中查询
		/*
		OrderService orderService = BasicFactory.getFactory().getInstance(OrderService.class);
		Order order = orderService.findOrderById(p2_Order);
		String p3_Amt = order.getMoney()+"";
		*/
        //交易币种
        String p4_Cur = "CNY";
        String p5_Pid = "";//商品名称
        String p6_Pcat = "";//商品种类
        String p7_Pdesc = "";//商品描述
        //回调的Servlet,商户接收支付成功数据的地址
        String p8_Url = "http://localhost:8090/yeepayCallBack";
        String p9_SAF = "";//送货地址
        String pa_MP = "";//商户扩展信息
        String pd_FrpId = request.getParameter("pd_FrpId");//支付通道编码
        String pr_NeedResponse = "1";//应答机制
        //使用提供的工具类和密钥，对以上参数进行加密
        String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url,
                p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl");//签名数据
        //2.将以上参数保存到request作用域中
        request.setAttribute("pd_FrpId", pd_FrpId);
        request.setAttribute("p0_Cmd", p0_Cmd);
        request.setAttribute("p1_MerId", p1_MerId);
        request.setAttribute("p2_Order", p2_Order);
        request.setAttribute("p3_Amt", p3_Amt);
        request.setAttribute("p4_Cur", p4_Cur);
        request.setAttribute("p5_Pid", p5_Pid);
        request.setAttribute("p6_Pcat", p6_Pcat);
        request.setAttribute("p7_Pdesc", p7_Pdesc);
        request.setAttribute("p8_Url", p8_Url);
        request.setAttribute("p9_SAF", p9_SAF);
        request.setAttribute("pa_MP", pa_MP);
        request.setAttribute("pr_NeedResponse", pr_NeedResponse);
        request.setAttribute("hmac", hmac);
        return "paymentMethod/confirm";
    }

    @RequestMapping("yeepayCallBack")
    public void callBack(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException {
        //1.接受参数
        //商户编号
        String p1_MerId = request.getParameter("p1_MerId");
        //业务类型
        String r0_Cmd = request.getParameter("r0_Cmd");
        //支付结果
        String r1_Code = request.getParameter("r1_Code");
        //易宝支付交易流水号
        String r2_TrxId = request.getParameter("r2_TrxId");
        //支付金额
        String r3_Amt = request.getParameter("r3_Amt");
        //交易币种
        String r4_Cur = request.getParameter("r4_Cur");
        //商品名称
        String r5_Pid = request.getParameter("r5_Pid");
        //商户订单号
        String r6_Order = request.getParameter("r6_Order");
        //易宝支付会员ID
        String r7_Uid = request.getParameter("r7_Uid");
        //商户扩展信息
        String r8_MP = request.getParameter("r8_MP");
        //交易结果返回类型
        String r9_BType = request.getParameter("r9_BType");
        //支付通道编码
        String rb_BankId = request.getParameter("rb_BankId");
        //银行订单号
        String ro_BankOrderId = request.getParameter("ro_BankOrderId");
        //支付成功时间
        String rp_PayDate = request.getParameter("rp_PayDate");
        //神州行充值卡序列号
        String rq_CardNo = request.getParameter("rq_CardNo");

        //交易结果通知时间
        String ru_Trxtime = request.getParameter("ru_Trxtime");
        //签名数据
        String hmac = request.getParameter("hmac");
        //2.检验数据数据是否被修改 true表示未被修改，false表示被修改
        boolean isNoUpdate = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid,
                r8_MP, r9_BType, "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl");
        if (isNoUpdate) {
            //判断重定向过来的还是点对点通讯过来的
            if ("1".equals(r9_BType)) {//重定向
                response.getWriter().write("支付操作已受理,支付结果需等待进一步通知的消息");
            } else if ("2".equals(r9_BType)&&"1".equals(r1_Code)) {
                //修改订单的支付状态
                Orders order = (Orders) session.getAttribute("order");
                checkoutService.updateOrdersPaystate(order.getOrderId());

                //更新商品库存
                checkoutService.updateProducts(order, session);

                //删除session中“order”
                session.removeAttribute("order");

                //响应给第三方支付平台success
                response.getWriter().write("success");
            }
        } else {
            System.out.println("数据被篡改");
            //将来可以转发或者重定向到数据被篡改的页面
        }
    }

}
