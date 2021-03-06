package com.lw.oa.common.service;

import java.util.List;

import com.lw.oa.common.command.DeviceOrderSearchCommand;

/**
 **@author yuliang
 */
public interface IZoomService {
	public List<?> searchEmpList( String orgcdid, String depid, String empname);
	public List<?> searchRoleList( String rolename);
	public List<?> searchDeviceOrderList(DeviceOrderSearchCommand searchCommand);
	public List<?> searchDeviceList( String orgcdid,String dailydevicename);
	public List<?> searchOrgList( String regionid,String orgname);
	public List<?> searchApplyA1List( String empid, String applyno);
	public List<?> searchApplyA4List( String empid, String applyno);
}
