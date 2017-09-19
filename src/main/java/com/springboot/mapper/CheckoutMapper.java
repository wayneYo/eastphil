package com.springboot.mapper;

import com.springboot.pojo.Orders;
import com.springboot.pojo.Receiveinfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

/**结算
 * Created by BIG on 2017/9/16.
 */
public interface CheckoutMapper {
    //添加订单
    public void addOrder(Orders order);

    //添加收货信息
    public void addReceive(Receiveinfo receive);

    //添加订单商品关联表条目
    public void addOrderitem(@Param(value = "order") Orders order, @Param(value = "productId") String productId, @Param(value = "buynum") String buynum);

    //更新商品库存
    public void updateProducts(@Param(value = "order") Orders order, @Param(value = "productId") String productId, @Param(value = "buynum") String buynum);

    //修改订单的支付状态
    void updateOrdersPaystate(String orderId);

    //删除指定订单id的订单
    @Delete("delete from orders where order_id = #{orderId}")
    void deleteOrder(String orderId);

    //删除指定订单id的Orderitem的一条内容
    @Delete("delete from orderitem where order_id = #{orderId}")
    void deleteOrderitem(String orderId);
}
