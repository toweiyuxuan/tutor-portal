<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="background-color: white;">
	<div align="center" style="margin-top:100px">
		<img width="100" alt="" src="${path}/main/images/tip.png"><br>
		<font size="20" color="skyblue">提交成功！</font>
	</div>
	<br><br>
	<div align="center">
		<h3 style="color: skyblue">
			成功&nbsp;<s:property value="#UploadbackCount.success"/>&nbsp;个&nbsp;&nbsp;
			失败&nbsp;<s:property value="#UploadbackCount.fail"/>&nbsp;个
			<s:if test="#UploadbackCount.fail != 0">
				<font color="red">失败原因：图片数量已达最大值！<font>
			</s:if>
		</h3>
	</div>
	<br>
	<div class="helper-dialog-footer helper-noselect">
		<input id="id" type="hidden" value="<s:property value="#ID"/>">
		<div style="float:inherit;width: 50px;margin-left: 350px;" align="center" class="helper-dialog-yes" id="qd">确定</div>
	</div>
</div>
</body>
<script>
$("#qd").click(function()
{
	var id = $("#id").val();
	window.location.href = "${path}/tp_photo?teacher.UId="+id;
});
</script>	
</html>