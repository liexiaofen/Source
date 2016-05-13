<%@page language="java" import="com.lw.oa.common.util.URIUtil" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../pgcommon/head.jsp"%>
<%
	String basePath = URIUtil.getURI(request);
	int num = 0;
%>
<base href="<%=basePath%>">
<script type="text/javascript">
/*
*名       称: btn_search()
*输入参数: 无
*输出参数: 无
*机       能: 查询
*创 建  者: yuliang          
*创建时间: 2015-10-21
*更 新  者: 
*更新时间: 
*/
function btn_search() {
	c_ShowProgressBar(); 
	$("#queryForm").attr( "action", "fa004001search.do");	
	$("#queryForm").submit();
}
/*
*名       称: btn_insert()
*输入参数: 无
*输出参数: 无
*机       能: 登录
*创 建  者: yuliang          
*创建时间: 2015-10-21
*更 新  者: 
*更新时间: 
*/
function btn_insert() {
	c_ShowProgressBar(); 
	$('#queryForm').attr( "action", "fa004001insert.do");
	$('#queryForm').submit();
}
/*
*名       称: link_view( id)
*输入参数: obj
*输出参数: 无
*机       能: Link到明细
*创 建  者: yuliang          
*创建时间: 2015-10-21
*更 新  者: 
*更新时间: 
*/
function link_view( obj){
	var dailydeviceid = $(obj).parent().find('input[name="dailydeviceid"]').val();
	$("#viewForm").find('input[name="dailydeviceid"]').val(dailydeviceid);
	c_ShowProgressBar(); 
	$('#viewForm').attr( "action", "fa004001view.do");	
	$('form[name="viewForm"]').submit();
}
/*
*名       称: btn_reset()
*输入参数: 无
*输出参数: 无
*机       能: 清空
*创 建  者: yuliang          
*创建时间: 2015-10-21
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
*名       称: btn_delete()
*输入参数: 无
*输出参数: 无
*机       能: 删除
*创 建  者: yuliang          
*创建时间: 2016-05-12
*更 新  者: 
*更新时间: 
*/
function btn_delete(){
	var obj = $( "input[name='chk']:checked" );
	if ( obj.length < 1 ) {
		alert(Message.getString("MSG_COMM_0031"));
		return;
	}
	if ( !window.confirm( Message.getString("MSG_IC_PD005_0001"))) 
		return;
	$("#div_result").find("input[name='chk']:checked").each(function( i, n){			
		var busidicttypeid = $(n).parent().find('input[name="busidicttypeid"]').val();
		$("#deleteForm").append("<input name=\"busidicttype["+i+"].busidicttypeid\" value=\""+busidicttypeid+"\" type=\"hidden\" />");
	});
	c_ShowProgressBar(); 
	$("#deleteForm").attr( "action", "fa004001delete.do");	
	$("#deleteForm").submit();
}
</script>
</head>
<body>
<form id="queryForm" action="" method="post" > 
	<div class="div_navi"><span><img src="<%= request.getContextPath()%>/resources/images/home.png">&nbsp;您当前的位置：系统管理&nbsp;&gt;&nbsp;业务字典信息&nbsp;&gt;&nbsp;业务字典信息一览</span></div>
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
				<td class="td_key" width="8%" nowrap><label class="message">类型代码</label></td>
				<td class="td_value" width="42%">
					<input id="busidicttypeid"  name="busidicttypeid" class="input_txt" value="${searchCommand.busidicttypeid}" maxlength="20" />
				</td>
				<td class="td_key" width="8%" nowrap><label class="message">类型名称</label></td>
				<td class="td_value" >
					<input id="busidicttypename"  name="busidicttypename" class="input_txt" value="${searchCommand.busidicttypename}" maxlength="20" />
				</td>
			</tr>	 
			<tr>
				<td colspan="4" align="right">					
					<input name="search" id="search" type="button" class="btn" value="查&nbsp;询" onClick="btn_search();"/>
					<input name="button" id="reset" type="button" class="btn" value="清&nbsp;空" onClick="btn_reset();">
					<input name="button" id="login" type="button" class="btn" value="登&nbsp;录" onClick="btn_insert();"> 
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
		    	<td width="3%"><input type="checkbox" name="checkAll" id="checkAll" value='abc'/></td>
		    	<td width="3%">&nbsp;序号&nbsp;</td>					
				<td width="15%">&nbsp;类型代码&nbsp;</td>
				<td width="15%">&nbsp;类型名称&nbsp;</td>	
				<td width="15%">&nbsp;操作&nbsp;</td>	
				<td>&nbsp;&nbsp;</td>
			</tr>
		    <tbody id="body_result">
		    	<c:forEach items="${list}" var="iterator">
		    		<tr class="pg_result_content">
		    			<% num++;%>
		    			<td align="center" nowrap>
	    					<input type="checkbox" name="chk" />
	    					<input name="busidicttypeid" value="${ iterator.busidicttypeid}" type="hidden" />
		    			</td>
		    			<td align="center" nowrap><%=num %></td>
						<td align="left" nowrap>
							<a href="#" onclick="javascript:link_view(this);return false;">${iterator.busidicttypeid}</a>
						</td>
						<td align="left" nowrap>${iterator.busidicttypename}</td>	
						<td align="left" nowrap>
							<input name="edit" id="edit" type="button" class="btn" onClick="btn_edit()"  value="编&nbsp;辑" />
							<input name="edit" id="edit" type="button" class="btn" onClick="btn_edit()"  value="更&nbsp;新" />							
						</td>	 					
						<td align="left" nowrap></td>
		    		</tr>
		    	</c:forEach>	
		    </tbody>
		</table>
	</div>
	<div class="div_result_button">
		<table>
			<tr>
				<td>
					<input name="insert" id="insert" type="button" class="btn" onClick="btn_insert()"  value="登&nbsp;录" /> 
					<input name="delete" id="delete" type="button" class="btn" onClick="btn_delete()"  value="删&nbsp;除" />
				</td>
			</tr>
		</table>
	</div>
</c:if>
<form action="fa004001page.do" id="pageform" name="pageform" method="post" >
	<%/*共通隐藏字段 start*/%>
	<input name="busidicttypeid" type="hidden"  value="${searchCommand.busidicttypeid}" />
	<input name="busidicttypename" type="hidden"  value="${searchCommand.busidicttypename}" />
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
				pagination("page", "fa004001page.do","pageform",curPage,totalPage,firstPage,lastPage);
			</script>
		</div>
	</c:if>
	<!--End Page Infor-->
</form>
<%-- 详情表单开始  --%>
<form action="fa004001view.do" id="viewForm" name="viewForm" method="post">
	<%/*共通隐藏字段 start*/%>
	<input name="busidicttypeid" type="hidden"  value="${searchCommand.busidicttypeid}" />
	<input name="busidicttypename" type="hidden"  value="${searchCommand.busidicttypename}" />
	<%/*共通隐藏字段 end*/%>	
	<input name=busidicttypeid type="hidden"  />
</form>
<%-- 详情表单结束  --%>
<form action="fa004001delete.do" id="deleteForm" name="deleteForm" method="post">
	<%/*共通隐藏字段 start*/%>
	<input name="busidicttypeid" type="hidden"  value="${searchCommand.busidicttypeid}" />
	<input name="busidicttypename" type="hidden"  value="${searchCommand.busidicttypename}" />
	<%/*共通隐藏字段 end*/%>		
</form>
</body>
</html>