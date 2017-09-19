package com.springboot.tool.yeepay;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class PropUtils {
	private static Properties prop ;
	static {
		prop = new Properties();
		String path = PropUtils.class.getClassLoader().getResource("merchantInfo.properties").getPath();
		try {
			prop.load(new FileInputStream(new File(path)));
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static String getProperties(String key) {
		return prop.getProperty(key);
	}
}
