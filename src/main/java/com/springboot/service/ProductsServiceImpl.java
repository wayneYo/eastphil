package com.springboot.service;


import com.springboot.mapper.ProductsMapper;
import com.springboot.pojo.Category;
import com.springboot.pojo.Products;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by BIG on 2017/9/14.
 */
@Service
public class ProductsServiceImpl implements ProductsService {
    @Autowired
    private ProductsMapper productsMapper;
    @Autowired
    private ProductsService productsService;

    @Override
    public List<Products> findProductsList() {
        return productsMapper.findProductsList();
    }

    @Override
    public Products findProductsById(String productId) {
        return productsMapper.findProductsById(productId);
    }

    @Override
    public List<Products> findproductsListByUserId(String userId) {
        return productsMapper.findproductsListByUserId(userId);
    }

    @Override
    public Map<Products, Integer> addProductToWistListById(String productId, HttpSession session) throws Exception{
        //获取一个收藏
        Object wishListObj = session.getAttribute("wishList");
        Map<Products,Integer> wishList = null;
        if(wishListObj!=null){
            wishList = (Map<Products, Integer>) wishListObj;
        }else{
            ///创建一个收藏的session
            wishList = new HashMap<Products,Integer>();
            session.setAttribute("wishList",wishList);
        }
        //判断产品是否在愿望单中已经存在，如果存在，提示用户已经收藏，跳转回shop页面
        //查询出商品的全部信息
        Products product = productsService.findProductsById(productId);
        if(wishList.containsKey(product)){
            throw new Exception("该产品已加入愿望单!");
        }else{
            //将产品放进收藏的session域
            wishList.put(product,1);
        }

        return wishList;
    }

    @Override
    public List<Products> findProductsSearch(String s) {
        return productsMapper.findProductsSearch(s);
    }

    //根据分类展示商品
    @Override
    public List<Products> findProductsCategories(String cateId) {
        return productsMapper.findProductsCategories(cateId);
    }

    @Override
    public List<Category> findCategoriesListList() {
        return productsMapper.findCategoriesListList();
    }

    @Override
    public List<String> findImgurlList(String productId) {
        return productsMapper.findImgurlList(productId);
    }
    //根据价格查询商品
    @Override
    public List<Products> findProductListOrderByMoney() {
        return productsMapper.findProductListOrderByMoney();
    }

    @Override
    public List<Products> findProductListOrderByNum() {
        return productsMapper.findProductListOrderByNum();
    }

    //按照价格升序
    @Override
    public List<Products> findproductsOrderPriceList() {
        return productsMapper.findproductsOrderPriceList();
    }

    //按照价格降序
    @Override
    public List<Products> findproductsOrderPriceDescList() {
        return productsMapper.findproductsOrderPriceDescList();
    }

    //按照商品受欢迎程度
    @Override
    public List<Products> findProductsOrderByOrders() {
        return productsMapper.findProductsOrderByOrders();
    }
    //按照入库时间排序
    @Override
    public List<Products> findProductsOrderByTime() {
        return productsMapper.findProductsOrderByTime();
    }

	@Override
    public List<Products> findProductsListByMinPriceAndMaxPrice(String minPrice, String maxPrice) {
        return productsMapper.findProductsListByMinPriceAndMaxPrice(minPrice, maxPrice);
    }

    @Override
    public List<Products> findProductsListByPage(Integer page, Integer pageSize) {
        return productsMapper.findProductsListByPage(page, pageSize);
    }

    @Override
    public Integer findProductCount() {
        return productsMapper.findProductCount();
    }

    @Override
    public Integer findProductsListByMinPriceAndMaxPriceCount(String min_price, String max_price) {
        return productsMapper.findProductsListByMinPriceAndMaxPriceCount(min_price, max_price);
    }

}
