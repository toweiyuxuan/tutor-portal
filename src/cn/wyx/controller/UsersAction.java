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
	//����
	private Users user;
	
	//ע�루ͬ�������ļ���
	private ParentService parentService;	
	private PphotoService pphotoService;
	private TeacherService teacherService;
	private UsersService usersService;
	
	//У���û���
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
	
	//��������
	public void ajax_u_resetPassword() throws IOException
	{
		Users user1 = usersService.getUsersByUname(user.getUTel());
		user1.setUPassword(MD5Utils.md5("123456")); 
		usersService.updateUsers(user1);
		response.getWriter().write("success");		
	}
	
	//�û�ע��
	public void ajax_u_register() throws IOException
	{			
		String password = user.getUPassword();
		password = MD5Utils.md5(password);		
		user.setUPassword(password);
		//��ע�������Ϣ�϶��ǲ����Ƶ�
		user.setUIsfinish(1);
		//��ע����״̬ʱ���õ�	
		user.setUStation(1);
		
		Date date = new Date();
		//�õ�һ��timestamp��ʽ��ʱ�䣬����mysql�е�ʱ���ʽΪ"yyyy-MM-dd HH:mm:ss"
		Timestamp timestamp = new Timestamp(date.getTime());
		
		if(user.getUSf()==1)
		{
			//��ע�������Ϣ�϶���δ��֤��
			user.setUAttestation(1);
			user.setUTime(timestamp);
			
			Parent parent = new Parent();
			Pphoto pPhotos = new Pphoto();
			
			parent.setUser(user);
			pPhotos.setUser(user);
			
			user.setParent(parent);
			user.setPphoto(pPhotos);
					
			usersService.save(user);
			
			//ʹ�ü������赥������parent��pphoto
			//parentService.save(parent);
			//pphotoService.save(pphoto);
			
		}
		
		if(user.getUSf()==2)
		{
			//��ʦ�����
			user.setUAttestation(4);
			user.setUTime(timestamp);
			
			Teacher teacher = new Teacher();
			
			teacher.setUser(user);
			
			user.setTeacher(teacher);
			
			usersService.save(user);
			
			//ʹ�ü������赥������teacher
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
		
	//�û�ajax�첽��¼
	public void ajax_u_login() throws IOException
	{		
		ActionContext context = ActionContext.getContext();
		//����Ҫ�����ĵ�����������
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
				//���û�����Ϣ����session��
				session2.put("user", user1);
				response.getWriter().write("success");
			}
		}		
	}
	
	//ע��
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
