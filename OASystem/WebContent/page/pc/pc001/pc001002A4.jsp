<%@page language="java" import="com.lw.oa.common.util.URIUtil" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../../pgcommon/head.jsp"%>
<%
	String basePath = URIUtil.getURI(request);
%>
<base href="<%=basePath%>">
<script type="text/javascript">
/*
*名       称: btn_apply()
*输入参数: 无
*输出参数: 无
*机       能: 申请
*创 建  者: yuliang          
*创建时间: 2015-12-23
*更 新  者: 
*更新时间: 
*/
function btn_apply() {	
	if ( !$.fn.autovalidateForm("addForm") ){
		return;
	}
	var applystarthm = $("#applystarthm").val();
	var applyendhm = $("#applyendhm").val();
	var applystart = $("#applystart").val();
	var applyend = $("#applyend").val();
	if(!checkTimeBgnEndDate( applystart, applyend, applystarthm, applyendhm)){
		alert( Message.getString( "MSG_COMM_0012", "预订出差时间"));
		return;
	}
	if ( !window.confirm( Message.getString("MSG_IC_COMM_0018"))) 
		return;
	c_ShowProgressBar(); 
	$("#addForm").attr( "action", "pc001002save.do");	
	$("#addForm").submit();	
}
/*
*名       称: btn_back()
*输入参数: 无
*输出参数: 无
*机       能: 返回
*创 建  者: yuliang          
*创建时间: 2015-09-16
*更 新  者: 
*更新时间: 
*/
function btn_back() {	
	c_ShowProgressBar(); 
	$("#addForm").attr( "action", "pc001002back.do");	
	$("#addForm").submit();
}
//初始化
$(document).ready(function(){
	//初始化时间
	$('#applystart').val('<c:out value="${command.currentdate}" />');
	$('#applyend').val('<c:out value="${command.currentdate}" />');
	$('input[name="ticketdetail[0].orderdate"]').val('<c:out value="${command.currentdate}" />');
	$('input[name="ticketdetail[1].orderdate"]').val('<c:out value="${command.currentdate}" />');
	$('input[name="ticketdetail[2].orderdate"]').val('<c:out value="${command.currentdate}" />');
	$('input[name="ticketdetail[3].orderdate"]').val('<c:out value="${command.currentdate}" />');
	$('#applystarthm').val('09:00');
	$('#applyendhm').val('17:30');
	//获取orgcdid
	var orgcdid = $('#managerorgcdid').val();
	$.ajax({
		async: false,
		data:"",
		type:"GET",
		dataType: 'json',
		url:'<%= request.getContextPath()%>/common/ajax/getDepsByOrgcdid.do?flg='+escape(new Date())+'&orgcdid='+escape(orgcdid),
		success:function(data){			
			addOptions( data, 'managerdepid', 3);
			addOptions( data, 'personneldepid', 1);
			addOptions( data, 'vicepresidepid', 0);
			addOptions( data, 'presidepid', 0);
			addOptions( data, 'personfiledepid', 1);
		},
		error:function(data){
			alert(Message.getString("ERROR_COMM_0037")); 
			flg = false;
			return;
		}		
	});
	//获取部门经理审核人员列表
	var managerdepid = $('#managerdepid').val();
	$.ajax({
		async: false,
		data:"",
		type:"GET",
		dataType: 'json',
		url:'<%= request.getContextPath()%>/common/ajax/getEmpsByOrgcdDepid.do?flg='+escape(new Date())+'&orgcdid='+escape(orgcdid)+'&depid='+escape(managerdepid),
		success:function(data){			
			addOptions( data, 'managercheckid', 0);
		},
		error:function(data){
			alert(Message.getString("ERROR_COMM_0037")); 
			flg = false;
			return;
		}		
	});
	//获取人事审核人员列表
	var personneldepid = $('#personneldepid').val();
	$.ajax({
		async: false,
		data:"",
		type:"GET",
		dataType: 'json',
		url:'<%= request.getContextPath()%>/common/ajax/getEmpsByOrgcdDepid.do?flg='+escape(new Date())+'&orgcdid='+escape(orgcdid)+'&depid='+escape(personneldepid),
		success:function(data){			
			addOptions( data, 'personnelcheckid', 0);
		},
		error:function(data){
			alert(Message.getString("ERROR_COMM_0037")); 
			flg = false;
			return;
		}		
	});
	//获取副总审核人员列表
	var vicepresidepid = $('#vicepresidepid').val();
	$.ajax({
		async: false,
		data:"",
		type:"GET",
		dataType: 'json',
		url:'<%= request.getContextPath()%>/common/ajax/getEmpsByOrgcdDepid.do?flg='+escape(new Date())+'&orgcdid='+escape(orgcdid)+'&depid='+escape(vicepresidepid),
		success:function(data){			
			addOptions( data, 'vicepresicheckid', 0);
		},
		error:function(data){
			alert(Message.getString("ERROR_COMM_0037")); 
			flg = false;
			return;
		}		
	});
	//获取总经理审核人员列表
	var presidepid = $('#presidepid').val();
	$.ajax({
		async: false,
		data:"",
		type:"GET",
		dataType: 'json',
		url:'<%= request.getContextPath()%>/common/ajax/getEmpsByOrgcdDepid.do?flg='+escape(new Date())+'&orgcdid='+escape(orgcdid)+'&depid='+escape(presidepid),
		success:function(data){			
			addOptions( data, 'presicheckid', 0);
		},
		error:function(data){
			alert(Message.getString("ERROR_COMM_0037")); 
			flg = false;
			return;
		}		
	});
	//获取人事归档人员列表
	var personfiledepid = $('#personfiledepid').val();
	$.ajax({
		async: false,
		data:"",
		type:"GET",
		dataType: 'json',
		url:'<%= request.getContextPath()%>/common/ajax/getEmpsByOrgcdDepid.do?flg='+escape(new Date())+'&orgcdid='+escape(orgcdid)+'&depid='+escape(personfiledepid),
		success:function(data){			
			addOptions( data, 'personfilecheckid', 0);
		},
		error:function(data){
			alert(Message.getString("ERROR_COMM_0037")); 
			flg = false;
			return;
		}		
	});
});
</script>
</head>
<body>
<form id="addForm" action="" method="post" >
	<input id="applyempid" name="applyempid" type="hidden" value="${command.applyempid}" />
	<input id="applytype" name="applytype" type="hidden" value="${command.applytype}" />
	<input id="sourceid" name="sourceid" type="hidden" />	
	<%/*共通隐藏字段 start*/%>
	<input name="pc001001searchcommand.empid" type="hidden"  value="${command.pc001001searchcommand.empid}" />
	<input name="pc001001searchcommand.empname" type="hidden"  value="${command.pc001001searchcommand.empname}" />
	<input name="pc001001searchcommand.applytype" type="hidden"  value="${command.pc001001searchcommand.applytype}" />
	<%/*共通隐藏字段 end*/%>	 
	<div class="div_navi"><span><img src="<%= request.getContextPath()%>/resources/images/home.png">&nbsp;您当前的位置：申请管理&nbsp;&gt;&nbsp;申请单填写&nbsp;&gt;&nbsp;出差申请</span></div>
	<jsp:include page="../../pgcommon/Apply_A4Edit.jsp"></jsp:include>	
	<div class="div_result_button">
		<table class="tb_result">
			<tr>
				<td align="right">					
					<input name="search" id="search" type="button" class="btn" value="申&nbsp;请" onClick="btn_apply();"/>
					<input name="button" id="reset" type="button" class="btn" value="返&nbsp;回" onClick="btn_back();" />
				</td>
	      	</tr>
		</table>
	</div>
</form>
</body>
</html>