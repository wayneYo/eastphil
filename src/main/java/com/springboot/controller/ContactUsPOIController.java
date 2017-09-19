package com.springboot.controller;

import com.alibaba.fastjson.JSONArray;
import com.springboot.pojo.Products;
import com.springboot.pojo.User;
import com.springboot.service.ProductsService;
import com.springboot.tool.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017\9\17 0017.
 */
@Controller
public class ContactUsPOIController {
    
    @Autowired
    private ProductsService productsService;
    
    @RequestMapping("/poi-contact-us")
    public String printContactUsExcel() throws IOException {
        int count = 0;
        JSONArray ja = new JSONArray();
        List<Products> products = productsService.findProductsList();
        for (Products p: products) {
            ja.add(p);
        }

        Map<String,String> headMap = new LinkedHashMap<String ,String>();
        headMap.put("productName","品名");
        headMap.put("price","价格");
        headMap.put("size","尺寸");
        headMap.put("pnum","数量");
        headMap.put("category","分类");
        headMap.put("imgurl","图片");
        headMap.put("description","描述");
        headMap.put("presentation","简介");
        headMap.put("oldprice","原价");
        headMap.put("state","出售状态");
        headMap.put("crateTime","创建时间");

        String title = "产品汇总表";
        /*
        OutputStream outXls = new FileOutputStream("E://a.xls");
        System.out.println("正在导出xls....");
        Date d = new Date();
        ExcelUtil.exportExcel(title,headMap,ja,null,outXls);
        System.out.println("共"+count+"条数据,执行"+(new Date().getTime()-d.getTime())+"ms");
        outXls.close();*/
        //
    
        OutputStream outXlsx = new FileOutputStream("E://b.xlsx");
        System.out.println("正在导出xlsx....");
        Date d2 = new Date();
        ExcelUtil.exportExcelX(title,headMap,ja,null,0,outXlsx);
        System.out.println("共"+count+"条数据,执行"+(new Date().getTime()-d2.getTime())+"ms");
        outXlsx.close();
        
        return "home";
    
    }
    
}
