package com.lw.oa.pb.daily.pb002;

import com.lw.oa.mybatis.interceptor.Pager;

/**
 * *@author yuliang
 */
public class PB002001SearchCommand extends Pager<PB002001ResultCommand> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 机构id
	private String orgcdid;	
	// 日程设备名称
	private String dailydevicename;
	// 显示日历
	private String displaydate;
	// 当前日期
	private String currentdate;
	public String getOrgcdid() {
		return orgcdid;
	}
	public void setOrgcdid(String orgcdid) {
		this.orgcdid = orgcdid;
	}
	public String getDailydevicename() {
		return dailydevicename;
	}
	public void setDailydevicename(String dailydevicename) {
		this.dailydevicename = dailydevicename;
	}
	public String getDisplaydate() {
		return displaydate;
	}
	public void setDisplaydate(String displaydate) {
		this.displaydate = displaydate;
	}
	public String getCurrentdate() {
		return currentdate;
	}
	public void setCurrentdate(String currentdate) {
		this.currentdate = currentdate;
	}

}