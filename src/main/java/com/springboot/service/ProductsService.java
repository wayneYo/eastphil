package com.springboot.service;


import com.springboot.pojo.Category;
import com.springboot.pojo.Products;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by BIG on 2017/9/14.
 */
public interface ProductsService {

    public List<Products> findProductsList();

    public Products findProductsById(String productId);

    public List<Products> findproductsListByUserId(String userId);

    public Map<Products,Integer> addProductToWistListById(String productId, HttpSession session) throws Exception;

    public List<Products> findProductsSearch(String s);

   public List<Products> findProductsCategories(String cateId);

    public List<Category> findCategoriesListList();

    public List<String> findImgurlList(String productId);

    public List<Products> findProductListOrderByMoney();

   public  List<Products> findProductListOrderByNum();
    //按照价格升序
    public List<Products> findproductsOrderPriceList();
    //按照价格降序
    public List<Products> findproductsOrderPriceDescList();
    //按照商品受欢迎程度
    public List<Products> findProductsOrderByOrders();
    //按照入库时间排序
    public List<Products> findProductsOrderByTime();
	
	//根据价格区间删选商品
    List<Products> findProductsListByMinPriceAndMaxPrice(String min_price, String max_price);
    //查询第几页的数据
    List<Products> findProductsListByPage(Integer page, Integer pageSize);
    //查询总的商品种类数
    Integer findProductCount();

    //查询该符合价格的花数量
    Integer findProductsListByMinPriceAndMaxPriceCount(String min_price, String max_price);
}
