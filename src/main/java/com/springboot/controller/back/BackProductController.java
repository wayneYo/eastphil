package com.springboot.controller.back;


import com.alibaba.fastjson.JSONArray;
import com.springboot.pojo.*;
import com.springboot.service.CategoryService;
import com.springboot.service.ProductService;
import com.springboot.tool.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by BIG on 2017/9/13.
 */
@Controller
@RequestMapping("/back")
public class BackProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/product")
    public String findAllProduct(Model model) {
        List<Products> productList = productService.findAllProduct();
        model.addAttribute("productList",productList);
        return "/back/productList";
    }

    @RequestMapping("/ProductView")
    public String toViewProduct(String productId,Model model) {
        Products product = productService.findProductById(productId);
        model.addAttribute("product",product);
        return "/back/productView";
    }

   @RequestMapping("/ProductCreate")
    public String toCreateProduct(Model model) {
       List<Category> categoryList = categoryService.findAllCate();
       model.addAttribute("categoryList",categoryList);
       return "/back/productCreate";
   }
    @RequestMapping("/saveAddProduct")
    public String saveAddProduct(Products product) {
        productService.saveAddProduct(product);
        return "/back/productView";
    }
    @RequestMapping("/ProductUpdate")
    public String toUpdateProduct(String productId,Model model) {
        List<Category> categoryList = categoryService.findAllCate();
        model.addAttribute("categoryList",categoryList);
        return "/back/productUpdate";
    }
    @RequestMapping("/saveUpdateProduct")
    public String saveUpdateProduct(Products product){
        productService.saveUpdateProduct(product);
        return "/back/productList";
    }
    @RequestMapping("/ProductDelete")
    public String deleteProduct(String productId) {
        productService.deleteByProductId(productId);
        return "/back/productList";
    }


    //打印商品管理列表数据
    @RequestMapping("/downloadProductList")
    public void downloadProductList(HttpServletResponse response) throws IOException {
        List<Products> productList = productService.findAllProduct();
        String title = "商品列表";

        JSONArray ja = new JSONArray();
        int index = 0;
        for (Products product : productList){
            index ++;

            ProductDownloadModel model = new ProductDownloadModel();
            model.setCateName(product.getCategory().getCateName());
            model.setPnum(product.getPnum());
            model.setPrice(product.getPrice());
            model.setProductId(product.getProductId());
            model.setProductName(product.getProductName());

            ja.add(model);
        }

        Map<String,String> headMap = new LinkedHashMap<String,String>();
        headMap.put("productId","商品ID");
        headMap.put("cateName","商品种类");
        headMap.put("price","商品价格");
        headMap.put("productName","商品名称");
        headMap.put("pnum","库存数量");


        OutputStream outXlsx = new FileOutputStream("d://商品列表.xlsx");
        System.out.println("正在导出xlsx....");
        Date d2 = new Date();
        ExcelUtil.downloadExcelFile(title, headMap, ja, response);
        System.out.println("共"+index+"条数据,执行"+(new Date().getTime()-d2.getTime())+"ms");
        outXlsx.close();
    }

}
