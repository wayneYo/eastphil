package com.springboot.tool;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**日期格式转换
 * Created by BIG on 2017/9/15.
 */
public class DateFormat {
    //转换为"yyyy-MM-dd hh:mm:ss"
    public static String simpleDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.format(date);
    }
    //转换为"yyyy-MM-dd hh:mm:ss"
    public static Date dateFormat(String date) throws ParseException{
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return sdf.parse(date);
    }
}
