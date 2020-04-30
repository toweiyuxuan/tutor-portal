<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
tr,td{font-size:16px;font-family:'Microsoft YaHei';}
</style>
</head>
<body>
<div align="center">
<h3 align="left">
&nbsp;基本信息
</h3>
<div class="helper-dialog-footer helper-noselect">
	<input id="id" type="hidden" name="teacher.UId" value="<s:property value="#session.user.UId"/>">
	<div style="float:right;" class="helper-dialog-yes"  id="xiugai">修改信息</div>
</div>
<table style="background-image:url(${path}/main/images/tt.jpg);background-size: 100% 100%;">
	<tr>
		<td width="120" align="right">姓名：</td>
		<td><s:property value="teacher.TName"/></td>
	</tr>
	<tr>
		<td align="right">性别：</td>
		<td>
			<s:if test="teacher.TGender==1">男</s:if>
			<s:if test="teacher.TGender==2">女</s:if>
		</td>
	</tr>
	<tr height="40">
		<td align="right">年龄：</td>
		<td><s:property value="teacher.TAge"/></td>
	</tr>
	<tr height="40">
		<td align="right">毕业学校：</td>
		<td><s:property value="teacher.TSchool"/></td>
	</tr>
	<tr height="40">
		<td align="right">身份类型：</td>
		<td><s:property value="teacher.teachertype.ttName"/></td>
	</tr>
	<tr height="40">
		<td align="right">专业：</td>
		<td><s:property value="teacher.TMajor"/></td>
	</tr>
	<tr height="40">
		<td align="right">地址：</td>
		<td><s:property value="teacher.TAddress"/></td>
	</tr>
	<tr height="100" valign="top">
		<td align="right">自我介绍：</td>
		<td><s:property value="teacher.TIntroduce"/></td>
	</tr>
	<tr height="100" valign="top">
		<td align="right">经验简介：</td>
		<td><s:property value="teacher.TExperience"/></td>
	</tr>
</table>
<br>
<s:if test="teacher.TWechat == null">
	<div style="position:absolute;top:120px;left:550px;">
		<img id="id_img" src="${path}/main/images/we.jpg" width="160" />
	</div>
</s:if>
<s:if test="teacher.TWechat != null">
	<div style="position:absolute;top:120px;left:550px;">
		<img id="id_img" src="${path}<s:property value="teacher.TWechat"/>" width="160" />
	</div>
</s:if>	
</div>
</body>
<script type="text/javascript">
$(function()
{
	var id = $("#id").val();
	$("#xiugai").click(function() 
	{
		window.location.href = "${path}/t_update?teacher.UId="+id;
	});
});
</script>
</html>