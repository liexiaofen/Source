<%@page language="java" import="com.lw.oa.common.util.URIUtil" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../pgcommon/head.jsp"%>
<%
	String basePath = URIUtil.getURI(request);
%>
<base href="<%=basePath%>">
<script type="text/javascript">
/*
*名       称: btn_search()
*输入参数: 无
*输出参数: 无
*机       能: 查询
*创 建  者: yuliang          
*创建时间: 2015-11-02
*更 新  者: 
*更新时间: 
*/
function btn_search() {
	if ( !$.fn.autovalidateForm("queryForm") ){
		return;
	}
	c_ShowProgressBar(); 
	$("#queryForm").attr( "action", "pb002001search.do");	
	$("#queryForm").submit();
}
/*
*名       称: link_lastWeek(obj)
*输入参数: obj
*输出参数: 无
*机       能: 上一周
*创 建  者: yuliang          
*创建时间: 2015-11-30
*更 新  者: 
*更新时间: 
*/
function link_lastWeek(obj) {
	if ( !$.fn.autovalidateForm("queryForm") ){
		return;
	}
	c_ShowProgressBar(); 
	$("#queryForm").attr( "action", "pb002001lastWeek.do");	
	$("#queryForm").submit();
}
/*
*名       称: link_nextWeek(obj)
*输入参数: obj
*输出参数: 无
*机       能: 下一周
*创 建  者: yuliang          
*创建时间: 2015-11-30
*更 新  者: 
*更新时间: 
*/
function link_nextWeek(obj) {
	if ( !$.fn.autovalidateForm("queryForm") ){
		return;
	}
	c_ShowProgressBar(); 
	$("#queryForm").attr( "action", "pb002001nextWeek.do");	
	$("#queryForm").submit();
}
/*
*名       称: img_insert(obj)
*输入参数: 无
*输出参数: 无
*机       能: 登录
*创 建  者: yuliang          
*创建时间: 2015-11-02
*更 新  者: 
*更新时间: 
*/
function img_insert(obj) {
	var currentdate = $(obj).parent().find('input[name="currentdate"]').val();
	var empid = $(obj).parent().find('input[name="empid"]').val();
	if(currentdate == ''){
		alert("当前日期没有日程可以安排！");
		return;
	}
	$("#insertForm").find('input[name="currentdate"]').val(currentdate);
	$("#insertForm").find('input[name="empid"]').val(empid);
	c_ShowProgressBar(); 
	$('#insertForm').attr( "action", "pb002001insert.do");
	$('#insertForm').submit();
}
/*
*名       称: img_edit( obj)
*输入参数: obj
*输出参数: 无
*机       能: 跳转到编辑画面
*创 建  者: yuliang          
*创建时间: 2015-11-04
*更 新  者: 
*更新时间: 
*/
function img_edit( obj){
	var currentdate = $(obj).parent().parent().find('input[name="currentdate"]').val();
	var dailyid = $(obj).parent().find('input[name="dailyid"]').val();
	$("#editForm").find('input[name="currentdate"]').val(currentdate);
	$("#editForm").find('input[name="dailyid"]').val(dailyid);
	c_ShowProgressBar(); 
	$('#editForm').attr( "action", "pb002001edit.do");	
	$('form[name="editForm"]').submit();
}
/*	
*名       称: img_searchMonthDaily( obj)
*输入参数: obj
*输出参数: 无
*机       能: 查看月日程
*创 建  者: yuliang          
*创建时间: 2015-11-20
*更 新  者: 
*更新时间: 
*/
function img_searchMonthDaily( obj){
	window.location.href="<%= request.getContextPath()%>/page/design.jsp";
}


/*
*名       称: btn_reset()
*输入参数: 无
*输出参数: 无
*机       能: 清空
*创 建  者: yuliang          
*创建时间: 2015-11-02
*更 新  者: 
*更新时间: 
*/
function btn_reset() {
	if ( !window.confirm( Message.getString("MSG_IC_COMM_0021"))) 
		return;
	$("#queryForm").find("input[type='text']").val('');
	$("#queryForm").find("select").each(function(i,n){
		$(n).val('');
	});
}
/*
*名       称: link_showMd()
*输入参数: id
*输出参数: 无
*机       能: 打开模式窗口
*创 建  者: yuliang          
*创建时间: 2015-11-05
*更 新  者: 
*更新时间: 
*/
function link_showMd(id) {	
	c_ShowProgressBar(1); 
	var obj = new Object();
	obj.url = 'pb002searchDailyDetail.do?dailyid='+id;
	var ret = selectZoom( '<%= request.getContextPath()%>/'+obj.url, obj);
}
/*
*名       称: btn_deviceOrderSearch()
*输入参数: 无
*输出参数: 无
*机       能: 打开模式窗口
*创 建  者: yuliang          
*创建时间: 2015-11-05
*更 新  者: 
*更新时间: 
*/
function btn_deviceOrderSearch() {		
	c_ShowProgressBar(1); 
	var obj = new Object();
	obj.url = 'common/zoom/searchDeviceOrderList.do';
	obj.navi = '日程管理 > 日程安排 > 日程设备预约一览';
	var ret = selectZoom( '<%= request.getContextPath()%>/'+obj.url, obj);
}
</script>
</head>
<body>
<form id="queryForm" action="" method="post" > 
	<input name="empid" type="hidden"  value="${sessionScope.user.empid}" />
	<div class="div_navi"><span><img src="<%= request.getContextPath()%>/resources/images/home.png">&nbsp;您当前的位置：日程管理&nbsp;&gt;&nbsp;设备空闲&nbsp;&gt;&nbsp;设备空闲一览</span></div>
	
	<div class="div_search_title">
		<table class="tb_title">
			<tbody>
				<tr class="tr_caption">
					<td class="td_caption_mark">
						<img src="<%= request.getContextPath()%>/resources/images/m_nav_dian.gif"></img>
					<td class="td_caption">
						查询条件
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="div_search_content">
	  <table class="tb_search check_specialchar">
	    <tbody>
			<tr>
				<td class="td_key" width="8%" nowrap><label class="message">机构</label></td>
				<td class="td_value" width="26%">
					<dict:select1 id="orgcdid" name="orgcdid" value="${searchCommand.orgcdid}" sqlid="select orgcdid as busidictid,orgshortname as busidictname  from s_organize where deletefg = '0' order by sortno" cssClass="input_select" nullLabel="全部"></dict:select1>
				</td>
				<td class="td_key" width="8%" nowrap><label class="message">设备名称</label></td>
				<td class="td_value" width="26%">
					<input id="dailydevicename"  name="dailydevicename" class="input_txt" value="${searchCommand.dailydevicename}" maxlength="20" />
				</td>
				<td class="td_key" width="8%" nowrap><font color="#ff0000">*</font><label class="message">显示日历</label></td>
				<td class="td_value" width="26%">
					<a href="#" onclick="javascript:link_lastWeek(this);return false;" style="text-decoration: none;"><span>&lt;&lt;</span></a>
					<input id="displaydate" name="displaydate" class="input_date Wdate" readonly="readonly" value="${searchCommand.displaydate}" onclick="WdatePicker()" title="required"/>
					<a href="#" onclick="javascript:link_nextWeek(this);return false;" style="text-decoration: none;"><span>&gt;&gt;</span></a>
				</td>
			</tr> 
			<tr>
				<td colspan="6" align="right">					
					<input name="search" id="search" type="button" class="btn" value="查&nbsp;询" onclick="btn_search()"/>
					<input name="reset" id="reset" type="button" class="btn" value="清&nbsp;空" onclick="btn_reset()">
				</td>
	      	</tr>
	    </tbody>
	  </table>
	</div>
</form>
<c:if test="${not empty list}">
	<div class="div_result_title">
		<table class="tb_title">
			<tbody>
				<tr class="tr_caption">
					<td class="td_caption_mark">
						<img src="<%=request.getContextPath()%>/resources/images/m_nav_dian.gif"></td>
					<td class="td_caption">
						查询结果
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="div_result" id="div_result">  
		<table id="tresult" class="pg_result">
		    <tr class="pg_result_head">
				<td width="13%">&nbsp;设备名称&nbsp;</td>
				<td width="13%" nowrap>
					<c:if test="${title.statusofone == 1}">&nbsp;<font color="#ff0000">${title.weekofone}&nbsp;${title.one}&nbsp;</font></c:if>
					<c:if test="${title.statusofone == 0}">&nbsp;${title.weekofone}&nbsp;${title.one}&nbsp;</c:if>
				</td>				
				<td width="13%" nowrap>
					<c:if test="${title.statusoftwo == 1}">&nbsp;<font color="#ff0000">${title.weekoftwo}&nbsp;${title.two}&nbsp;</font></c:if>
					<c:if test="${title.statusoftwo == 0}">&nbsp;${title.weekoftwo}&nbsp;${title.two}&nbsp;</c:if>
				</td>		
				<td width="13%" nowrap>
					<c:if test="${title.statusofthree == 1}">&nbsp;<font color="#ff0000">${title.weekofthree}&nbsp;${title.three}&nbsp;</font></c:if>
					<c:if test="${title.statusofthree == 0}">&nbsp;${title.weekofthree}&nbsp;${title.three}&nbsp;</c:if>
				</td>		
				<td width="13%" nowrap>
					<c:if test="${title.statusoffour == 1}">&nbsp;<font color="#ff0000">${title.weekoffour}&nbsp;${title.four}&nbsp;</font></c:if>
					<c:if test="${title.statusoffour == 0}">&nbsp;${title.weekoffour}&nbsp;${title.four}&nbsp;</c:if>
				</td>				
				<td width="13%" nowrap>
					<c:if test="${title.statusoffive == 1}">&nbsp;<font color="#ff0000">${title.weekoffive}&nbsp;${title.five}&nbsp;</font></c:if>
					<c:if test="${title.statusoffive == 0}">&nbsp;${title.weekoffive}&nbsp;${title.five}&nbsp;</c:if>
				</td>			
				<td width="13%" nowrap>
					<c:if test="${title.statusofsix == 1}">&nbsp;<font color="#ff0000">${title.weekofsix}&nbsp;${title.six}&nbsp;</font></c:if>
					<c:if test="${title.statusofsix == 0}">&nbsp;${title.weekofsix}&nbsp;${title.six}&nbsp;</c:if>
				</td>				
				<td width="13%" nowrap>
					<c:if test="${title.statusofseven == 1}">&nbsp;<font color="#ff0000">${title.weekofseven}&nbsp;${title.seven}&nbsp;</font></c:if>
					<c:if test="${title.statusofseven == 0}">&nbsp;${title.weekofseven}&nbsp;${title.seven}&nbsp;</c:if>
				</td>
			</tr>
		    <tbody id="body_result">
		    	<c:forEach items="${list}" var="iterator">
		    		<tr class="pg_result_content">
		    			<td align="left" nowrap>
		    				${iterator.dailydevicename}<br />
						    <img src="<%=request.getContextPath()%>/resources/images/monthdaily.png" border="0" class="img_lookup_big" onclick="img_searchMonthDaily(this)" />月预定
						</td>
						<td align="left" nowrap>
							<c:forEach items="${iterator.one}" var="entity">
								<span>☆${entity.eventstarthm}-${entity.eventendhm}<br /></span>  
							</c:forEach>
						</td>
						<td align="left" nowrap>
							<c:forEach items="${iterator.two}" var="entity">
								<span>☆${entity.eventstarthm}-${entity.eventendhm}<br /></span>  
							</c:forEach>
						</td>
						<td align="left" nowrap>
							<c:forEach items="${iterator.three}" var="entity">
								<span>☆${entity.eventstarthm}-${entity.eventendhm}<br /></span>  
							</c:forEach>
						</td>
						<td align="left" nowrap>
							<c:forEach items="${iterator.four}" var="entity">
								<span>☆${entity.eventstarthm}-${entity.eventendhm}<br /></span>  
							</c:forEach>							
						</td>
						<td align="left" nowrap>
							<c:forEach items="${iterator.five}" var="entity">
								<span>☆${entity.eventstarthm}-${entity.eventendhm}<br /></span>  
							</c:forEach>		
						</td>
						<td align="left" nowrap>
							<c:forEach items="${iterator.six}" var="entity">
								<span>☆${entity.eventstarthm}-${entity.eventendhm}<br /></span>  
							</c:forEach>
						</td>
						<td align="left" nowrap>
							<c:forEach items="${iterator.seven}" var="entity">
								<span>☆${entity.eventstarthm}-${entity.eventendhm}<br /></span>  
							</c:forEach>
						</td>
		    		</tr>
		    	</c:forEach>	
		    </tbody>
		</table>
	</div>
</c:if>
<form action="pb002001page.do" id="pageform" name="pageform" method="post" >
	<%/*共通隐藏字段 start*/%>
	<input name="orgcdid" type="hidden"  value="${searchCommand.orgcdid}" />
	<input name="dailydevicename" type="hidden"  value="${searchCommand.dailydevicename}" />
	<input name="displaydate" type="hidden"  value="${searchCommand.displaydate}" />
	<input name="pageSize" type="hidden" value="${page.pageSize}"/>
	<input name="curPage" type="hidden" value="${page.curPage}"/>
	<input name="totalPage" type="hidden" value="${page.totalPage}"/>
	<input name="firstPage" type="hidden" value="${page.firstPage}"/>
	<input name="lastPage" type="hidden" value="${page.lastPage}"/>
	<input name="totalRecord" type="hidden" value="${page.totalRecord}"/>
	<%/*共通隐藏字段 end*/%>
	<!--Start Page Infor-->
	<c:if test="${page.totalRecord gt 0}">
		<div class="div_page"> 
			<script type="text/javascript">
				var curPage = $('#pageform').find('input[name="curPage"]').val();
				var totalPage = $('#pageform').find('input[name="totalPage"]').val();
				var firstPage = $('#pageform').find('input[name="firstPage"]').val();
				var lastPage = $('#pageform').find('input[name="lastPage"]').val();
				pagination("page", "pb002001page.do","pageform",curPage,totalPage,firstPage,lastPage);
			</script>
		</div>
	</c:if>
	<!--End Page Infor-->
</form>
</body>
</html>