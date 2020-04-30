package cn.wyx.controller;

import java.io.IOException;
import java.util.List;

import cn.wyx.model.Parent;
import cn.wyx.model.Subjecttype;
import cn.wyx.model.Teachertype;
import cn.wyx.model.Users;
import cn.wyx.query.ParentQuery;
import cn.wyx.service.ParentService;
import cn.wyx.service.SubjecttypeService;
import cn.wyx.service.TeachertypeService;
import cn.wyx.service.UsersService;
import cn.wyx.utils.MD5Utils;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class ParentAction extends BaseAction 
{	
	//实体引入
	private Parent parent;
	
	private ParentService parentService;
	
	private TeachertypeService teachertypeService; 
	private SubjecttypeService subjecttypeService;
	
	private Users user;
	private UsersService usersService;
	private String originpassword;
	
	/*
	 * 家长主页每次都需要查出来的数据
	 */
	public String p_parenthome()
	{
		ActionContext context = ActionContext.getContext();
		
		//查询家长个人信息
		parent = parentService.getObj(parent.getUId());	
		context.put("Parent", parent);
		
		//查询学科信息
		List<Subjecttype> subjecttypes = subjecttypeService.getStateSubjecttypes(parent.getUId());
		context.put("subjectList", subjecttypes);
		
		//老师类型信息
		List<Teachertype> teachertypes = teachertypeService.getStateTeachertypes(parent.getUId());
		context.put("teacherList", teachertypes);
		
		return SUCCESS;	
	}		

	//修改密码
	public void ajax_p_updatepass() throws IOException
	{
		Users user1 = usersService.getObj(user.getUId());
		if(!MD5Utils.md5(originpassword).equals(user1.getUPassword()))
		{
			response.getWriter().write("fail");
		}
		if(MD5Utils.md5(originpassword).equals(user1.getUPassword()))
		{
			user1.setUPassword(MD5Utils.md5(user.getUPassword()));
			usersService.updateUsers(user1);
			response.getWriter().write("success");
		}
	}
	//修改数据查询
	public String p_update()
	{
		ActionContext context = ActionContext.getContext();
		
		//查询家长个人信息
		parent = parentService.getObj(parent.getUId());	
		context.put("Parent", parent);
		
		//查询学科信息
		List<Subjecttype> subjecttypes = subjecttypeService.getStateSubjecttypes(parent.getUId());
		context.put("subjectList", subjecttypes);
		
		//老师类型信息
		List<Teachertype> teachertypes = teachertypeService.getStateTeachertypes(parent.getUId());
		context.put("teacherList", teachertypes);
		
		//完善以后
		//parent.getUser().setUIsfinish(2);		
		//parentService.updateParent(parent);
		
		return SUCCESS;
	}
	
	//真正的修改操作
	public void ajax_p_update() throws IOException
	{
		parentService.updateParent(parent);
		response.setContentType("text/html");
		response.getWriter().write("success");
	}
		
	
	//============================================setter and getter=====================================================
	
	public ParentService getParentService() 
	{
		return parentService;
	}
	public void setParentService(ParentService parentService) 
	{
		this.parentService = parentService;
	}
	public Parent getParent()
	{
		return parent;
	}
	public void setParent(Parent parent)
	{
		this.parent = parent;
	}

	public TeachertypeService getTeachertypeService()
	{
		return teachertypeService;
	}

	public void setTeachertypeService(TeachertypeService teachertypeService)
	{
		this.teachertypeService = teachertypeService;
	}

	public SubjecttypeService getSubjecttypeService()
	{
		return subjecttypeService;
	}

	public void setSubjecttypeService(SubjecttypeService subjecttypeService)
	{
		this.subjecttypeService = subjecttypeService;
	}

	public Users getUser()
	{
		return user;
	}

	public void setUser(Users user)
	{
		this.user = user;
	}

	public UsersService getUsersService()
	{
		return usersService;
	}

	public void setUsersService(UsersService usersService)
	{
		this.usersService = usersService;
	}

	public String getOriginpassword()
	{
		return originpassword;
	}

	public void setOriginpassword(String originpassword)
	{
		this.originpassword = originpassword;
	}
	
}
