<%@page language="java" import="com.lw.oa.common.util.URIUtil" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../pgcommon/head.jsp"%>
<%
	String basePath = URIUtil.getURI(request);
	int num = 0;
%>
<base href="<%=basePath%>">
<script type="text/javascript">
var obj = window.dialogArguments;
var url = obj.url;
var navi = obj.navi;
window.name = "curWindow";
/*
*名       称: btn_search()
*输入参数: 无
*输出参数: 无
*机       能: 查询
*创 建  者: yuliang          
*创建时间: 2015-11-12
*更 新  者: 
*更新时间: 
*/
function btn_search() {	
	c_ShowProgressBar(); 
	$("#queryForm").attr( "action", url);	
	$("#queryForm").submit();	
}
/*
*名       称: btn_reset()
*输入参数: 无
*输出参数: 无
*机       能: 清空
*创 建  者: yuliang          
*创建时间: 2015-11-12
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
*名       称: btn_close()
*输入参数: 无
*输出参数: 无
*机       能: 关闭
*创 建  者: yuliang          
*创建时间: 2015-11-12
*更 新  者: 
*更新时间: 
*/
function btn_close() {
	window.close(); 
}
/*
*名       称: btn_sure()
*输入参数: 无
*输出参数: 无
*机       能: 确认
*创 建  者: yuliang          
*创建时间: 2015-11-12
*更 新  者: 
*更新时间: 
*/
function btn_sure()
{
	var retArray = new Array();
	retArray[0] = '';
	retArray[1] = '';
	var subBox = $("input[name='subBox']:checked");
	
	if(subBox.length == 0){
		window.close(); 
	}
	for(var i=0; i<subBox.length; i++){
		retArray[0] = retArray[0] + $(subBox[i]).parent().find('input[name="orgcdid"]').val() + ':' + $(subBox[i]).parent().parent().find('select[name="depid"]').val() + ':' + $(subBox[i]).parent().parent().find('select[name="posid"]').val() + ',';
		retArray[1] = retArray[1] + $(subBox[i]).parent().find('input[name="orgshortname"]').val() + ':' + $(subBox[i]).parent().parent().find('select[name="depid"]').find("option:selected").text() + ':' + $(subBox[i]).parent().parent().find('select[name="posid"]').find("option:selected").text() + ',';
	}
	retArray[0] = retArray[0].substr(0, retArray[0].length - 1);
	retArray[1] = retArray[1].substr(0, retArray[1].length - 1);
	window.returnValue = retArray; 
	window.close(); 
}
//初始化全选框
$(function() {
	$('#span1').text(navi);
    $("#checkAll").click(function() {
         $('input[name="subBox"]').attr("checked",this.checked); 
     });
     var $subBox = $("input[name='subBox']");
     $subBox.click(function(){
         $("#checkAll").attr("checked",$subBox.length == $("input[name='subBox']:checked").length ? true : false);
     });
 });

</script>
</head>
<body>
<form id="queryForm" action="" method="post" target="curWindow"> 
	<div class="div_navi"><img src="<%= request.getContextPath()%>/resources/images/home.png">&nbsp;您当前的位置：<span id="span1"></span></div>
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
				<td class="td_key" width="8%" nowrap><label class="message">区域</label></td>
				<td class="td_value" width="42%">
		        	<dict:select id="regionid" name="regionid" value="${regionid}" busiDictTypeId="OA_COMMON_Region" cssClass="input_select" nullLabel="全部"></dict:select>
		        </td>
				<td class="td_key" width="8%" nowrap><label class="message">机构全称</label></td>
				<td class="td_value" >
					<input id="orgname"  name="orgname" class="input_txt" value="${orgname}" maxlength="20" />
				</td>				
			</tr>	 
			<tr>
				<td colspan="6" align="right">					
					<input name="search" id="search" type="button" class="btn" value="查&nbsp;询" onClick="btn_search();"/>
					<input name="button" id="reset" type="button" class="btn" value="清&nbsp;空" onClick="btn_reset();">
					<input name="search" id="search" type="button" class="btn" value="关&nbsp;闭" onClick="btn_close();"/>
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
				<td>&nbsp;机构全称 &nbsp;</td>
				<td width="15%">&nbsp;机构简称&nbsp;</td>
				<td width="8%">&nbsp;区域&nbsp;</td>
				<td width="8%">&nbsp;部门&nbsp;</td>
				<td width="8%">&nbsp;职位&nbsp;</td>
			</tr>
		    <tbody id="body_result">
		    	<c:forEach items="${list}" var="iterator">
		    		<tr class="pg_result_content">
		    			<td align="center" nowrap>
		    				<input name="subBox" type="checkbox" />
		    				<input name="orgcdid" type="hidden"  value="${iterator.orgcdid}"/>
		    				<input name="orgshortname" type="hidden"  value="${iterator.orgshortname}"/>
		    			</td>
		    			<% num++;%>
		    			<td align="center" nowrap><%=num %></td>						
						<td align="left" nowrap>${iterator.orgname}</td>
						<td align="left" nowrap>${iterator.orgshortname}</td>
						<td align="center" nowrap>${iterator.regioniddict}</td>
						<td align="center" nowrap><dict:select id="depid" name="depid" busiDictTypeId="OA_COMMON_Department" cssClass="input_select2"></dict:select></td>
						<td align="center" nowrap><dict:select id="posid" name="posid" busiDictTypeId="OA_COMMON_Position" cssClass="input_select2"></dict:select></td>
		    		</tr>
		    	</c:forEach>	
		    </tbody>
		</table>
	</div>
	<div class="div_result_button">
		<table>
		  <tr>
			<td>			
				 <input name="search" id="search" type="button" class="btn" value="确&nbsp;认" onClick="btn_sure();"/>		
			</td>
		  </tr>
		</table>
  </div>
</c:if>
</body>
</html>