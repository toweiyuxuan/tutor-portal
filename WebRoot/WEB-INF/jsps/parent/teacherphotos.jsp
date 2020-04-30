<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
</head>	
<body>
<div class="helper-dialog-footer helper-noselect">
	<div style="float:left;width: 50px;" align="center" class="helper-dialog-yes" onclick="javascript:history.back(-1);">返回</div>
</div>
<div align="center">
	<s:iterator value="#tphotos.list" var="photo">
		<span style="margin:10px;float: left;border:2px solid #FAFAFA;border-style:dotted;">
			<img src="${path}/<s:property value="#photo.tpAddress"/>" width="200" height="130">
		</span>
	</s:iterator>
	<s:if test="#tphotos.list.isEmpty()">
		<div style="background-color:#FFFFF0;border:10px solid #F7F7F7;border-style:double;">
			<br><br><br><br>
			<font color="skyblue"><h1>ta 还没有上传图片！</h1></font><br><br><br>
		</div>
	</s:if>
</div>
</body>
</html>