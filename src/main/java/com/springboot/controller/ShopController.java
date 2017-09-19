package com.springboot.controller;

import com.springboot.pojo.Category;
import com.springboot.pojo.Products;
import com.springboot.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by BIG on 2017/9/15.
 */
@Controller
public class ShopController {
    @Autowired
    private ProductsService productsService;

    //价格删选点击事件
    @RequestMapping("/updatePrice")
    public String updatePrice(Model model, String min_price, String max_price){
        List<Products> productsList = productsService.findProductsListByMinPriceAndMaxPrice(min_price, max_price);
        //查询全部的分类名称
        List<Category> categoriesList = productsService.findCategoriesListList();
        //查询总的数据条数
        Integer productCount =productsService.findProductsListByMinPriceAndMaxPriceCount(min_price, max_price);

        model.addAttribute("productsList",productsList);
        model.addAttribute("categoriesList",categoriesList);
        //设置一共有多少页 默认一页9条数据 有多少页就是 总的鲜花种类/9
        Integer pageCount = (productCount%9==0)?(productCount/9-1):(productCount/9);
        model.addAttribute("pageCount",pageCount);
        //当前是第几页
        model.addAttribute("pageNum", 0);
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("productsMoneyList",productsMoneyList);
        return "shop";
    }

    //第几页点击事件
    @RequestMapping("/page")
    public String page(Integer pageNum, Model model){
        List<Products> productsList = productsService.findProductsListByPage(pageNum*9, 9);
        //查询全部的分类名称
        List<Category> categoriesList = productsService.findCategoriesListList();
        //查询总的数据条数
        Integer productCount = productsService.findProductCount();
        model.addAttribute("productsList",productsList);
        model.addAttribute("categoriesList",categoriesList);
        //设置一共有多少页 默认一页9条数据 有多少页就是 总的鲜花种类/9
        Integer pageCount = (productCount%9==0)?(productCount/9-1):(productCount/9);
        model.addAttribute("pageCount",pageCount);
        //当前是第几页
        model.addAttribute("pageNum", pageNum);
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("productsMoneyList",productsMoneyList);
        return "shop";
    }
}
