package com.lw.system.framework.fa004;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.lw.oa.common.command.RetInfo;
import com.lw.oa.common.service.ICommonService;
import com.lw.oa.common.util.ConstantUtil;
import com.lw.oa.common.util.MessageUtil;
import com.lw.oa.mybatis.interceptor.Pager;
/**
 * *@author yuliang
 */
@Controller
//@RequestMapping("/fa/fa004/")
public class FA004Controller implements ConstantUtil{		
	//初始化画面	
	//private static final String  PAGE_INIT = "fa/fa004/fa004001List";
	//查询画面	
	private static final String  PAGE_SEARCH = "fa/fa004/fa004001List";
	//休假申请详细画面	
	//private static final String  PAGE_APPLY_DETAIL_A1 = "fa/fa004/fa004002A1Detail";	
	//休假申请修改画面	
	//private static final String  PAGE_APPLY_UPDATE_A1 = "fa/fa004/fa004003A1Update";

	@Autowired
	private IFA004Service fa004Service;
	@Autowired
	private ICommonService commonService;
	/**
	 * 申请管理一览画面init
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "fa004001init.do" },method = RequestMethod.GET)
	public ModelAndView fa004001init(HttpServletRequest request)
	{					
		FA004001SearchCommand searchCommand = new FA004001SearchCommand();
		return fa004001search(request, searchCommand, null);
	}
	/**
	 * 申请管理一览画面search
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "fa004001search.do" },method = RequestMethod.POST)
	public ModelAndView fa004001search(HttpServletRequest request, FA004001SearchCommand searchCommand, RetInfo retInfo)
	{					
		@SuppressWarnings("unchecked")
		List<FA004001ResultCommand> list = (List<FA004001ResultCommand>) fa004Service.fa004001search(searchCommand);
		RetInfo searchRetInfo = MessageUtil.getMessageNoResult(list.size());
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("searchCommand", searchCommand);
		resultMap.put("page", (Pager<?>)searchCommand);
		resultMap.put("list", list);
		resultMap.put("searchRetInfo", searchRetInfo);
		resultMap.put("retInfo", retInfo);
		ModelAndView mav = new ModelAndView( PAGE_SEARCH, resultMap);	
		return mav;
	}
	/**
	 * 申请管理一览画面翻页
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "fa004001page.do" },method = RequestMethod.POST)
	public ModelAndView fa004001page(HttpServletRequest request, FA004001SearchCommand searchCommand)
	{			
		@SuppressWarnings("unchecked")
		List<FA004001ResultCommand> list = (List<FA004001ResultCommand>) fa004Service.fa004001search(searchCommand);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("searchCommand", searchCommand);
		resultMap.put("page", (Pager<?>)searchCommand);
		resultMap.put("list", list);
		ModelAndView mav = new ModelAndView( PAGE_SEARCH, resultMap);	
		return mav;
	}	
}
