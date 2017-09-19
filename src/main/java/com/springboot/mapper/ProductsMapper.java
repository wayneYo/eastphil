package com.springboot.mapper;

import com.springboot.pojo.Category;
import com.springboot.pojo.Products;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by BIG on 2017/9/14.
 */
public interface ProductsMapper {

    public List<Products> findProductsList();

    public Products findProductsById(String productId);

    public List<Products> findproductsListByUserId(String userId);

    public  List<Products> findProductsSearch(String s);

    public List<Products> findProductsCategories(String cateId);

    public  List<Category> findCategoriesListList();

    public List<String> findImgurlList(String productId);

    public  List<Products> findProductListOrderByMoney();

    public  List<Products> findProductListOrderByNum();
    //按照价格升序
    public List<Products> findproductsOrderPriceList();
    //按照价格降序
    public List<Products> findproductsOrderPriceDescList();
    //按照受欢迎排序
    public List<Products> findProductsOrderByOrders();
    //按照入库时间排序
    public List<Products> findProductsOrderByTime();
	
	//根据价格区间删选商品
    List<Products> findProductsListByMinPriceAndMaxPrice(@Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice);

    //查询第几页的数据
    /**
     *
     * @param page 第几页 从1开始
     * @param pageSize 每页多少条数据
     * @return
     */
    List<Products> findProductsListByPage(@Param("page") Integer page, @Param("pageSize") Integer pageSize);
    //查询鲜花的种类数量
    Integer findProductCount();

    Integer findProductsListByMinPriceAndMaxPriceCount(@Param("minPrice") String minPrice, @Param("maxPrice") String maxPrice);
}
