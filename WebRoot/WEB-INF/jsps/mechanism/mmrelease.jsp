<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td,th
{ 
	border:solid 1px #f6f5ec; font-size:12px; height:30px;
}
</style>
<script type="text/javascript">	
$(function() 
{
	$("#query").click(function() 
	{	
		$("#pageNo").val(1);
		$("#queryForm").submit();
	});
});
</script>
</head>
<body>
<%@ include file="../head.jsp"%>
<div class="inside_wrap" id="iframe">
	<div class="inside_con">
		<div class="adr">
			<a href="${path}/JJ_main">首页</a>&nbsp;>&nbsp;<a href="${path}/parent_parent">用户相关></a>&nbsp;我发布的
		</div>
		<div style="background-color:#ffffff;" align="center">
			<div class="helper-dialog-footer helper-noselect">
				<div style="float:left;width: 50px;" class="helper-dialog-yes" id="back">返回</div>
				<div style="float:left;" class="helper-dialog-yes" id="detele">删除选中</div>
			</div>
			<form id="queryForm" action="${path}/mr_mmrelease" method="post">
			<table style="table-layout:fixed;border:solid 1px #f6f5ec;background-color:#FFFFFF" border="1" height="410">
				<tr height="50" align="center" valign="middle">
					<th width="110px">
						<a href="javascript:void(0);" id="all" style="color: blue">全选</a>
						<a href="javascript:void(0);" id="not" style="color: blue">全不选</a>
						<a href="javascript:void(0);" id="cle" style="color: blue">反选</a>
					</th>
					<th width="80px">发布时间</th>
					<th width="80px">机构名称</th>
					<th width="100px">机构标签</th>
					<th width="100px">机构特点</th>
					<th width="60px">所在区域</th>
					<th width="100px">机构地址</th>
					<th width="100px">机构介绍</th>
					<th width="80px">性别限制</th>
					<th width="100px">身份限制</th>
					<th width="100px">联系方式</th>
					<th width="70px">操作</th>
				</tr>
				<s:iterator value="#page.list" var="mrelease">
					<tr align="center" valign="middle" height="30">
						<td>
							<input name="wyx" type="checkbox" value="<s:property value="#mrelease.RId"/>">
						</td>
						<td><s:date name="#mrelease.RTime" format="yyyy-MM-dd"/></td>
						<td title="<s:property value="#mrelease.MName"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#mrelease.MName"/>
						</td>
						<td title="<s:property value="#mrelease.MMechanismtype"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#mrelease.MMechanismtype"/>
						</td>
						<td title="<s:property value="#mrelease.MTedian"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#mrelease.MTedian"/>
						</td>
						<td>
							<s:if test="#mrelease.MArea==1">呈贡区</s:if>
							<s:if test="#mrelease.MArea==2">官渡区</s:if>
							<s:if test="#mrelease.MArea==3">西山区</s:if>
							<s:if test="#mrelease.MArea==4">五华区</s:if>
							<s:if test="#mrelease.MArea==5">盘龙区</s:if>
						</td>
						<td title="<s:property value="#mrelease.MAddress"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#mrelease.MAddress"/>
						</td>
						<td title="<s:property value="#mrelease.MIntroduce"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#mrelease.MIntroduce"/>
						</td>
						
						<td>
			            	<s:if test="#mrelease.MLimitgender==0">不限</s:if>
							<s:if test="#mrelease.MLimitgender==1">限男生</s:if>
							<s:if test="#mrelease.MLimitgender==2">限女生</s:if>
						</td>
						<td title="<s:property value="#mrelease.MTeachertype"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">	
							<s:property value="#mrelease.MTeachertype"/>
						</td>
						<td title="<s:property value="#mrelease.MContact"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#mrelease.MContact"/>
						</td>
						<td>
							<a href="javascript:void(0);" style="color: blue;" onclick="shanchu(<s:property value="#mrelease.RId"/>)">删除</a>
						</td>
					</tr>
				</s:iterator>
				<tr></tr>
				<tr height="50">
					<td colspan="14">
						<input id="id" type="hidden" name="mechanism.UId" value="<s:property value="#session.user.UId"/>">			
						<%@ include file="../tools/paging.jsp" %>
					</td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</div>
<!-- 页面底部 -->
<%@ include file="../foot.jsp"%>
</body>
<script>
//获取按钮
var all = document.getElementById("all");
var not = document.getElementById("not");
var cle = document.getElementById("cle");
//获取所有复选框
var inputs = document.getElementsByName("wyx");
//全选
all.onclick = function () 
{
	for (var i = 0; i < inputs.length; i++) 
	{
		inputs[i].checked = true;
	}
};
//全不选
not.onclick = function () 
{
	for (var i = 0; i < inputs.length; i++) 
	{
		inputs[i].checked = false;
	}
};
//反选
cle.onclick = function () 
{
	for (var i = 0; i < inputs.length; i++) 
	{
		if (inputs[i].checked == true) 
		{
			inputs[i].checked = false;
		} 
		else 
		{
			inputs[i].checked = true;
		}
	}
}

$("#back").click(function()
{
	window.location.href = "${path}/mechanism_mechanism";
});

$("#detele").click(function()
{
	var uid = $("#id").val();
	var count="no";
	for (var i = 0; i < inputs.length; i++) 
	{
		if (inputs[i].checked == true) 
		{
			count="yes";
		}
	}
	if(count == "no")
	{
		alert("没有选择任何记录！");
	}
	else
	{
		Helper.ui.dialog
		({
			title: "提示信息",
			content: "该操作不可恢复，确定要删除吗？",
			yesCallback: function () 
			{
				
					for (var i = 0; i < inputs.length; i++) 
					{
						if (inputs[i].checked == true) 
						{	
							$.ajax
							({
							    url: "${path}/mr_detele?mrelease.RId="+inputs[i].value,
							    type: "post",
							    success: function (result) 
							    {
								}
							});
						}
						if(i == inputs.length-1)
						{
							//alert("删除成功！");
							window.location.href = "${path}/mr_mmrelease?mechanism.UId="+uid;
						}
					}
				}
		});
	}
});

function shanchu(id)
{
	var uid = $("#id").val();
	Helper.ui.dialog
	({
		title: "提示信息",
		content: "该操作不可恢复，确定要删除吗？",
		yesCallback: function () 
		{
			$.ajax
			({
			    url: "${path}/mr_detele?mrelease.RId="+id,
			    type: "post",
			    success: function (result) 
			    {
			    	if(result=="success")
					{
						//弹窗
						//alert("删除成功！");
						window.location.href = "${path}/mr_mmrelease?mechanism.UId="+uid;
					}
					else
					{
						alert("删除失败！");
					}
			 	}
			});
			
		},
		noCallback: function () 
		{
			//取消删除
		}
	});
}
</script>
</html>