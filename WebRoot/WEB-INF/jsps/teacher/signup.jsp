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
</head>
<body>
<%@ include file="../head.jsp"%>
<div class="inside_wrap" id="iframe">
	<div class="inside_con">
		<div class="adr">
			<a href="${path}/JJ_main">首页</a>&nbsp;>&nbsp;<a href="${path}/teacher_teacher">用户相关></a>&nbsp;我发布的
		</div>
		<div style="background-color:#ffffff;" align="center">
			<div class="helper-dialog-footer helper-noselect">
				<div style="float:left;width: 50px;" class="helper-dialog-yes" id="back">返回</div>
				<div style="float:left;" class="helper-dialog-yes" id="detele">撤销选中</div>
			</div>
			<form id="Form" action="${path}/b_tbaoming" method="post">
			<table style="table-layout:fixed;border:solid 1px #f6f5ec;background-color:#FFFFFF" border="1" height="410">
				<tr height="50" align="center" valign="middle">
					<th width="110px">
						<a href="javascript:void(0);" id="all" style="color: blue">全选</a>
						<a href="javascript:void(0);" id="not" style="color: blue">全不选</a>
						<a href="javascript:void(0);" id="cle" style="color: blue">反选</a>
					</th>
					<th width="80px">发布时间</th>
					<th width="80px">报名时间</th>
					<th width="80px">家长昵称</th>
					<th width="60px">家教区域</th>
					<th width="80px">具体地址</th>
					<th width="60px">学生性别</th>
					<th width="60px">学生年级</th>
					<th width="60px">辅导学科</th>
					<th width="60px">学生性格</th>
					<th width="60px">报酬范围</th>
					<th width="60px">性别限制</th>
					<th width="80px">身份限制</th>
					<th width="80px">其他说明</th>
					<th width="60px">操作</th>
				</tr>
				<s:iterator value="#page.list" var="baoming">
					<tr align="center" valign="middle" height="30">
						<td>
							<input name="wyx" type="checkbox" value="<s:property value="#baoming.siId"/>">
						</td>
						<td><s:date name="#baoming.RTime" format="yyyy-MM-dd"/></td>
						<td><s:date name="#baoming.siTime" format="yyyy-MM-dd"/></td>
						<td>
							<s:property value="#baoming.PName"/>
						</td>
						<td>
							<s:if test="#baoming.PArea==1">呈贡区</s:if>
							<s:if test="#baoming.PArea==2">官渡区</s:if>
							<s:if test="#baoming.PArea==3">西山区</s:if>
							<s:if test="#baoming.PArea==4">五华区</s:if>
							<s:if test="#baoming.PArea==5">盘龙区</s:if>
						</td>
						<td title="<s:property value="#baoming.PAddress"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#baoming.PAddress"/>
						</td>
						<td>
							<s:if test="#baoming.PGender==1">男</s:if>
							<s:if test="#baoming.PGender==2">女</s:if>
						</td>
						<td>
							<s:if test="#baoming.PGrade==1">一年级</s:if>
							<s:if test="#baoming.PGrade==2">二年级</s:if>
							<s:if test="#baoming.PGrade==3">三年级</s:if>
							<s:if test="#baoming.PGrade==4">四年级</s:if>
							<s:if test="#baoming.PGrade==5">五年级</s:if>
							<s:if test="#baoming.PGrade==6">六年级</s:if>
							<s:if test="#baoming.PGrade==7">七年级</s:if>
							<s:if test="#baoming.PGrade==8">八年级</s:if>
							<s:if test="#baoming.PGrade==9">九年级</s:if>
							<s:if test="#baoming.PGrade==10">高一</s:if>
							<s:if test="#baoming.PGrade==11">高二</s:if>
							<s:if test="#baoming.PGrade==12">高三</s:if>
						</td>
						<td title="<s:property value="#baoming.PSubjecttype"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#baoming.PSubjecttype"/>
						</td>
						<td>
							<s:if test="#baoming.PCharacter==1">外向型</s:if>
							<s:if test="#baoming.PCharacter==2">内向型</s:if>
							<s:if test="#baoming.PCharacter==3">理智型</s:if>
							<s:if test="#baoming.PCharacter==4">情绪型</s:if>
							<s:if test="#baoming.PCharacter==5">意志型</s:if>
							<s:if test="#baoming.PCharacter==6">中间型</s:if>
						</td>
						<td>
							<s:if test="#baoming.PMoney==1">&lt;40</s:if>
							<s:if test="#baoming.PMoney==2">40-50</s:if>
							<s:if test="#baoming.PMoney==3">50-60</s:if>
							<s:if test="#baoming.PMoney==4">60-70</s:if>
							<s:if test="#baoming.PMoney==5">&gt;70</s:if>
						</td>
						<td>
			            	<s:if test="#baoming.PLimitgender==0">不限</s:if>
							<s:if test="#baoming.PLimitgender==1">限男生</s:if>
							<s:if test="#baoming.PLimitgender==2">限女生</s:if>
						</td>
						<td title="<s:property value="#baoming.PLimitteachertype"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">	
							<s:property value="#baoming.PLimitteachertype"/>
						</td>
						<td  title="<s:property value="#baoming.POther"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
							<s:property value="#baoming.POther"/>
						</td>
						<td>
							<a href="javascript:void(0);" style="color: blue;" onclick="shanchu(<s:property value="#baoming.siId"/>)">撤销</a>
						</td>
					</tr>
				</s:iterator>
				<tr></tr>
				<tr height="50">
					<td colspan="15">
						<input id="id" type="hidden" name="teacherid" value="<s:property value="#session.user.UId"/>">			
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
	window.location.href = "${path}/teacher_teacher";
});

$("#detele").click(function()
{
	var teacherid = $("#id").val();
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
			content: "该操作不可恢复，确定要撤销吗？",
			yesCallback: function () 
			{
				for (var i = 0; i < inputs.length; i++) 
				{
					if (inputs[i].checked == true) 
					{	
						$.ajax
						({
						    url: "${path}/si_detele?signup.siId="+inputs[i].value,
						    type: "post",
						    success: function (result) 
						    {
						    	//alert("删除成功！");
							}
						});
					} 
				}
				if(i == inputs.length-1)
				{
					//alert("删除成功！");
					window.location.href = "${path}/si_signup?teacher.UId="+teacherid;				
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
		content: "该操作不可恢复，确定要撤销吗？",
		yesCallback: function () 
		{
			$.ajax
			({
			    url: "${path}/si_detele?signup.siId="+id,
			    type: "post",
			    success: function (result) 
			    {
			    	if(result=="success")
					{
						//弹窗
						//alert("撤销成功！");
						window.location.href = "${path}/si_signup?teacher.UId="+uid;
					}
					else if(result=="success")
					{
						alert("撤销失败！");
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