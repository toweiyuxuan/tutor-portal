<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
<%@ include file="head.jsp"%>
<div class="inside_wrap" id="iframe" style="background-color:#FFFFFF;">
	<div class="inside_con">
		<div class="adr">
			<a href="${path}/JJ_main">首页</a>&nbsp;>&nbsp;密码找回
		</div>
		<div class="register_box">
			<div class="tc_login">
				<div class="login_register fl">
					<h1 align="center">重置密码</h1>
					<form id="Form" method="POST" name="form_register" target="_top">						
						<div align="center">	
							<i class="icon-mobile-phone"></i>
							<input name="user.UTel" type="text" id="phone" placeholder="请输入手机号码" autocomplete="off" class="input_yh" regr="^1[3456789]\d{9}$" tip="请输入正确的11位手机号码"><br>
							<input name="yzm" type="text" id="yzm" placeholder="请输入验证码" autocomplete="off" class="input_el" regr="^[0-9]{6}$" tip="请输入6位由数字组成的验证码">							
							<input style="cursor:pointer;background-color:transparent; width: 150px;height:30px;margin-left: 280px;color: skyblue;margin-top:0px;border: none;" id="btn" name="btn" value="发送验证码" type="button"/>						
						</div>
						<span align="left"  style="display:none;color:red;margin-left: 100px;" id="error"></span><br>
						<div align="center">
							<input style="width: 320px;" id="submit" type="button" class="button" value="提交重置密码">
						</div>
					</form>
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
$("#submit").click(function() 
{	
	//成功标识
	var isOk = validForm();
	if(isOk)
	{
		$("#error").hide();
		$.ajax
		({
			url:"${path}/ajax_u_resetPassword",
			type:"post",
			async:false,
			dataType:"text",
			data:{"user.UTel":startTel},
			success:function (result) 
			{
				if(result=="success")
				{
					Helper.ui.dialog
					({
						title: "重置成功！",
						content: "您的密码已重置为 123456，请尽快登录修改！",
						yesCallback: function () 
						{
							window.location.href = "${path}/JJ_main";
						},
						noCallback: function () 
						{
							window.location.href = "${path}/JJ_main";
						}
					});
				}
			},
		});
	}
}); 
function validForm()
{
	//表单的提交标志
	var isSubmit = true;
	$("#Form").find("[regr]").each(function()
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
		if(result == "no")
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
		if(result != "no")
		{
			//设置提示信息
			$("#error").html("该手机号不存在！");
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