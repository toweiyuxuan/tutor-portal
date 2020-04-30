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
<form id="queryForm" action="${path}/prelease_info" method="post">
	<table style="border:solid 1px #ccc;width:100%;height: 554px;" >
		<tr height="50" align="right" valign="middle">	
			<td colspan="6" align="left" valign="middle" style="border:solid 1px #ccc;">
				<div class="helper-dialog-footer helper-noselect">
					<div style="float:left;">行政区域</div>		
					<s:select style="cursor:pointer;height:20px;color:gray;float:left;" 
							  list="#{'1':'呈贡区','2':'官渡区','3':'西山区','4':'五华区','5':'盘龙区'}" 
							  name="query.PArea" 
							  headerKey="" headerValue="---不-限 ---">
					</s:select>
					<div style="float:left;">学生年级</div>						
					<s:select style="cursor:pointer;height:20px;color:gray;float:left;" 
							  list="#{'1':'一年级','2':'二年级','3':'三年级','4':'四年级','5':'五年级','6':'六年级','7':'七年级','8':'八年级','9':'九年级','10':'高一','11':'高二','12':'高三'}" 
							  name="query.PGrade" 
							  headerKey="" headerValue="---不-限 ---">
					</s:select>
					<div style="float:left;">辅导学科</div>	
					<s:select style="cursor:pointer;height:20px;color:gray;float:left;" 
							  list="#subjectList" 
							  name="query.PSubjecttype"
							  headerKey="" 
							  headerValue="---不-限 ---" 
							  listKey="SName" 
							  listValue="SName">
					</s:select>
					&emsp;
					<div style="float:left;" id="query" class="helper-dialog-yes">点击查询</div>
				</div>
			</td>	
		</tr>
		<tr height="50" align="center" valign="middle">
			<th style="border: 0;">发布时间</th>
			<th style="border: 0;">家长昵称</th>
			<th style="border: 0;">家教区域</th>
			<th style="border: 0;">学生年级</th>
			<th style="border: 0;width: 380px;">辅导学科</th>
			<th style="border: 0;">操作</th>
		</tr>
		<s:iterator value="#page.list" var="prelease">
			<tr align="center" bgcolor="#FFFFFF" valign="middle" height="38">
				<td><s:date name="#prelease.RTime" format="yyyy-MM-dd"/></td>
				<td>
					<s:property value="#prelease.PName"/>
				</td>
				<td>
					<s:if test="#prelease.PArea==1">呈贡区</s:if>
					<s:if test="#prelease.PArea==2">官渡区</s:if>
					<s:if test="#prelease.PArea==3">西山区</s:if>
					<s:if test="#prelease.PArea==4">五华区</s:if>
					<s:if test="#prelease.PArea==5">盘龙区</s:if>
				</td>
				<td>
					<s:if test="#prelease.PGrade==1">一年级</s:if>
					<s:if test="#prelease.PGrade==2">二年级</s:if>
					<s:if test="#prelease.PGrade==3">三年级</s:if>
					<s:if test="#prelease.PGrade==4">四年级</s:if>
					<s:if test="#prelease.PGrade==5">五年级</s:if>
					<s:if test="#prelease.PGrade==6">六年级</s:if>
					<s:if test="#prelease.PGrade==7">七年级</s:if>
					<s:if test="#prelease.PGrade==8">八年级</s:if>
					<s:if test="#prelease.PGrade==9">九年级</s:if>
					<s:if test="#prelease.PGrade==10">高一</s:if>
					<s:if test="#prelease.PGrade==11">高二</s:if>
					<s:if test="#prelease.PGrade==12">高三</s:if>
				</td>
				<td>
					<s:property value="#prelease.PSubjecttype"/>
				</td>
				<td>
					<input id="id" type="hidden" value="<s:property value="#session.user.UId"/>">
					<input id="sfinfo" type="hidden" value="<s:property value="#session.user.USf"/>">
					<a href="javascript:void(0);" onclick="ckxq(<s:property value="#prelease.RId"/>)"><font color="blue">查看详情</font></a>
				</td>
			</tr>
		</s:iterator>	
		<tr></tr>
		<tr height="50" align="center" valign="middle">
			<td colspan="6"  align="left" style="border: 0px;">
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
			title: "家教信息详情",
			iframe: "${path}/prelease_detail?prelease.RId="+id,
			yesText: "我要报名",
			width: 1200,
			contentHeight: 380,
			fullscreen: true,
			yesCallback: function () 
			{
				if(sfinfo == 2)
				{
					$.ajax
					({
						url:"${path}/ajax_si_signup",
						type:"post",
						async:false,
						dataType:"text",
						data:{"prelease.RId":id,"teacher.UId":uid},
						success:function (result) 
						{
							if(result=="success")
							{
								alert( "报名成功！");
							}
							else if(result=="no")
							{
								alert( "报名失败,您的信息未完善！");
							}
							else if(result=="ex")
							{
								alert( "报名失败,此条信息你可能已经报过名了！");
							}
							else
							{
								alert( "报名失败,原因未知！");
							}
						},
					});
				}
				if(sfinfo == 1)
				{
					alert( "你是家长，不可以报名哦！" );
				}
				if(sfinfo == 3)
				{
					alert( "当前身份为机构，不可以报名哦！" );
				}
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