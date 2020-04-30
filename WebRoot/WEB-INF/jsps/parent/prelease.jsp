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
			<form id="queryForm" action="${path}/prelease_prelease" method="post">
			<table style="table-layout:fixed;border:solid 1px #f6f5ec;background-color:#FFFFFF" border="1" height="410">
				<tr height="50" align="center" valign="middle">
					<th width="110px">
						<a href="javascript:void(0);" id="all" style="color: blue">全选</a>
						<a href="javascript:void(0);" id="not" style="color: blue">全不选</a>
						<a href="javascript:void(0);" id="cle" style="color: blue">反选</a>
					</th>
					<th width="80px">发布时间</th>
					<th width="80px">家长昵称</th>
					<th width="60px">家教区域</th>
					<th width="80px">具体地址</th>
					<th width="60px">学生性别</th>
					<th width="60px">学生年级</th>
					<th width="60px">辅导学科</th>
					<th width="60px">学生性格</th>
					<th width="60px">报酬范围</th>
					<th width="60px">性别限制</th>
					<th width="60px">身份限制</th>
					<th width="80px">其他说明</th>
					<th width="60px">报名人数</th>
					<th width="70px">操作</th>
				
				</tr>
				<s:iterator value="#page.list" var="parent">
					<tr align="center" valign="middle" height="30">
						<td>
							<input name="wyx" type="checkbox" value="<s:property value="#parent.RId"/>">
						</td>
						<td><s:date name="#parent.RTime" format="yyyy-MM-dd"/></td>
						<td title="<s:property value="#parent.PName"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#parent.PName"/>
						</td>
						<td>
							<s:if test="#parent.PArea==1">呈贡区</s:if>
							<s:if test="#parent.PArea==2">官渡区</s:if>
							<s:if test="#parent.PArea==3">西山区</s:if>
							<s:if test="#parent.PArea==4">五华区</s:if>
							<s:if test="#parent.PArea==5">盘龙区</s:if>
						</td>
						<td title="<s:property value="#parent.PAddress"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#parent.PAddress"/>
						</td>
						<td>
							<s:if test="#parent.PGender==1">男</s:if>
							<s:if test="#parent.PGender==2">女</s:if>
						</td>
						<td>
							<s:if test="#parent.PGrade==1">一年级</s:if>
							<s:if test="#parent.PGrade==2">二年级</s:if>
							<s:if test="#parent.PGrade==3">三年级</s:if>
							<s:if test="#parent.PGrade==4">四年级</s:if>
							<s:if test="#parent.PGrade==5">五年级</s:if>
							<s:if test="#parent.PGrade==6">六年级</s:if>
							<s:if test="#parent.PGrade==7">七年级</s:if>
							<s:if test="#parent.PGrade==8">八年级</s:if>
							<s:if test="#parent.PGrade==9">九年级</s:if>
							<s:if test="#parent.PGrade==10">高一</s:if>
							<s:if test="#parent.PGrade==11">高二</s:if>
							<s:if test="#parent.PGrade==12">高三</s:if>
						</td>
						<td title="<s:property value="#parent.PSubjecttype"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#parent.PSubjecttype"/>
						</td>
						<td>
							<s:if test="#parent.PCharacter==1">外向型</s:if>
							<s:if test="#parent.PCharacter==2">内向型</s:if>
							<s:if test="#parent.PCharacter==3">理智型</s:if>
							<s:if test="#parent.PCharacter==4">情绪型</s:if>
							<s:if test="#parent.PCharacter==5">意志型</s:if>
							<s:if test="#parent.PCharacter==6">中间型</s:if>
						</td>
						<td>
							<s:if test="#parent.PMoney==1">&lt;40</s:if>
							<s:if test="#parent.PMoney==2">40-50</s:if>
							<s:if test="#parent.PMoney==3">50-60</s:if>
							<s:if test="#parent.PMoney==4">60-70</s:if>
							<s:if test="#parent.PMoney==5">&gt;70</s:if>
						</td>
						<td>
			            	<s:if test="#parent.PLimitgender==0">不限</s:if>
							<s:if test="#parent.PLimitgender==1">限男生</s:if>
							<s:if test="#parent.PLimitgender==2">限女生</s:if>
						</td>
						<td title="<s:property value="#parent.PLimitteachertype"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">	
							<s:property value="#parent.PLimitteachertype"/>
						</td>
						<td  title="<s:property value="#parent.POther"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#parent.POther"/>
						</td>
						<td title="点击查看报名信息" style="cursor:pointer;" onclick="chakan(<s:property value="#parent.RId"/>)">
							<s:if test="#parent.siCount != 0"><font color="red"><s:property value="#parent.siCount"/><font></s:if>
							<s:else><s:property value="#parent.siCount"/></s:else>
						</td>
						<td>
							<a href="javascript:void(0);" style="color: blue;" onclick="shanchu(<s:property value="#parent.RId"/>)">删除</a>
						</td>
					</tr>
				</s:iterator>
				<tr></tr>
				<tr height="50">
					<td colspan="16">
						<input id="id" type="hidden" name="parent.UId" value="<s:property value="#session.user.UId"/>">			
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
	window.location.href = "${path}/parent_parent";
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
						    url: "${path}/prelease_detele?prelease.RId="+inputs[i].value,
						    type: "post",
						    async:false,
						    success: function (result) 
						    {
							}
						});
					}
					if(i == inputs.length-1)
					{
						//alert("删除成功！");
						window.location.href = "${path}/prelease_prelease?parent.UId="+uid;
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
			    url: "${path}/prelease_detele?prelease.RId="+id,
			    type: "post",
			    success: function (result) 
			    {
			    	if(result=="success")
					{
						//弹窗
						//alert("删除成功！");
						window.location.href = "${path}/prelease_prelease?parent.UId="+uid;
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
function chakan(id)
{
	
	var uid = $("#id").val();
	
	Helper.ui.dialog
	({
		title: "报名人员信息",
		iframe: "${path}/si_signuppeople?prelease.RId="+id+"&prelease.UId="+uid,
		yesText: "确定",
		width: 1200,
		contentHeight: 500,
		yesCallback: function () 
		{
			
		},
		noCallback: function () 
		{
			//alert( "取消" );
		}
	});
}
</script>
</html>