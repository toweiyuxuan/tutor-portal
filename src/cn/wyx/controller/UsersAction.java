package cn.wyx.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import cn.wyx.model.Parent;
import cn.wyx.model.Pphoto;
import cn.wyx.model.Teacher;
import cn.wyx.model.Users;
import cn.wyx.query.UsersQuery;
import cn.wyx.service.ParentService;
import cn.wyx.service.PphotoService;
import cn.wyx.service.TeacherService;
import cn.wyx.service.UsersService;
import cn.wyx.utils.Config;
import cn.wyx.utils.HttpUtil;
import cn.wyx.utils.MD5Utils;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class UsersAction extends BaseAction 
{
	//引入
	private Users user;
	
	//注入（同步配置文件）
	private ParentService parentService;	
	private PphotoService pphotoService;
	private TeacherService teacherService;
	private UsersService usersService;
	
	//校验用户名
	public void ajax_u_validUname() throws IOException
	{
		String result = "";
		Users user1 = usersService.getUsersByUname(user.getUTel());
		if(user1 != null)
		{
			result = "no";
		}
		response.getWriter().write(result);		
	}
	
	//密码重置
	public void ajax_u_resetPassword() throws IOException
	{
		Users user1 = usersService.getUsersByUname(user.getUTel());
		user1.setUPassword(MD5Utils.md5("123456")); 
		usersService.updateUsers(user1);
		response.getWriter().write("success");		
	}
	
	//用户注册
	public void ajax_u_register() throws IOException
	{			
		String password = user.getUPassword();
		password = MD5Utils.md5(password);		
		user.setUPassword(password);
		//刚注册身份信息肯定是不完善的
		user.setUIsfinish(1);
		//刚注册用状态时可用的	
		user.setUStation(1);
		
		Date date = new Date();
		//得到一个timestamp格式的时间，存入mysql中的时间格式为"yyyy-MM-dd HH:mm:ss"
		Timestamp timestamp = new Timestamp(date.getTime());
		
		if(user.getUSf()==1)
		{
			//刚注册身份信息肯定是未认证的
			user.setUAttestation(1);
			user.setUTime(timestamp);
			
			Parent parent = new Parent();
			Pphoto pPhotos = new Pphoto();
			
			parent.setUser(user);
			pPhotos.setUser(user);
			
			user.setParent(parent);
			user.setPphoto(pPhotos);
					
			usersService.save(user);
			
			//使用级联无需单独保存parent和pphoto
			//parentService.save(parent);
			//pphotoService.save(pphoto);
			
		}
		
		if(user.getUSf()==2)
		{
			//老师不审核
			user.setUAttestation(4);
			user.setUTime(timestamp);
			
			Teacher teacher = new Teacher();
			
			teacher.setUser(user);
			
			user.setTeacher(teacher);
			
			usersService.save(user);
			
			//使用级联无需单独保存teacher
			//teacherService.save(teacher);
			
		}
				
		response.getWriter().write("success");	
	}
	
	public void ajax_u_sendMessage() throws IOException
	{
		String random = (int)((Math.random()*9+1)*100000)+"";
		
		StringBuilder sb = new StringBuilder();
		sb.append("accountSid").append("=").append(Config.ACCOUNT_SID);
		sb.append("&to").append("=").append(user.getUTel());
		sb.append("&param").append("=").append(URLEncoder.encode(random,"UTF-8"));
		sb.append("&templateid").append("=").append("247752");
		String body = sb.toString() + HttpUtil.createCommonParam(Config.ACCOUNT_SID, Config.AUTH_TOKEN);
		String result = HttpUtil.post(Config.BASE_URL, body);
		System.out.println(result);
		response.getWriter().write(random);
	}
		
	//用户ajax异步登录
	public void ajax_u_login() throws IOException
	{		
		ActionContext context = ActionContext.getContext();
		//我们要给明文的密码做加密
		String newPass = MD5Utils.md5(user.getUPassword());
		Users user1 = usersService.getUsersByUnameAndPWord(user.getUTel(), newPass);
		if(user1 == null)
		{
			response.getWriter().write("fail");
		}
		else
		{
			if(user1.getUStation()==2)
			{
				response.getWriter().write("forbid");
			}
			else
			{
				Map<String, Object> session2 = context.getSession();
				//把用户的信息放入session中
				session2.put("user", user1);
				response.getWriter().write("success");
			}
		}		
	}
	
	//注销
	public String ajax_u_logout()
	{
		ActionContext context = ActionContext.getContext();		
		Map<String, Object> session2 = context.getSession();
		session2.remove("user");
		return MAIN;
	}
		
	
	//============================================setter and getter=====================================================

	public UsersService getTphotoService() 
	{
		return usersService;
	}
	public void setTphotoService(UsersService tphotoService) 
	{
		this.usersService = tphotoService;
	}

	public Users getUser()
	{
		return user;
	}

	public void setUser(Users user)
	{
		this.user = user;
	}

	public ParentService getParentService()
	{
		return parentService;
	}

	public void setParentService(ParentService parentService)
	{
		this.parentService = parentService;
	}

	public PphotoService getPphotoService()
	{
		return pphotoService;
	}

	public void setPphotoService(PphotoService pphotoService)
	{
		this.pphotoService = pphotoService;
	}

	public TeacherService getTeacherService()
	{
		return teacherService;
	}

	public void setTeacherService(TeacherService teacherService)
	{
		this.teacherService = teacherService;
	}

	public UsersService getUsersService()
	{
		return usersService;
	}

	public void setUsersService(UsersService usersService)
	{
		this.usersService = usersService;
	}
	
}
