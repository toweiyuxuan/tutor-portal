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
						<s:property value="#parent.RTime"/>
					</td>
	          	</tr>
	          	<tr>
		            <th width="70">家长昵称：</th>
		            <td colspan="3">
						<s:property value="#parent.PName"/>
					</td>
	          	</tr>
			  	<tr>
			    	<th width="70">学生性别：</th>
			    	<td colspan="3">  	
			    		<s:if test="#parent.PGender==1">男</s:if>
						<s:if test="#parent.PGender==2">女</s:if>
					</td>
			  	</tr>
				  <tr>
				    <th width="70">学生年级：</th>
				    <td colspan="3">
						<s:if test="#parent.PGrade==1">一年级</s:if>
						<s:if test="#parent.PGrade==2">二年级</s:if>
						<s:if test="#parent.PGrade==3">三年级</s:if>
						<s:if test="#parent.PGrade==4">四年级</s:if>
						<s:if test="#parent.PGrade==5">五年级</s:if>
						<s:if test="#parent.PGrade==6">六年级</s:if>
						<s:if test="#parent.PGrade==7">七年级</s:if>
						<s:if test="#parent.PGrade==8">八年级</s:if>
						<s:if test="#parent.PGrade==9">九年级</s:if>
						<s:if test="#parent.PGrade==10">高一</s:if>
						<s:if test="#parent.PGrade==11">高二</s:if>
						<s:if test="#parent.PGrade==12">高三</s:if>
					</td>
				</tr>
				<tr height="40">
					<th>辅导学科：</th>
					<td colspan="3">
						<s:property value="#parent.PSubjecttype"/>
					</td>
				</tr>
			   	<tr>
			    	<th width="70">性格特点：</th>
			    	<td colspan="3">
						<s:if test="#parent.PCharacter==1">外向型</s:if>
						<s:if test="#parent.PCharacter==2">内向型</s:if>
						<s:if test="#parent.PCharacter==3">理智型</s:if>
						<s:if test="#parent.PCharacter==4">情绪型</s:if>
						<s:if test="#parent.PCharacter==5">意志型</s:if>
						<s:if test="#parent.PCharacter==6">中间型</s:if>
					</td>
			  	</tr>
				<tr>
				    <th width="70">行政区域：</th>
				    <td>
						<s:if test="#parent.PArea==1">呈贡区</s:if>
						<s:if test="#parent.PArea==2">官渡区</s:if>
						<s:if test="#parent.PArea==3">西山区</s:if>
						<s:if test="#parent.PArea==4">五华区</s:if>
						<s:if test="#parent.PArea==5">盘龙区</s:if>
					</td>
					<th width="70">具体地址：</th>
					<td>
						<s:property value="#parent.PAddress"/>
					</td>
				</tr>
				<tr>
				    <th width="70">报酬范围：</th>
					<td colspan="3">
						<s:if test="#parent.PMoney==1">&lt;40</s:if>
						<s:if test="#parent.PMoney==2">40-50</s:if>
						<s:if test="#parent.PMoney==3">50-60</s:if>
						<s:if test="#parent.PMoney==4">60-70</s:if>
						<s:if test="#parent.PMoney==5">&gt;70</s:if>
					</td>
				 </tr>
		          <tr>
		            <th height="62">性别限制：</th>
		            <td>
		            	<s:if test="#parent.PLimitgender==0">不限</s:if>
						<s:if test="#parent.PLimitgender==1">限男生</s:if>
						<s:if test="#parent.PLimitgender==2">限女生</s:if>
					</td>
					<th height="62">身份限制：</th>
				    <td>	
						<s:property value="#parent.PLimitteachertype"/>
					</td>
		          </tr>
				 <tr height="80">
				   <th height="62">其他说明：</th>
				    <td colspan="3">						
						<s:property value="#parent.POther"/>
					</td>
				 </tr>
	        </table>
		</div>
	</div>
</body>
</html>