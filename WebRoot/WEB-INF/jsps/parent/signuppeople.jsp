<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td
{ 
	border:solid 1px #f6f5ec; font-size:15px; height:50px;
}
a 
{
	position: relative;
}
a img
{
	display: none;
	position:absolute;
	left: 50%;
	margin-left: -150px;
	margin-top: -2px;
}
a:hover img
{
	display: block;
}
</style>
</head>
<body>
<div>
	<table style="table-layout:fixed;border:solid 1px #f6f5ec;width: 1200px;">
		<tr height="50px">
			<th width="50px">姓名</th>
			<th width="40px">年龄</th>
			<th width="40px">性别</th>
			<th width="60px">学校</th>
			<th width="60px">专业</th>
			<th width="60px">地址</th>
			<th width="60px">介绍</th>
			<th width="60px">经验</th>
			<th width="60px">手机</th>
			<th width="70px">相册</th>
			<th width="70px">微信</th>
		</tr>
		<s:iterator value="#page" var="people">
		<tr>
			<td align="center">
				<s:property value="#people.TName"/>
			</td>
			
			<td align="center">
				<s:property value="#people.TAge"/>
			</td>
			
			<td align="center">
				<s:if test="#people.TGender==1">男</s:if>
				<s:if test="#people.TGender==2">女</s:if>
			</td>
			
			<td align="center" title="<s:property value="#people.TSchool"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
				<s:property value="#people.TSchool"/>
			</td>
			
			<td align="center" title="<s:property value="#people.TMajor"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
				<s:property value="#people.TMajor"/>
			</td>
			
			<td align="center" title="<s:property value="#people.TAddress"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
				<s:property value="#people.TAddress"/>
			</td>
			
			<td align="center" title="<s:property value="#people.TIntroduce"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
				<s:property value="#people.TIntroduce"/>
			</td>
			
			<td align="center" title="<s:property value="#people.TExperience"/>" style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis;cursor:pointer;">
				<s:property value="#people.TExperience"/>
			</td>
			
			<td align="center">
				<s:property value="#people.user.UTel"/>
			</td>
			<td align="center">
				<a href="javascript:void(0);" style="color: blue;" onclick="xiangce(<s:property value="#people.UId"/>)">查看他的相册</a>	
			</td>
			<td align="center">
				<a href="" class="text-muted">
	          		<span>微信二维码</span><br/>
	    			<img style="z-index:99" src="${path}/<s:property value="#people.TWechat"/>" width="200px"/>
    			</a>
			</td>
		</tr>
		</s:iterator>
	</table>
</div>
</body>
<script type="text/javascript">
function xiangce(id)
{
	window.location.href ="${path}/si_teacherphotos?teacher.UId="+id;
}
</script>
</html>