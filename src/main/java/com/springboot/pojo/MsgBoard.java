package com.springboot.pojo;

/*create table MSGBOARD
(
   msg_id               int(11) not null auto_increment comment '留言板的id唯一，用隐藏域，用来区分重复的姓名',
   msg_name             varchar(50) comment '客户姓名',
   msg_email            varchar(50),
   msg_title            varchar(255),
   msg_content          varchar(1000),
   primary key (msg_id)
);*/
public class MsgBoard {
	private Integer msgId;
	private String msgName;
	private String msgEmail;
	private String msgTitle;
	private String msgContent;
	public Integer getMsgId() {
		return msgId;
	}
	public void setMsgId(Integer msgId) {
		this.msgId = msgId;
	}
	public String getMsgName() {
		return msgName;
	}
	public void setMsgName(String msgName) {
		this.msgName = msgName;
	}
	public String getMsgEmail() {
		return msgEmail;
	}
	public void setMsgEmail(String msgEmail) {
		this.msgEmail = msgEmail;
	}
	public String getMsgTitle() {
		return msgTitle;
	}
	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}
	public String getMsgContent() {
		return msgContent;
	}
	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}
	
}
