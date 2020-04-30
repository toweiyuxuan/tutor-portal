<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>昆明市中小学家教服务中心-注册</title>

<script type="text/javascript">
var InterValObj; //timer变量，控制时间
var count = 60; //间隔函数，1秒执行
var curCount;//当前剩余秒数

function sendMessage() 
{
    curCount = count;
    $("#btn").attr("disabled", "true");
    $("#btn").val(curCount + "秒后可重新发送");
    InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
}
//timer处理函数
function SetRemainTime() 
{
    if (curCount == 0) 
    {
        window.clearInterval(InterValObj);//停止计时器
        $("#btn").removeAttr("disabled");//启用按钮
        $("#btn").val("重新发送验证码");
    } 
    else 
    {
        curCount--;
        $("#btn").val(curCount + "秒后可重新发送");
    }
}
</script>
<style>
select
{
  border:1px solid #c9c9c9;
  background-color:#fff;
  color:#666;
  border-radius:4px;
  cursor:pointer;
  outline:none;
}
</style>
</head>
<body>
<%@ include file="head.jsp"%>
<div class="inside_wrap" id="iframe" style="background-color:#FFFFFF;">
	<div class="inside_con">
		<div class="adr">
			<a href="${path}/JJ_main">首页</a>&nbsp;>&nbsp;用户注册
		</div>
		<div class="register_box">
			<div class="tc_login">
				<div class="login_register fl">
					<form id="registerForm" action="#" method="post">
						<div align="center">
							<span style="display:none;color:red;" id="error"></span><br>
							<i class="icon-mobile-phone"></i>
							<s:select cssStyle="width:415px;height:50px;color:gray;" id="sf" list="#{'0':'请选择注册身份','1':'学生家长','2':'家教老师' }" name="user.USf" regr="^[1-2]$" tip="请选择注册身份"></s:select><br>
							<s:if test="">
							</s:if>
							<input name="user.UTel" type="text" id="phone" placeholder="请输入手机号码" autocomplete="off" class="input_yh" regr="^1[3456789]\d{9}$" tip="请输入正确的11位手机号码"><br>
							<input name="yzm" type="text" id="yzm" placeholder="请输入验证码" autocomplete="off" class="input_el" regr="^[0-9]{6}$" tip="请输入6位由数字组成的验证码">	
							<input style="cursor:pointer;background-color:transparent; width: 280px;height:30px;margin-left: 280px;color: skyblue;margin-top:0px;border: none;" id="btn" name="btn" value="发送验证码" type="button"/>
							<input name="user.UPassword" type="password" id="password" placeholder="请输入密码(字母或数字组成)" autocomplete="off" class="input_mm" regr="^[0-9a-zA-Z]{6,8}$" tip="请输入6-8位由数字和字母组成的密码">
							<input name="repassword" type="password" id="repassword" placeholder="请确认密码" autocomplete="off" class="input_mm" regr="^[0-9a-zA-Z]{6,8}$" tip="请输入6-8位由数字和字母组成的确认密码">      
						</div>
					</form>
					<div align="center">
						<input style="width: 320px;" id="register_ok" type="button" class="button" value="注册"><br>
					</div>
				</div>
				<div class="l_img fl">
					<img src="${path}/main/images/sj.jpg"/>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
<!-- 页面底部 -->
<%@ include file="foot.jsp"%>
</body>
<script type="text/javascript">

var syzm="";
var startTel="";

$("#phone").click(function() 
{
	$("#error").hide();
});
$("#yzm").click(function() 
{
	$("#error").hide();
});

//提交按钮点击以后
$("#register_ok").click(function() 
{	
	//成功标识
	var isOk = validForm();
	if(isOk)
	{
		$("#error").hide();
		var pass = $("#password").val();
		var shenfen = $("#sf").val();
		$.ajax
		({
			url:"${path}/ajax_u_register",
			type:"post",
			async:false,
			dataType:"text",
			data:{"user.UTel":startTel,"user.UPassword":pass,"user.USf":shenfen},
			success:function (result) 
			{
				if(result=="success")
				{
					//弹窗
					Helper.ui.dialogSuccess( "提示信息", "注册成功！" );
					setTimeout(function(){window.location.href = "${path}/JJ_main";},1000);
				}
				else
				{
					$(".error").show();
				}
			},
		});
	}
}); 

function validForm()
{
	//表单的提交标志
	var isSubmit = true;
	$("#registerForm").find("[regr]").each(function()
	{
		//获得每一个必填项的输入信息
		var val = $(this).val();
		//获得每一个必填项的正则表达式
		var regStr = $(this).attr("regr");
		//获得每一个必填项的提示信息
		var tip = $(this).attr("tip");
		//创建正则表达式的对象
		var reg = new RegExp(regStr);
		//获得每一个文本域的name
		var name = $(this).attr("name");
		if(!reg.test(val))
		{
			//设置提示信息
			$("#error").html(tip);
			//展示提示信息
			$("#error").show();
			//设置提交标志是false
			isSubmit = false;
			//跳出校验循环
			return false;
		}
		if(name == "yzm")
		{
			if(syzm != val)
			{
				//设置提示信息
				$("#error").html("验证码不正确！");
				//展示提示信息
				$("#error").show();
				//设置提交标志是false
				isSubmit = false;
				//跳出校验循环
				return false;
			}
		}
		if(name == "repassword")
		{
			//获得密码的值
			var password = $("#password").val();
			if(password != val)
			{
				//设置提示信息
				$("#error").html("确认密码不一致");
				//展示提示信息
				$("#error").show();
				//设置提交标志是false
				isSubmit = false;
				//跳出校验循环
				return false;
			}
		}
	});
	return isSubmit;
}

$("#btn").click(function() 
{
	var phone = $("#phone").val();
	var regStr = $("#phone").attr("regr");
	var tip = $("#phone").attr("tip");
	var reg = new RegExp(regStr);
	if(!reg.test(phone))
	{
		$("#error").html(tip);
		$("#error").show();
		isSubmit = false;
		return false;
	}
	else
	{
		$("#error").hide();
		var result = validUname(phone);
		if(result != "no")
		{
			sendMessage();
			startTel = phone;
			/* $.ajax
			({
				url:"${path}/ajax_u_sendMessage",
				type:"post",
				data:
				{
					"user.UTel":phone
				},
				async:false,
				dataType:"text",
				success:function(result)
				{
					syzm = result;
				}
			}); */
			syzm=111111;
		}
		if(result == "no")
		{
			//设置提示信息
			$("#error").html("该手机号已被注册！");
			//展示提示信息
			$("#error").show();
			//设置提交标志是false
			isSubmit = false;
			//跳出校验循环
			return false;
		}
	}
});

//校验用户名是否已存在
function validUname(username)
{
	var result = "yes";
	$.ajax
	({
		url:"${path}/ajax_u_validUname",
		type:"post",
		data:
		{
			"user.UTel":username
		},
		async:false,
		dataType:"text",
		success:function(responseText)
		{
			result = responseText;
		}
	});
	return result;		
}
</script>
</html>