package com.ybt.web.util;

public class ApprovalUtil {

	public static String getStateMc(String state){
		String stateMc = null;
		if("0".equals(state)){
			stateMc = "未转账";
		}else if("1".equals(state)){
			stateMc = "待审核";
		}else if("2".equals(state)){
			stateMc = "审核通过";
		}else if("3".equals(state)){
			stateMc = "审核不通过";
		}
		return stateMc;
	}
	
	public static String getApprovalTypeMc(int approvalType){
		String approvalTypeMc = null;
		switch(approvalType){
			case 0:
				approvalTypeMc = "注册/复投申请";
				break;
			case 1:
				approvalTypeMc = "提现申请";
				break;
			case 2:
				approvalTypeMc = "充值申请";
				break;
		}
		return approvalTypeMc;
	}
}
