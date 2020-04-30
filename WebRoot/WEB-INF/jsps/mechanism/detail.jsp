<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../tcc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table
	{ 
		border-collapse:collapse;border:solid 1px #ccc;width:600px;
	}
	td,th
	{ 
		border:solid 1px skyblue; font-size:12px; height:30px; padding-left:10px;
	}
	th
	{
		color:skyblue;
	}
	#in
	{ 
		font-size:12px; width:500px; height:23px; border:none;
	}
	.main
	{ 
		margin:0 auto; width:600px;
	}			
</style>

</head>
<body>
	<div class="main">
	    <div>
	        <table>
	        	<tr>
		            <th width="70">发布时间：</th>
		            <td colspan="3">
						<s:property value="#mrelease.RTime"/>
					</td>
	          	</tr>
	          	<tr>
		            <th width="70">机构名称：</th>
		            <td colspan="3">
						<s:property value="#mrelease.MName"/>
					</td>
	          	</tr>
			  	<tr>
			    	<th width="70">机构标签：</th>
			    	<td colspan="3">  	
			    		<s:property value="#mrelease.MMechanismtype"/>
					</td>
			  	</tr>
			  	<tr>
			    	<th width="70">所在区域：</th>
			    	<td>  	
			    		<s:if test="#mrelease.MArea==1">呈贡区</s:if>
						<s:if test="#mrelease.MArea==2">官渡区</s:if>
						<s:if test="#mrelease.MArea==3">西山区</s:if>
						<s:if test="#mrelease.MArea==4">五华区</s:if>
						<s:if test="#mrelease.MArea==5">盘龙区</s:if>
					</td>
					<th width="70">机构地址：</th>
				    <td>
						<s:property value="#mrelease.MAddress"/>
					</td>
			  	</tr>
			   	<tr>
			    	<th width="70">限制身份：</th>
			    	<td>
						<s:property value="#mrelease.MTeachertype"/>
					</td>
					<th width="70">限制性别：</th>
				    <td>
				    	<s:if test="mrelease.MLimitgender==0">不限</s:if>
				    	<s:if test="mrelease.MLimitgender==1">限制男生</s:if>
				    	<s:if test="mrelease.MLimitgender==2">限制女生</s:if>
					</td>
			  	</tr>
				<tr>
				    <th width="70">联系方式：</th>
					<td colspan="3">
						<s:property value="#mrelease.MContact"/>
					</td>
				</tr>
				<tr height="80">
					<th>机构特点：</th>
					<td colspan="3">
						<s:property value="#mrelease.MTedian"/>
					</td>
				</tr>
				<tr height="100">
					<th>机构介绍：</th>
					<td colspan="3">
						<s:property value="#mrelease.MIntroduce"/>
					</td>
				</tr>
	        </table>
		</div>
	</div>
</body>
</html>