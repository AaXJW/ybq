package com.ybt.base.entity.enums;

import com.jiufengxinxi.utils.Assert;

public enum TerritoryEnum {

	
	NewVertex(1),//新顶点
	ReCast(2),//复投
	NomalCast(3);//正常投
	
	
	private int flag;
    private TerritoryEnum(int flag) {
        this.flag = flag;
    }
    public int value() {
        return this.flag;
    }
    
    public static TerritoryEnum getValue(String ordinal){
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
