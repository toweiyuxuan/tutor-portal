<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../head.jsp"%>
	<!--inside content start-->
	<div class="inside_wrap">
		<div class="inside_con">
			<div class="adr">
				<a href="JJ_main">首页</a>&nbsp;>&nbsp;用户相关>&nbsp;机构中心
			</div>
			<div class="inside_box">
				<div class="sidemenu fl">
					<div class="s_title">用户相关</div>
					<ul>
						<li><a id="jbxx" href="" target="iframe">机构基本信息</a></li>
						<li><a id="xgpass" href="" target="iframe">修改密码</a></li>
						<li><a id="xiangce" href="" target="iframe">机构相册</a></li>
						<li><a id="fabu" href="${path}/mr_mrelease" target="iframe">发布招聘信息</a></li>
						<li><a id="yifabu" href="">已发布信息</a></li>
					</ul>
				</div>
				<div class="ic_wrap fr" id="iframe">
					<div class="personal_box">
						<div class="info_box">
							<input id="id" type="hidden" name="teacher.UId" value="<s:property value="#session.user.UId"/>">
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
	/* 加载就需要把信息查出来 */
	var id = $("#id").val();
	var content = document.getElementById("home");
	content.src="${path}/m_mechanismhome?mechanism.UId="+id;
	
	/* 回就不会刷新整个页面了 */
	$("#jbxx").click(function() 
	{
		var content = document.getElementById("jbxx");
		content.href="${path}/m_mechanismhome?mechanism.UId="+id;
	});
	$("#xiangce").click(function() 
	{
		var content = document.getElementById("xiangce");
		content.href="${path}/mp_photo?mechanism.UId="+id;
	});
	$("#yifabu").click(function() 
	{
		var content = document.getElementById("yifabu");
		content.href="${path}/mr_mmrelease?mechanism.UId="+id;
	});
	$("#xgpass").click(function() 
	{
		var content = document.getElementById("xgpass");
		content.href="${path}/mechanism_updatepass";
	});
});
</script>
</html>