$(function() 
{
	if(self!=top)
	{  
	    //不是顶层页面  
	    alert("您的登陆已超时，请重新登陆！");  
	    top.location.href="${path}/JJ_main";  
	}
	
	$(".error").hide();
	$(".forbid").hide();
	if(user=="null"||user=="")
	{
		$("#loginName").hide();
		$("#dl").show();
		$("#zc").show();
	}
	else
	{
		$("#loginName").show();
		$("#dl").hide();
		$("#zc").hide();
	}
	
	document.getElementById("fbjj").onclick = function()
	{
		if(user=="null"||user=="")
		{
			alert("您还未登陆，请先登录！");
			/*window.location.href="${path}/jj_login";*/
		}
		else
		{
			alert("家长请到个人中心进行发布！");
		}
	};
	
	$("#login_ok").click(function() 
	{	
		var user = $("#name").val();
		var pass = $("#pass").val();
		
		$.ajax({
			url:"${path}/ajax_u_login",
			type:"post",
			async:false,
			dataType:"text",
			data:{"user.UTel":user,"user.UPassword":pass},
			success:function (result) 
			{
				if(result=="success")
				{
					$(".error").hide();
					$(".forbid").hide();
					$("#gray").hide(1500);
					$("#popup").hide(1500);
					setTimeout(function(){window.location.href = "${path}/JJ_main";},1000);
				}
				if(result=="forbid")
				{
					$(".forbid").show();
					$(".error").hide();
				}
				if(result=="fail")
				{
					$(".error").show();
					$(".forbid").hide();
				}
			},
		});
	});	
});

function mechanismpage(id)
{
	Helper.ui.dialog(
	{
		title: "机构信息详情",
		iframe: "${path}/m_mechanismpage?mechanism.UId="+id,
		width: 1200,
		contentHeight:600,
		showButton: false,
		contentScroll: false,
	});
}

jQuery(".notice").slide({mainCell:".bd ul",autoPage:true,effect:"top",autoPlay:true,vis:1});
jQuery(".schoolmate .b_wrap").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"left",autoPlay:true,vis:5,trigger:"click"});

