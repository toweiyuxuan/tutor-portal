<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
tr,td{font-size:16px;font-family:'Microsoft YaHei';}
</style>
</head>
<body>
<div align="center">
<h3 align="left">
&nbsp;基本信息
</h3>
<div class="helper-dialog-footer helper-noselect">
	<s:if test="parent.user.UIsfinish==2 && parent.PName != null">
		<div style="float:right;" class="helper-dialog-yes" id="fb">发布信息</div>
	</s:if>
	<div style="float:right;" class="helper-dialog-yes" id="xg">修改信息</div>
</div>
<table style="background-image:url(${path}/main/images/parent.jpg);background-size: 100% 100%;">
	<tr height="40">
		<td width="180" align="right">家长昵称：</td>
		<td><s:property value="parent.PName"/></td>
	</tr>
	<tr height="40">
		<td align="right">学生性别：</td>
		<td>
			<s:if test="parent.PGender==1">男</s:if>
			<s:if test="parent.PGender==2">女</s:if>
		</td>
	</tr>
	<tr height="40">
		<td align="right">学生性格特点：</td>
		<td>
			<s:if test="parent.PCharacter==1">外向型</s:if>
			<s:if test="parent.PCharacter==2">内向型</s:if>
			<s:if test="parent.PCharacter==3">理智型</s:if>
			<s:if test="parent.PCharacter==4">情绪型</s:if>
			<s:if test="parent.PCharacter==5">意志型</s:if>
			<s:if test="parent.PCharacter==6">中间型</s:if>
		</td>
	</tr>
	<tr height="40">
		<td align="right">学生年级：</td>
		<td>
			<s:if test="parent.PGrade==1">一年级</s:if>
			<s:if test="parent.PGrade==2">二年级</s:if>
			<s:if test="parent.PGrade==3">三年级</s:if>
			<s:if test="parent.PGrade==4">四年级</s:if>
			<s:if test="parent.PGrade==5">五年级</s:if>
			<s:if test="parent.PGrade==6">六年级</s:if>
			<s:if test="parent.PGrade==7">七年级</s:if>
			<s:if test="parent.PGrade==8">八年级</s:if>
			<s:if test="parent.PGrade==9">九年级</s:if>
			<s:if test="parent.PGrade==10">高一</s:if>
			<s:if test="parent.PGrade==11">高二</s:if>
			<s:if test="parent.PGrade==12">高三</s:if>
		</td>
	</tr>
	<tr height="40">
		<td align="right">辅导学科：</td>
		<td>
			<% int a=0;%>
			<s:iterator value="#subjectList" var="subject">
				<s:if test="#subject.select=='yes'">
					<s:property value="#subject.SName"/>/
					<% a++;%>
				</s:if>
			</s:iterator>
			<% if(a==0){%>[不限]<%}%>
		</td>
	</tr>
	<tr height="40">
		<td align="right">家教区域：</td>
		<td>
			<s:if test="parent.PArea==1">呈贡区</s:if>
			<s:if test="parent.PArea==2">官渡区</s:if>
			<s:if test="parent.PArea==3">西山区</s:if>
			<s:if test="parent.PArea==4">五华区</s:if>
			<s:if test="parent.PArea==5">盘龙区</s:if>
		</td>
	</tr>
	<tr height="40">
		<td align="right">具体地址：</td>
		<td> <s:property value="parent.PAddress"/></td>
	</tr>
	<tr height="40">
		<td align="right">报酬范围：</td>
		<td>
			<s:if test="parent.PMoney==1">&lt;40</s:if>
			<s:if test="parent.PMoney==2">40-50</s:if>
			<s:if test="parent.PMoney==3">50-60</s:if>
			<s:if test="parent.PMoney==4">60-70</s:if>
			<s:if test="parent.PMoney==5">&gt;70</s:if>
		</td>
	</tr>
	<tr height="40">
		<td align="right">家教老师性别限制：</td>
		<td>
			<s:if test="parent.PLimitgender==0">不限</s:if>
			<s:if test="parent.PLimitgender==1">限男生</s:if>
			<s:if test="parent.PLimitgender==2">限女生</s:if>
		</td>
	</tr>
	<tr height="40">
		<td align="right">家教老师身份限制：</td>
		<td>
			<% int b=0;%>
			<s:iterator value="#teacherList" var="teacher">
				 <s:if test="#teacher.select=='yes'">
				 	<s:property value="#teacher.ttName"/>/
				 	<% b++;%>
				 </s:if>
			</s:iterator>
			<% if(b==0){%>[不限]<%}%>
		</td>
	</tr>
	<tr height="100" valign="top">
		<td align="right">其他说明：</td>
		<td><s:property value="parent.POther"/></td>
	</tr>
	<tr height="40">
		<td align="right">身份认证：</td>
		<td>
			<s:if test="parent.user.UAttestation==1">
				<a id="qrz" href="javascript:void(0);"><font size="4" color="red">去认证</font></a>
			</s:if>
			<s:if test="parent.user.UAttestation==2">
				<font size="3" color="red">审核中！</font>
			</s:if>
			<s:if test="parent.user.UAttestation==3">
				<a id="qrz" href="javascript:void(0);"><font size="4" color="red">审核未通过，重新认证！</font></a>
			</s:if>
			<s:if test="parent.user.UAttestation==4">
				<font size="3" color="blue">已通过</font>
			</s:if>
		</td>
	</tr>
</table>
<input id="id" type="hidden" name="parent.UId" value="<s:property value="#session.user.UId"/>">	
<br>
<s:if test="parent.user.UIsfinish==1 || parent.PName == null">
<div align="left">
	<font color="skyblue" size="2">
	&emsp;&nbsp;温馨提示：<br><br>
	&emsp;&nbsp;当您看到我的时候，说明您的身份信息不完善，或者审核还未通过。
	</font>
</div>
</s:if>  	
</div>
</body>
<script type="text/javascript">

var id = $("#id").val();

$("#qrz").click(function() 
{
	window.location.href = "${path}/parent_attestation";
});

$("#fb").click(function() 
{
	Helper.ui.dialog
	({
		title: "发布家教",
		content: "确定发布吗？发布成功以后，您可以在【首页】或者【我发布的】看到已发布的信息，同时可在【我发布的】处删除发布信息。",
		mask: false,
		yesCallback: function () 
		{
			$.ajax
			({
				url:"${path}/ajax_pr_release?parent.UId="+id,
				async:false,
				success:function(responseText)
				{
					if(responseText=="success")
					{
						alert("发布成功！");
					}
					else if(responseText=="ex"  || responseText=="week")
					{
						alert("发布失败，每天只能发布一条，每周只能发布三条！");
					}
					else
					{
						alert("发布失败，原因未知！");
					}
				}
			});
		}
	});
});

$("#xg").click(function() 
{
	window.location.href = "${path}/p_update?parent.UId="+id;
});

</script>
</html>