package com.springboot.controller;


import com.springboot.pojo.Category;
import com.springboot.pojo.Products;
import com.springboot.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by BIG on 2017/9/13.
 */
@Controller
public class ProductController {
    @Autowired
    private ProductsService productsService;
    //查询商品详情
    @RequestMapping("/shop-detail")
    public String toshopDetail(String productId,Model model){
        Products prod = productsService.findProductsById(productId);
        List<Category> categoriesList = productsService.findCategoriesListList();
        //根据价格查询商品
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        //查询出商品的小图
        List<String> imgurlList = productsService.findImgurlList(productId);
        //根据商品库存查询商品
        List<Products> productsNumList = productsService.findProductListOrderByNum();
        model.addAttribute("prod",prod);
        model.addAttribute("categoriesList",categoriesList);
        model.addAttribute("imgurlList",imgurlList);
        model.addAttribute("productsMoneyList",productsMoneyList);
        model.addAttribute("productsNumList",productsNumList);
        return "/shop-detail";
    }


    //商品搜索
    @RequestMapping("/search")
    public String toSearch(HttpServletRequest request, Model model){
        String s = request.getParameter("s");
        s = "%"+s+"%";
        List<Products> productsList = productsService.findProductsSearch(s);
        model.addAttribute("productsList",productsList);

        //查询全部的分类名称
        List<Category> categoriesList = productsService.findCategoriesListList();
        //根据价格查询商品
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("categoriesList",categoriesList);
        model.addAttribute("productsMoneyList",productsMoneyList);

        return "/shop";
    }
    //根据分类展示商品
    @RequestMapping("/categories")
    public String toSearch(String cateId, Model model){
        List<Category> categoriesList = productsService.findCategoriesListList();
        //根据cateid查询全部的商品
        List<Products> productsList = productsService.findProductsCategories(cateId);
        model.addAttribute("productsList",productsList);
        model.addAttribute("categoriesList",categoriesList);
        //根据价格查询商品
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("productsMoneyList",productsMoneyList);
        return "/shop";
    }




}
