package com.springboot.controller.back;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.springboot.service.CategoryService;
import com.springboot.service.ProductService;
import com.springboot.service.UserService;
import com.springboot.tool.DateTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.*;


/**
 * Created by BIG on 2017/9/14.
 */
@Controller
@RequestMapping("/back")
public class BackSaleListController {
    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;

    @RequestMapping("/saleList")
    public String toBackSale(Model model) {

        //准备第一张数据报表的数据
        Integer mansCount = userService.findAllManUser();
        Integer womensCount = userService.findAllWomenUser();
        Integer otherCount = userService.findAllUndifidUser();


        Date date = new Date();
        Map toolMap =  DateTool.getDates(date,6);
        //准备第二张表的横坐标数据
        String[] chartTwoKey = (String[]) toolMap.get("nameParam");
        List<String> chartTwoKey1 = new ArrayList<String>();
        for(int k=0;k<chartTwoKey.length;k++){
            chartTwoKey1.add(chartTwoKey[k]);
        }
        Date[] dates = (Date[]) toolMap.get("dateParam");

        //准备第二张表的纵坐标数据
        Integer[] chartTwoValue = new Integer[6];
        for(int i=0;i<chartTwoValue.length;i++){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String date1 = sdf.format(dates[i]);
            String date2 = sdf.format(dates[i+1]);
            System.out.println(i+":"+date2);

            chartTwoValue[i] = userService.findMonthSale(date1,date2);
        }

        List<Integer> chartTwoValue1 = new ArrayList<Integer>();
        for(int j=0;j<chartTwoValue.length;j++){
            chartTwoValue1.add(chartTwoValue[j]);
        }

        ObjectMapper om = new ObjectMapper();

        //将准备好的数据转化成json串
        String chartTwoJsonKey = null;
        String chartTwoJsonValue = null;
        try {
            chartTwoJsonKey=om.writeValueAsString(chartTwoKey1);
            chartTwoJsonValue= om.writeValueAsString(chartTwoValue1) ;
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        //将准备好的数据传入页面中
        Map chartTwoMap = new HashMap();
        chartTwoMap.put("key",chartTwoJsonKey);
        chartTwoMap.put("value",chartTwoJsonValue);
        model.addAttribute("chartTwoMap",chartTwoMap);
        model.addAttribute("mansCount",mansCount);
        model.addAttribute("womensCount",womensCount);
        model.addAttribute("otherCount",otherCount);

        return "/back/saleList";
    }


    //跳转到销售榜单
    @RequestMapping("/saleList2")
    public String toCateSaleView(Model model) {
        Integer fmCate = categoryService.findFMcate();
        Integer fdCate = categoryService.findFDcate();
        Integer lvCate = categoryService.findLVcate();
        Integer odCate = categoryService.findODcate();
        model.addAttribute("fmCate",fmCate);
        model.addAttribute("fdCate",fdCate);
        model.addAttribute("lvCate",lvCate);
        model.addAttribute("odCate",odCate);
        Integer ONum = productService.findOhundredNum();
        Integer TNum = productService.findThundredNum();
        Integer THNum = productService.findTHhundredNum();
        Integer FNum = productService.findFhundredNum();
        Integer FVNum = productService.findFVhundredNum();
        Integer SNum = productService.findShundredNum();
        Integer BNum = productService.findBhundredNum();
        model.addAttribute("ONum",ONum);
        model.addAttribute("TNum",TNum);
        model.addAttribute("THNum",THNum);
        model.addAttribute("FNum",FNum);
        model.addAttribute("FVNum",FVNum);
        model.addAttribute("SNum",SNum);
        model.addAttribute("BNum",BNum);

        return "/back/saleList2";
    }
}
