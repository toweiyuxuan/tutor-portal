<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@taglib prefix="s" uri="/struts-tags"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8" />
<meta name="keywords" content="昆明市中小学家教服务中心" />
<meta name="description" content="昆明市中小学家教服务中心" />

<!-- css样式文件 -->
<link rel="stylesheet" type="text/css" href="${path}/main/css/style.css" />
<link rel="stylesheet" type="text/css" href="${path}/main/css/popup.css"/>
<link rel="stylesheet" type="text/css" href="${path}/contact/css/contact.css"/>

<!-- js脚本文件 -->
<script src="${path}/main/js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="${path}/main/js/jquery.SuperSlide.2.1.js" type="text/javascript"></script>
<script src="${path}/main/js/common.js"></script>
<script src="${path}/main/js/iscroll-zoom.js"></script>
<script src="${path}/main/js/hammer.js"></script>
<script src="${path}/main/js/lrz.all.bundle.js"></script>
<script src="${path}/main/js/jquery.photoClip.js"></script>

<script type="text/javascript">
$(document).ready(function () 
{
	//平台、设备和操作系统
    var system = 
    {
        win: false,
        mac: false,
        xll: false
    };
    //检测平台
    var p = navigator.platform;
    system.win = p.indexOf("Win") == 0;
    system.mac = p.indexOf("Mac") == 0;
    system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
    //跳转语句
    if (system.win || system.mac || system.xll) 
    {
  	 
    } 
    else 
    {
		window.onload=()=>
		{
			document.getElementsByTagName("body")[0].style.height = document.body.scrollHeight+"px";
			document.getElementsByTagName("body")[0].style.width  = document.body.scrollWidth+"px";
		}
    }
 });
</script>


<script type="text/javascript">
	var ischoose = true;
	//从session中拿到用户信息
	var user='<%=session.getAttribute("user")%>';
</script>

<script type="text/javascript">
	boxheight(); //执行函数
	function boxheight(){ //函数：获取尺寸
	    //获取浏览器窗口高度
	    var winHeight=0;
	    if (window.innerHeight)
	    {
	        winHeight = window.innerHeight;
	    }
	    else if ((document.body) && (document.body.clientHeight))
	    {
	    	 winHeight = document.body.clientHeight;
	    }
	       
	    //通过Document对body进行检测，获取浏览器可视化高度
	    if (document.documentElement && document.documentElement.clientHeight)
	    {
	    	 winHeight = document.documentElement.clientHeight;
	    }
	    //DIV高度为浏览器窗口高度
	    document.getElementById("iframe").style.height= winHeight +"px";
	}
	window.onresize=boxheight; //窗口或框架被调整大小时执行
</script>

<title>昆明市中小学家教服务中心</title>
</head>
<body>

</body>
</html>