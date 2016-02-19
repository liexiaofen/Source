package com.lw.oa.common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.lw.oa.common.command.DeviceOrderSearchCommand;
import com.lw.oa.common.command.ResultCommand;
import com.lw.oa.common.command.RetInfo;
import com.lw.oa.common.service.IZoomService;
import com.lw.oa.common.util.ConstantUtil;
import com.lw.oa.common.util.DateUtil;
import com.lw.oa.common.util.MessageUtil;
import com.lw.oa.mybatis.interceptor.Pager;

/**
 * *@author yuliang
 */
@Controller
@RequestMapping("/common/zoom/")
public class ZoomController implements ConstantUtil {
	// 设备一览模式窗口
	private static final String PAGE_DEVICELIST = "zoom/deviceList";
	// 角色一览模式窗口
	private static final String PAGE_ROLELIST = "zoom/roleList";
	// 员工一览模式窗口
	private static final String PAGE_EMPLIST = "zoom/empList";
	// 设备预约模式窗口
	private static final String PAGE_DEVICEORDER = "zoom/deviceOrderList";
	// 机构信息一览模式窗口	
	private static final String  PAGE_ORGLIST = "zoom/orgList";	
	@Autowired
	private IZoomService zoomService;

	/**
	 * 设备一览画面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchDeviceList.do" }, method = RequestMethod.GET)
	public ModelAndView searchDeviceList(HttpServletRequest request) {
		String orgcdid = request.getParameter("orgcdid");
		String dailydevicename = request.getParameter("dailydevicename");
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService
				.searchDeviceList(orgcdid, dailydevicename);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("orgcdid", orgcdid);
		resultMap.put("dailydevicename", dailydevicename);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView(PAGE_DEVICELIST, resultMap);
		return mav;
	}

	/**
	 * 模式窗口画面查询
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchDeviceList.do" }, method = RequestMethod.POST)
	public ModelAndView searchDeviceModalList(HttpServletRequest request) {
		String orgcdid = request.getParameter("orgcdid");
		String dailydevicename = request.getParameter("dailydevicename");
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService
				.searchDeviceList(orgcdid, dailydevicename);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("orgcdid", orgcdid);
		resultMap.put("dailydevicename", dailydevicename);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView(PAGE_DEVICELIST, resultMap);
		return mav;
	}
	/**
	 * 角色一览画面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchRoleList.do" }, method = RequestMethod.GET)
	public ModelAndView searchRoleList(HttpServletRequest request) {
		String rolename = request.getParameter("rolename");
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService
				.searchRoleList(rolename);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("rolename", rolename);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView(PAGE_ROLELIST, resultMap);
		return mav;
	}

	/**
	 * 模式窗口画面查询
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchRoleList.do" }, method = RequestMethod.POST)
	public ModelAndView searchRoleModalList(HttpServletRequest request) {
		String rolename = request.getParameter("rolename");
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService
				.searchRoleList(rolename);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("rolename", rolename);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView(PAGE_ROLELIST, resultMap);
		return mav;
	}
	/**
	 * 员工一览画面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchEmpList.do" }, method = RequestMethod.GET)
	public ModelAndView searchEmpList(HttpServletRequest request) {
		String orgcdid = request.getParameter("orgcdid");
		String depid = request.getParameter("depid");
		String empname = request.getParameter("empname");
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService
				.searchEmpList(orgcdid, depid, empname);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("orgcdid", orgcdid);
		resultMap.put("depid", depid);
		resultMap.put("empname", empname);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView(PAGE_EMPLIST, resultMap);
		return mav;
	}

	/**
	 * 模式窗口画面查询
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchEmpList.do" }, method = RequestMethod.POST)
	public ModelAndView searchEmpModalList(HttpServletRequest request) {
		String orgcdid = request.getParameter("orgcdid");
		String depid = request.getParameter("depid");
		String empname = request.getParameter("empname");
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService
				.searchEmpList(orgcdid, depid, empname);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("orgcdid", orgcdid);
		resultMap.put("depid", depid);
		resultMap.put("empname", empname);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView(PAGE_EMPLIST, resultMap);
		return mav;
	}

	/**
	 * 设备空闲画面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchDeviceOrderList.do" }, method = RequestMethod.GET)
	public ModelAndView searchDeviceOrderList(HttpServletRequest request) {
		String daily = request.getParameter("daily");
		DeviceOrderSearchCommand searchCommand = new DeviceOrderSearchCommand();
		if (!StringUtils.isEmpty(daily)) {
			searchCommand.setDisplaydate(daily);
		} else {
			// 初始化时间
			String sysdate = DateUtil.getSystemTime(DATE_FORMAT_YMD);
			String displaydate = sysdate;
			searchCommand.setDisplaydate(displaydate);
		}
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService
				.searchDeviceOrderList(searchCommand);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("searchCommand", searchCommand);
		resultMap.put("page", (Pager<?>) searchCommand);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView(PAGE_DEVICEORDER, resultMap);
		return mav;
	}

	/**
	 * 模式窗口设备空闲画面查询
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchDeviceOrderList.do" }, method = RequestMethod.POST)
	public ModelAndView searchDeviceOrderModelList(
			HttpServletRequest request, DeviceOrderSearchCommand searchCommand) {
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService
				.searchDeviceOrderList(searchCommand);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", list);
		resultMap.put("searchCommand", searchCommand);
		resultMap.put("page", (Pager<?>) searchCommand);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView(PAGE_DEVICEORDER, resultMap);
		return mav;
	}
	
	/**
	 * 机构信息一览画面
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchOrgList.do" },method = RequestMethod.GET)
	public ModelAndView searchOrgList(HttpServletRequest request)
	{			
		String regionid = request.getParameter("regionid");
		String orgname = request.getParameter("orgname");	
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService.searchOrgList(regionid, orgname);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String,Object> resultMap = new HashMap<String,Object>();	
		resultMap.put("list", list);
		resultMap.put("regionid", regionid);
		resultMap.put("orgname", orgname);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView( PAGE_ORGLIST, resultMap);				
		return mav;
	}
	
	/**
	 * 模式窗口画面查询
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "searchOrgList.do" },method = RequestMethod.POST)
	public ModelAndView searchOrgModalList(HttpServletRequest request)
	{			
		String regionid = request.getParameter("regionid");
		String orgname = request.getParameter("orgname");			
		@SuppressWarnings("unchecked")
		List<ResultCommand> list = (List<ResultCommand>) zoomService.searchOrgList(regionid, orgname);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String,Object> resultMap = new HashMap<String,Object>();	
		resultMap.put("list", list);
		resultMap.put("regionid", regionid);
		resultMap.put("orgname", orgname);
		resultMap.put("searchRetInfo", searchRetInfo);
		ModelAndView mav = new ModelAndView( PAGE_ORGLIST, resultMap);				
		return mav;
	}
}
