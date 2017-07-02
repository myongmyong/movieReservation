package com.class601.login.service;

import com.class601.vo.GuestVo;



public interface GuestLoginService {
	public int guestRegist(String id, String password, String birth, String name, String mobileCarrier, String cellphone);
	public GuestVo guestLogin(String password, String birth, String name, String mobileCarrier, String cellphone);
}
