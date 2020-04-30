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
	<input id="id" type="hidden" name="mechanism.UId" value="<s:property value="#session.user.UId"/>">
	<div style="float:right;" class="helper-dialog-yes"  id="xg">修改基本信息</div>
</div>
<table style="background-image:url(${path}/main/images/x.jpg);background-size: 100% 100%;"height="500px">
	<tr height="40">
		<td width="100" align="right">机构名称：</td>
		<td><s:property value="mechanism.MName"/></td>
	</tr>
	<tr height="40">
		<td align="right">机构标签：</td>
		<td>
			<s:iterator value="#mechanismtypeList" var="mechanismtype">
				<s:if test="#mechanismtype.select=='yes'">
					<s:property value="#mechanismtype.MName"/>/
				</s:if>
			</s:iterator>
		</td>
	</tr>
	<tr height="40">
		<td align="right">所在区域：</td>
		<td>
			<s:if test="mechanism.MArea==1">呈贡区</s:if>
			<s:if test="mechanism.MArea==2">官渡区</s:if>
			<s:if test="mechanism.MArea==3">西山区</s:if>
			<s:if test="mechanism.MArea==4">五华区</s:if>
			<s:if test="mechanism.MArea==5">盘龙区</s:if>
		</td>
	</tr>
	<tr height="40">
		<td align="right">联系方式：</td>
		<td><s:property value="mechanism.MContact"/></td>
	</tr>
	<tr height="60">
		<td align="right">机构地址：</td>
		<td><s:property value="mechanism.MAddress"/></td>
	</tr>
	<tr height="100" valign="top">
		<td align="right">机构特点：</td>
		<td><s:property value="mechanism.MTedian"/></td>
	</tr>
	<tr height="100" valign="top">
		<td align="right">机构介绍：</td>
		<td><s:property value="mechanism.MIntroduce"/></td>
	</tr>
	<tr></tr>
</table>
<s:if test="mechanism.MHomepage == null">
	<div style="position:absolute;top:120px;left:550px;">
		<img id="id_img" src="${path}/main/images/ert.jpg" width="160" />
	</div>
</s:if>
<s:if test="mechanism.MHomepage != null">
	<div style="position:absolute;top:120px;left:550px;">
		<img id="id_img" src="${path}<s:property value="mechanism.MHomepage"/>" width="160" />
	</div>
</s:if>	
</div>
</body>
<script type="text/javascript">

var id = $("#id").val();

$("#xg").click(function() 
{
	window.location.href = "${path}/m_update?mechanism.UId="+id;
});
</script>
</html>