<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>昆明市中小学家教服务中心-修改密码</title>
</head>
<body style="background-color: white;">
<div class="tc_login">
	<div style="width: 800px;" align="center" class="login_register fl">
		<form id="registerForm" action="#" method="post">
			<div align="center">
				<span style="display:none;color:red;" id="error"></span><br>
				<i class="icon-mobile-phone"></i>
				<input name="originpassword" type="password" id="originpassword" placeholder="请输入原密码(字母或数字组成)"class="input_mm" regr="^[0-9a-zA-Z]{6,8}$" tip="请输入6-8位由数字和字母组成的原密码"><br>
				<input name="user.UPassword" type="password" id="password" placeholder="请输入新密码(字母或数字组成)" class="input_mm" regr="^[0-9a-zA-Z]{6,8}$" tip="请输入6-8位由数字和字母组成的新密码"><br>
				<input name="repassword" type="password" id="repassword" placeholder="请确认新密码(字母或数字组成)" class="input_mm" regr="^[0-9a-zA-Z]{6,8}$" tip="请输入6-8位由数字和字母组成的确认新密码"><br>    
			</div>
		</form>
		<div align="center">
			<input id="id" type="hidden" name="parent.UId" value="<s:property value="#session.user.UId"/>">
			<input style="width: 155px;" id="back" type="button" class="button" value="返回">
			<input style="width: 155px;" id="register_ok" type="button" class="button" value="提交">
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
var id = $("#id").val();

$("#back").click(function()
{
	window.location.href = "${path}/p_parenthome?parent.UId="+id;
});
$("#originpassword").click(function() 
{
	$("#error").hide();
});
$("#repassword").click(function() 
{
	$("#error").hide();
});
$("#password").click(function() 
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
		var originpassword = $("#originpassword").val();
		$.ajax
		({
			url:"${path}/ajax_t_updatepass",
			type:"post",
			async:true,
			dataType:"text",
			data:{"originpassword":originpassword,"user.UPassword":pass,"user.UId":id},
			success:function (result) 
			{
				if(result=="success")
				{
					//弹窗
					alert("修改成功");
					window.location.href = "${path}/p_parenthome?parent.UId="+id;
				}
				if(result=="fail")
				{
					$("#error").html("原密码不正确！");
					$("#error").show();
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
		if(name == "repassword" )
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
			//获得密码的值
			var originpassword = $("#originpassword").val();
			if(originpassword == val)
			{
				//设置提示信息
				$("#error").html("新密码的设置不能与原密码相同！");
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

</script>
</html>