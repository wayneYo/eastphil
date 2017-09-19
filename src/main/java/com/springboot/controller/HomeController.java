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
 * Created by BIG on 2017/9/13.
 */
@Controller
public class HomeController {
    @Autowired
    private ProductsService productsService;

    @RequestMapping("/home")
    public String toHome(){
        return "home";
    }

    //跳转到商店
    @RequestMapping("/shop")
    public String toShop(Model model){
        //查询全部的分类名称
        List<Category> categoriesList = productsService.findCategoriesListList();
        //查询总的数据条数
        Integer productCount = productsService.findProductCount();
        //默认 一页9条数据
        List<Products> productsList = productsService.findProductsListByPage(0, 9);
        //根据价格查询商品
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("productsList",productsList);
        model.addAttribute("categoriesList",categoriesList);
        //设置一共有多少页 默认一页9条数据 有多少页就是 总的鲜花种类/9
        Integer pageCount = (productCount%9==0)?(productCount/9-1):(productCount/9);
        model.addAttribute("pageCount",pageCount);
        //当前是第几页
        model.addAttribute("pageNum", 0);
        model.addAttribute("productsMoneyList",productsMoneyList);
        return "shop";
    }

    //跳转到购物车
    @RequestMapping("cart")
    public String toCart(){
        return "redirect:addToCart";
    }
    //跳转到结算中心
    @RequestMapping("checkout")
    public String toCheckOut(){
        return "checkout";
    }


    //跳转到联系我们
    @RequestMapping("contact")
    public String toContact(){
        return "contact-us";
    }
    //按照价格升序
    @RequestMapping("/orderByPrice")
    public String orderByPrice(Model model){
        List<Category> categoriesList = productsService.findCategoriesListList();
        model.addAttribute("categoriesList",categoriesList);
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("productsMoneyList",productsMoneyList);
        List<Products> productsList = productsService.findproductsOrderPriceList();
        model.addAttribute("productsList",productsList);

        //查询总的数据条数
        Integer productCount = productsService.findProductCount();
        //设置一共有多少页 默认一页9条数据 有多少页就是 总的鲜花种类/9
        Integer pageCount = (productCount%9==0)?(productCount/9-1):(productCount/9);
        model.addAttribute("pageCount",pageCount);
        //当前是第几页
        model.addAttribute("pageNum", 0);

        return "/shop";
    }
    //按照价格降序
    @RequestMapping("/orderByPriceDesc")
    public String orderByPriceDesc(Model model){
        List<Category> categoriesList = productsService.findCategoriesListList();
        model.addAttribute("categoriesList",categoriesList);
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("productsMoneyList",productsMoneyList);
        List<Products> productsList = productsService.findproductsOrderPriceDescList();
        model.addAttribute("productsList",productsList);

        //查询总的数据条数
        Integer productCount = productsService.findProductCount();
        //设置一共有多少页 默认一页9条数据 有多少页就是 总的鲜花种类/9
        Integer pageCount = (productCount%9==0)?(productCount/9-1):(productCount/9);
        model.addAttribute("pageCount",pageCount);
        //当前是第几页
        model.addAttribute("pageNum", 0);

        return "/shop";
    }

    //按照商品受欢迎程度
    @RequestMapping("orderBy")
    public String orderByOrders(Model model){
        List<Category> categoriesList = productsService.findCategoriesListList();
        model.addAttribute("categoriesList",categoriesList);
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("productsMoneyList",productsMoneyList);

        List<Products> productsList = productsService.findProductsOrderByOrders();
        model.addAttribute("productsList",productsList);

        //查询受欢迎程度 总的数据条数
        Integer productCount = productsService.findProductCount();
        //设置一共有多少页 默认一页9条数据 有多少页就是 总的鲜花种类/9
        Integer pageCount = (productCount%9==0)?(productCount/9-1):(productCount/9);
        model.addAttribute("pageCount",pageCount);
        //当前是第几页
        model.addAttribute("pageNum", 0);
        return "/shop";
    }
    //按照入库时间排序
    @RequestMapping("orderByTime")
    public String orderByTime(Model model){
        List<Category> categoriesList = productsService.findCategoriesListList();
        model.addAttribute("categoriesList",categoriesList);
        List<Products> productsMoneyList = productsService.findProductListOrderByMoney();
        model.addAttribute("productsMoneyList",productsMoneyList);
        List<Products> productsList = productsService.findProductsOrderByTime();
        model.addAttribute("productsList",productsList);
        return "/shop";
    }
    //用户中心
    //@RequestMapping("/user-center")
    public String userCenter(){
        return "user-center";
    }

}
