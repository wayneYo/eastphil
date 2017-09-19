package com.springboot.controller;

import com.springboot.pojo.Products;
import com.springboot.service.CartService;
import com.springboot.service.ProductsService;
import com.springboot.tool.MapRemoveNullUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**购物车操作
 * Created by BIG on 2017/9/14.
 */
@Controller
public class CartController {
    @Autowired
    private ProductsService productsService;
    @Autowired
    private CartService cartService;

    //添加商品到购物车
    @RequestMapping("addToCart")
    public String addToCart(String productId, Model model, HttpSession httpSession){
        Products product = productsService.findProductsById(productId);
        Map<Products,Integer> cart = (Map<Products,Integer>)cartService.insertCartInfo(product, httpSession);
        MapRemoveNullUtil.removeNullEntry(cart);
        model.addAttribute("cart",cart);
        return  "cart";
    }

    //删除购物车中单条商品
    @RequestMapping("removeCartProduct")
    public String removeCartProduct(Model model, HttpServletRequest request, HttpSession httpSession) {
        String productId = request.getParameter("productId");
        Products product = productsService.findProductsById(productId);
        Map<Products,Integer> cart = (Map<Products,Integer>)cartService.removeCartInfo(product, httpSession);
        httpSession.setAttribute("Cart", cart);
        model.addAttribute("cart",cart);
        model.addAttribute("cartSize", cart.size());
        return "cart";
    }


    //编辑购物车商品数量
    @RequestMapping("editCartProduct")
    public String editCartProduct(HttpServletRequest request, HttpSession httpSession, Model model) {
        String productId = request.getParameter("productId");
        String bnum = request.getParameter("bnum");
        Products product = productsService.findProductsById(productId);
        cartService.editCartInfo(product, bnum, httpSession);
        return "redirect:/cart";
    }
}
