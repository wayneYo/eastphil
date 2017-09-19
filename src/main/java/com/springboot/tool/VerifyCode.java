package com.springboot.tool;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.OutputStream;
import java.util.Random;

/**
 * Created by BIG on 2017/9/15.
 */
public class VerifyCode {

    private int base = 30;
    private int width = 4*base;
    private int height = base;
    private int len = 4;
    private String codes="23456789abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ";
    private String[] fontNames={"宋体","黑体","微软雅黑","楷体","仿宋"};
    private String code="";
    public void drawImage(OutputStream output){
        Graphics2D g2= null;
        try{
            BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

            g2 = (Graphics2D) bi.getGraphics();

            g2.setColor(Color.WHITE);
            g2.fillRect(0, 0, width, height);

            g2.setColor(Color.GREEN);

            g2.setFont(new Font("宋体",Font.BOLD,22));

            StringBuffer sb = new StringBuffer();
            for(int i=0;i<len;i++){
                g2.setFont(new Font(fontNames[this.getRandom(0, fontNames.length)],Font.BOLD,22));
                g2.setColor(new Color(this.getRandom(0, 150),this.getRandom(0, 150),this.getRandom(0, 150)));

                double theta = this.getRandom(-30, 30)*Math.PI/180;
                g2.rotate(theta,30*i+7,height-6);

                String code = codes.charAt(this.getRandom(0, codes.length()))+"";
                g2.drawString(code,30*i+7, height-6);

                g2.rotate(-theta,30*i+7,height-6);

                sb.append(code);
            }

            code = sb.toString();

            for(int i=0;i<5;i++){
                g2.setColor(new Color(this.getRandom(0, 150),this.getRandom(0, 150),this.getRandom(0, 150)));
                g2.drawLine(this.getRandom(0, width),this.getRandom(0, height),this.getRandom(0, width),this.getRandom(0, height));
                g2.drawOval(this.getRandom(0, width), this.getRandom(0, height), this.getRandom(0, 7), this.getRandom(0, 7));
            }

            g2.setColor(Color.GRAY);
            g2.drawRect(0, 0, width-1, height-1);

            ImageIO.write(bi, "JPEG", output);

        }catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }finally{
            g2.dispose();
        }

    }

    public String getCode(){
        return code;
    }

    public int getRandom(int start,int end){
        Random random = new Random();
        return random.nextInt(end-start)+start;
    }
}
