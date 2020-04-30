<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center" style="margin-top:100px">
<img width="100" alt="" src="${path}/main/images/tip.png"><br>
<font size="20" color="skyblue">修改成功！</font>
</div>
<br><br>
<div class="helper-dialog-footer helper-noselect">
	<div style="float:inherit;width: 50px;margin-left: 350px;" align="center" class="helper-dialog-yes" id="qd">确定</div>
</div>
</body>
<script>
$("#qd").click(function()
{
	window.parent.location.reload();
});
</script>	
</html>