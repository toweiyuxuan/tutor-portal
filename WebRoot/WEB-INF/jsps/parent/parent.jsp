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
<%@ include file="../head.jsp"%>
<div class="inside_wrap">
	<div class="inside_con">
		<div class="adr">
			<a href="${path}/JJ_main">首页</a>&nbsp;>&nbsp;<a href="${path}/parent_parent">用户相关></a>&nbsp;个人中心
		</div>
		<div class="inside_box">
			<div class="sidemenu fl">
				<div class="s_title">用户相关</div>
				<ul>
					<li><a id="grzx" href="" target="iframe">个人中心</a></li>
					<li><a id="xgpass" href="" target="iframe">修改密码</a></li>
					<li><a id="fabu" href="">我发布的</a></li>
				</ul>
			</div>
			<div class="ic_wrap fr" id="iframe">
				<div class="personal_box">
					<div class="info_box">
						<input id="id" type="hidden" name="parent.UId" value="<s:property value="#session.user.UId"/>">
						<iframe name="iframe" id="home" style="width:100%;height:700px;" scrolling="no" frameborder="0"></iframe>
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<!-- 页面底部 -->
<%@ include file="../foot.jsp"%>
</body>

<script type="text/javascript">
$(function()
{	
	/* 加载就需要把个人信息查出来 */
	var id = $("#id").val();
	var content = document.getElementById("home");
	content.src="${path}/p_parenthome?parent.UId="+id;
	
	/* 回到个人中心就不会刷新整个页面了 */
	$("#grzx").click(function() 
	{
		var content = document.getElementById("grzx");
		content.href="${path}/p_parenthome?parent.UId="+id;
	});	
	$("#fabu").click(function() 
	{
		var content = document.getElementById("fabu");
		content.href="${path}/prelease_prelease?parent.UId="+id;
	});
	$("#xgpass").click(function() 
	{
		var content = document.getElementById("xgpass");
		content.href="${path}/parent_updatepass";
	});
});
</script>
</html>