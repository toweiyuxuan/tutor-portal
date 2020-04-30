<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="taglibs.jsp" %>
<%@ include file="tcc.jsp" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>昆明中小学家教服务中心</title>
<script type="text/javascript">
setInterval("document.getElementById('sp_time1').innerHTML = new Date().toLocaleString() + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());", 500);
setInterval("document.getElementById('sp_time2').innerHTML = new Date().toLocaleString() + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());", 500);
setInterval("document.getElementById('sp_time3').innerHTML = new Date().toLocaleString() + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());", 500);
setInterval("document.getElementById('sp_time4').innerHTML = new Date().toLocaleString() + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());", 500);
</script>
<script>
    var ua = navigator.userAgent.toLowerCase();
    var isWeixin = ua.indexOf('micromessenger') != -1;
    if (isWeixin) 
    {
    	alert("请点击右上角，选择浏览器打开本站！");
    }
</script>
</head>
<body>
<!--页面顶部-->
<div class="header_wrap">
	<div class="header">
		<span class="wel_word fl">欢迎访问昆明中小学家教服务中心网站！</span>
		<span class="corner fr">
			<ul>
				<li id="zc"><a href="${path}/JJ_register">注册</a>|</li>
				<li id="dl" class="login_li"><a  href="javascript:void(0);" class="tc">登录</a></li>
				<li id="loginName" class="user_li nLi">
					<a href="javascript:void(0);">
						<s:property value="#session.user.UTel"/>
						,欢迎您!
        			</a>
					<div class="user_handle">
						<s:if test="#session.user.USf==1">
							<a href="${path}/parent_parent">个人中心</a>
						</s:if>
						<s:if test="#session.user.USf==2">
							<a href="${path}/teacher_teacher">个人中心</a>
						</s:if>
						<s:if test="#session.user.USf==3">
							<a href="${path}/mechanism_mechanism">机构中心</a>
						</s:if>
						<a href="${path}/ajax_u_logout">退出账户</a>
					</div>
				</li>
			</ul>
		</span>
		<div class="clear"></div>
	</div>
	<div id="gray"></div>				
	<div class="popup" id="popup">				
		<div class="top_nav" id='top_nav'>
			<div align="center">
				<i></i>
				<span>登录账号</span>
				<a class="guanbi"></a>
			</div>
		</div>					
		<div class="min">					
			<div class="tc_login">											
				<div class="login_register">
					<form id="loginForm" action="#" method="post">
						<div align="center">
							<span class="error">手机号或者密码错误</span>
							<span class="forbid">该账户已被禁用，无法登陆！</span>
							<i class="icon-mobile-phone"></i>
							<input type="text" maxlength="11" name="user.UTel" id="name" placeholder="用户注册手机号码" autocomplete="off" class="input_yh">
							<input type="password" maxlength="8" name="user.UPassword" id="pass" placeholder="密码" autocomplete="off" class="input_mm">
						</div>
						
						<div class="user">
							<input type="checkbox" name="user" id="user" value="记住用户" class="r_user" />记住用户
							<a href="${path}/JJ_returnPassword">忘记密码？</a>
						</div>
						
						<div align="center">
							<input style="width: 220px;" id="login_ok" type="button" class="button" value="登录">
						</div>
						<div align="center"><a href="${path}/JJ_register">立即注册！</a></div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>

<!--页面菜单栏-->
<div class="nav_menu">
	<a href="${path}/JJ_main" class="logo fl"><img src="${path}/main/images/logo.png" /></a>
	<div class="nav_list fr">
		<ul id="nav" class="nav clearfix">
			<li class="nLi"></li>
			<li class="nLi">
				<h3><a href="${path}/JJ_about">中心概况</a></h3>
			</li>
			<li id="prelease" class="nLi">
				<h3><a href="javascript:void(0);" id="fbjj">发布家教信息</a></h3>
			</li>
			<li id="tsignup" class="nLi">
				<h3><a href="#zjj">找家教工作</a></h3>
			</li>
			<li class="nLi">
				<h3><a href="#zjg">找机构</a></h3>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
</div>

<!--页面图片轮播-->
<div class="banner">
	<div class="bd">
		<iframe src="${path}/JJ_tupianlunbo" style="width:100%;float:right;height:600px" scrolling="no" name="jjxx" frameborder="0"></iframe>
	</div>
	<div class="clear"></div>
</div>

<!--公告信息-->
<div class="notice_wrap">
	<div class="notice">
		<div class="bd fl">
			<b>通知公告：</b>
			<ul class="infoList">
				<li><span class="date" id="sp_time1" style="color: gray;"></span><a href="javascript:void(0);">欢迎使用昆明市中小学家教服务中心平台</a></li>
				<li><span class="date" id="sp_time2" style="color: gray;"></span><a href="javascript:void(0);">欢迎使用昆明市中小学家教服务中心平台...</a></li>
				<li><span class="date" id="sp_time3" style="color: gray;"></span><a href="javascript:void(0);">欢迎使用昆明市中小学家教服务中心平台</a></li>
				<li><span class="date" id="sp_time4" style="color: gray;"></span><a href="javascript:void(0);">欢迎使用昆明市中小学家教服务中心平台...</a></li>
			</ul>
		</div>
		<a href="javascript:void(0);" class="more fr">更多+</a>
	</div>
	<div class="clear"></div>
</div>

<!--家长发布信息板块-->
<a name="zjj"></a><!-- 锚点 -->
<div class="content">
	<div class="box1">
		<div class="fl">
			<div class="about">
				<div class="b_title">
					<h3>家长发布信息</h3>
					<a href="javascript:void(0);" class="more">更多+</a>
				</div>
				<iframe src="${path}/prelease_info" style="width:100%;float:right;height:543px;" scrolling="no" name="jjxx" frameborder="0"></iframe>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>

<!-- 机构信息板块 -->
<a name="zjg"></a><!-- 锚点 -->
<div class="content">
	<!--schoolmate-->
	<div class="schoolmate">
		<div class="b_title">
			<h3>机构信息</h3>
			<a href="javascript:void(0);" class="more">更多+</a>
		</div>
		<div class="b_wrap">
			<div class="hd">
				<a class="next"></a>
				<a class="prev"></a>
			</div>
			<div class="s_list bd">
				<ul>
					<s:iterator value="#page.list" var="mechanism">
						<s:if test="#mechanism.MHomepage==null">
							<li onclick="mechanismpage(<s:property value="#mechanism.UId"/>)"><a href="javascript:void(0);"><img src="${path}/main/images/ert.jpg"/><span><s:property value="#mechanism.MName"/></span></a></li>	
						</s:if>
						<s:else>
							<li onclick="mechanismpage(<s:property value="#mechanism.UId"/>)"><a href="javascript:void(0);"><img src="${path}/<s:property value="#mechanism.MHomepage"/>"/><span><s:property value="#mechanism.MName"/></span></a></li>
						</s:else>
					</s:iterator>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>

<!--机构发布信息板块-->
<a name="zjj"></a><!-- 锚点 -->
<div class="content">
	<div class="box1">
		<div class="fl">
			<div class="about">
				<div class="b_title">
					<h3>机构发布信息</h3>
					<a href="javascript:void(0);" class="more">更多+</a>
				</div>
				<iframe src="${path}/mr_info" style="width:100%;float:right;height:543px" scrolling="no" name="jjxx" frameborder="0"></iframe>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>
	
<!-- 友情链接板块 -->
<div class="content">
	<div class="clear"></div>
	<!--friendly link-->
	<div class="friendlink">
		<b>友情链接：</b>
		<a href="https://blog.csdn.net/qq_36260974">友情链接</a>
		<a href="https://blog.csdn.net/qq_36260974">友情链接</a>
		<a href="https://blog.csdn.net/qq_36260974">友情链接</a>
		<a href="https://blog.csdn.net/qq_36260974">友情链接</a>
		<a href="https://blog.csdn.net/qq_36260974">友情链接</a>
	</div>	
</div>

<!-- 页面底部 -->
<div class="footer_wrap">
	<div class="line"></div>
	<div class="footer">
		<p>昆明市中小学家教服务中心</p>
		<p>电话：0871-00000000&nbsp;&nbsp;&nbsp;邮箱：weiyuxuan_kyf@163.com</p>
		<p>地址：云南省昆明市xxx</p>
		<img src="${path}/main/images/foot.png" class="er" />
	</div>
</div>

<!-- 页面的联系我们 -->
<%@ include file="contact.jsp"%>

</body>
<script type="text/javascript" src="${path}/main/js/zhuyesuoyoucaozuo.js"></script>
</html>