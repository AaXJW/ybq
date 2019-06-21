package com.ybt.base.entity;


import javax.persistence.Entity;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="MyOrder")
public class Order  extends BaseStringEntity {

	private String openID;//用户ID
	
	private String testID;//测试ID
	
	private int state;//订单状态   0：未支付  1：支付成功   2：支付失败   3：订单失效 4:创建预支付订单失败
	
	private String orderTime;//订单时间
	
	private String prepayId;//预支付订单ID
	

	public String getOpenID() {
		return openID;
	}

	public void setOpenID(String openID) {
		this.openID = openID;
	}

	public String getTestID() {
		return testID;
	}

	public void setTestID(String testID) {
		this.testID = testID;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getPrepayId() {
		return prepayId;
	}

	public void setPrepayId(String prepayId) {
		this.prepayId = prepayId;
	}
	
	 
}
