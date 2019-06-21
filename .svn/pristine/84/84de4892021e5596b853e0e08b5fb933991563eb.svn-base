package com.ybt.base.entity.enums;

import com.jiufengxinxi.utils.Assert;

/**
 * 资金类型
 * @author roger
 *
 */

public enum FundTypeEnum {

	/**
	 * 提现
	 */
	WITHDRAWALS(0,"提现"),
	/**
	 * 推荐奖
	 */
	RECOMMEND_AWARD(1,"推荐奖"),
	/**
	 * 团购成功奖
	 */
	OUT_AWARD(2,"团购成功奖"),
	/**
	 * 竞位奖
	 */
	COPITITIVE_AWARD(3,"竞位奖"),
	/**
	 * 充值
	 */
	RECHARGE(4,"充值"),
	/**
	 * 注册/复投金
	 */
	REGISTER(5,"注册/复投金"),
	/**
	 * 抢单
	 */
	COMPETE(6,"抢单"),
	
	BUYCAR(7,"购车");
	
	
	
	private int flag;
	private String desc;
    private FundTypeEnum(int flag,String desc) {
        this.flag = flag;
        this.desc=desc;
    }
    public int value() {
        return this.flag;
    }
    
    public String desc(){
    	return this.desc;
    }
    
    public static FundTypeEnum getValue(String ordinal){
    	Assert.notNull(ordinal, "ordinal is not null");
    	return values()[Integer.valueOf(ordinal)];
    }
    
    public boolean isNewVertex(){
    	return flag==1;
    }
    
    public boolean isReCast(){
    	return flag==2;
    }
    
	@Override
	public String toString() {
		return String.valueOf(this.flag);
	}
	
}
