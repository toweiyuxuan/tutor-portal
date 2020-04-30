<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jjInfo</title>
<style>
select
{
  border:1px solid #c9c9c9;
  background-color:#fff;
  color:#666;
  height:20px;
  width:80px;
  line-height:28px;
  padding:4px 6px;
  font-size:14px;
  border-radius:4px;
  cursor:pointer;
  outline:none;
}
td
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
<form id="queryForm" action="${path}/mr_info" method="post">
	<table style="border:solid 1px #ccc;width:100%;height: 554px;" >
		<tr height="50" align="right" valign="middle">	
			<td colspan="7" align="left" valign="middle" style="border:solid 1px #ccc;">
				<div class="helper-dialog-footer helper-noselect">
					<div style="float:left;">行政区域</div>		
					<s:select style="cursor:pointer;height:20px;color:gray;float:left;" 
							  list="#{'1':'呈贡区','2':'官渡区','3':'西山区','4':'五华区','5':'盘龙区'}" 
							  name="query.MArea" 
							  headerKey="" headerValue="---不-限 ---">
					</s:select>
					&emsp;
					<div style="float:left;" id="query" class="helper-dialog-yes">点击查询</div>
				</div>
			</td>
		</tr>
		<tr height="50" align="center" valign="middle">
			<th style="border: 0;">发布时间</th>
			<th style="border: 0;">机构名称</th>
			<th style="border: 0;">所在区域</th>
			<th style="border: 0;">机构地址</th>
			<th style="border: 0;">招聘老师类型</th>
			<th style="border: 0;">招聘老师性别</th>
			<th style="border: 0;">操作</th>
		</tr>
		<s:iterator value="#page.list" var="mrelease">
			<tr align="center" bgcolor="#FFFFFF" valign="middle" height="38">
				<td><s:date name="#mrelease.RTime" format="yyyy-MM-dd"/></td>
				<td>
					<s:property value="#mrelease.MName"/>
				</td>
				<td>
					<s:if test="#mrelease.MArea==1">呈贡区</s:if>
					<s:if test="#mrelease.MArea==2">官渡区</s:if>
					<s:if test="#mrelease.MArea==3">西山区</s:if>
					<s:if test="#mrelease.MArea==4">五华区</s:if>
					<s:if test="#mrelease.MArea==5">盘龙区</s:if>
				</td>
				<td>
					<s:property value="#mrelease.MAddress"/>
				</td>
				<td>
					<s:property value="#mrelease.MTeachertype"/>
				</td>
				<td>
					<s:if test="#mrelease.MLimitgender==0">[不限]</s:if>
					<s:if test="#mrelease.MLimitgender==1">限制男生</s:if>
					<s:if test="#mrelease.MLimitgender==2">限制女生</s:if>
				</td>
				<td>
					<input id="id" type="hidden" value="<s:property value="#session.user.UId"/>">
					<input id="sfinfo" type="hidden" value="<s:property value="#session.user.USf"/>">
					<a href="javascript:void(0);" onclick="ckxq(<s:property value="#mrelease.RId"/>)"><font color="blue">查看详情</font></a>
				</td>
			</tr>
		</s:iterator>	
		<tr></tr>
		<tr height="50" align="center" valign="middle">
			<td colspan="7"  align="left" style="border: 0px;">
				<%@ include file="../tools/paging.jsp" %>
			</td>
		</tr>
	</table>
</form>
</body>
<script type="text/javascript">
var uid = $("#id").val();
var sfinfo = $("#sfinfo").val();
function ckxq(id)
{
	if(user=="null"||user=="")
	{
		alert("您还未登陆，请先登录！");
	}
	else
	{
		Helper.ui.dialog(
		{
			title: "机构发布信息详情",
			iframe: "${path}/mr_detail?mrelease.RId="+id,
			yesText: "确定",
			width: 1200,
			contentHeight: 380,
			fullscreen: true,
			yesCallback: function () 
			{
			},
			noCallback: function () 
			{
				//alert( "取消" );
			}
		});
	}
}
</script>
</html>