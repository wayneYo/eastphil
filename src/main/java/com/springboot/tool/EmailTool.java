package com.springboot.tool;

import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 * Created by BIG on 2017/9/14.
 */
public class EmailTool {
    public static void send(String toEmail, String userId, String activecode) throws MessagingException{
        Properties props = new Properties();
        // 开启debug调试
        props.setProperty("mail.debug", "true");
        // 发送服务器需要身份验证
        props.setProperty("mail.smtp.auth", "true");
        // 设置邮件服务器主机名
        props.setProperty("mail.host", "smtp.163.com");
        // 发送邮件协议名称
        props.setProperty("mail.transport.protocol", "smtp");

        // 设置环境信息

        Session session = Session.getInstance(props);

        // 创建邮件对象
        Message msg = new MimeMessage(session);
        msg.setSubject("花花世界帐号激活");
        // 设置邮件内容

        ///邮件的内容
        //http://localhost:8090/activeUser?userId="+userId+"&activecode="+activecode
        StringBuffer sb=new StringBuffer("这是一封由花花世界发送的注册验证邮件！点击下面url完成验证：</br>");
        sb.append("<a href=\"http://localhost:8090/activeUser?userId=");
        sb.append(userId);
        sb.append("&activecode=");
        sb.append(activecode);
        sb.append("\">http://localhost:8090/activeUser?userId=");
        sb.append(userId);
        sb.append("&activecode=");
        sb.append(activecode);
        sb.append("</a>");
        msg.setSentDate(new Date());
        msg.setContent(sb.toString(), "text/html;charset=utf-8");
        // 设置发件人
        msg.setFrom(new InternetAddress("ylw714122@163.com"));

        Transport transport = session.getTransport();
        // 连接邮件服务器
        transport.connect("ylw714122", "yangluwen1992");
        // 发送邮件
        transport.sendMessage(msg, new Address[] {new InternetAddress(toEmail)});
        // 关闭连接
        transport.close();
    }
}
