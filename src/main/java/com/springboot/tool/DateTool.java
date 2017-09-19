package com.springboot.tool;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class DateTool {

	public static Map<String,String[]> getDates(Date date,int len){
		//封装横坐标名称的数据
		String[] nameParam = new String[len];
		//封装数据表中查询所用的日期对象
		Date[] dateParam = new Date[len+1];
		
		
		dateParam[len] = date;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		nameParam[len-1] = sdf.format(date);  
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH,1);
		calendar.set(Calendar.HOUR_OF_DAY,0);
		calendar.set(Calendar.MINUTE,0);
		calendar.set(Calendar.SECOND,0);
		dateParam[len-1] = calendar.getTime();
		for(int i=0;i<len-1;i++){
			calendar.add(Calendar.MONTH, -1);
			nameParam[len-2-i] = sdf.format(calendar.getTime());
			dateParam[len-2-i] =calendar.getTime();
		}
		
		Map map = new HashMap<String,String[]>();
		map.put("nameParam", nameParam);
		map.put("dateParam",dateParam);
		
		return map;
	}
}
