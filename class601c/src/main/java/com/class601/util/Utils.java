package com.class601.util;

import javax.servlet.http.HttpSession;

public class Utils {
	
	public static String makeNbsp(String nullStr){
				
		return nullStr == null ? "&nbsp;" : nullStr;
	}
	
	public static String toEmptySpace(String nullStr){
		
		return nullStr == null ? "" : nullStr;
	}

	public static String toPaging(String pageNo){
		
		return pageNo == null ? "1" : pageNo;
	}
	
	public static String makeId(String num){
		
		String num1 = "00000"+num;
		String nextNum = num1.substring(num1.length()-5,num1.length());
				
		return nextNum; 
	}
	
	public static String getId(HttpSession session, String idKey){
		
		Object objId = session.getAttribute(idKey);
		String id = "";
		
		if(objId == null){
			id = "";
		}else{
			id = (String) objId;
		}
		
		return id;
	}
}
