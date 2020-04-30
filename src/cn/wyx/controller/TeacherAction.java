package cn.wyx.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.wyx.dao.TeacherDao;
import cn.wyx.model.Teacher;
import cn.wyx.model.Teachertype;
import cn.wyx.model.Users;
import cn.wyx.query.TeacherQuery;
import cn.wyx.service.TeacherService;
import cn.wyx.service.TeachertypeService;
import cn.wyx.service.UsersService;
import cn.wyx.utils.MD5Utils;
import cn.wyx.utils.Page;

import com.opensymphony.xwork2.ActionContext;

public class TeacherAction extends BaseAction 
{
	
	private Users user;
	private UsersService usersService;
	
	private Teacher teacher;
	private TeacherDao teacherDao;
	private TeacherService teacherService;	
	
	private TeachertypeService teachertypeService;
	
	private String originpassword;
	
	//���ڽ���΢�Ŷ�ά��
	private File[] upload;
	//�ļ����Ľ��� File������FileName:�̶�д��
	private String[] uploadFileName;
	
	
	
	//��
	public String t_teacherhome()
	{
		ActionContext context = ActionContext.getContext();	
		//��ѯ��ʦ������Ϣ
		teacher = teacherService.getObj(teacher.getUId());	
		context.put("Teacher", teacher);
		//��ѯѧ����Ϣ
		List<Teachertype> list = teachertypeService.list();
		context.put("teacherList", list);		
		return SUCCESS;
	}
		
	//��
	public String t_update()
	{
		ActionContext context = ActionContext.getContext();	
		
		//��ѯ��ʦ������Ϣ
		teacher = teacherService.getObj(teacher.getUId());	
		context.put("Teacher", teacher);	
	
		//��ѯ��ʦ������Ϣ
		List<Teachertype> list = teachertypeService.list();
		context.put("teacherList", list);
		
		return SUCCESS;
	}
	public void ajax_t_update() throws IOException
	{		
		Teacher teacher1 = teacherDao.getObj(teacher.getUId());
		
		// ���servletContext
		ServletContext sc = ServletActionContext.getServletContext();	
		
		if(upload != null)
		{
			// ��÷���ľ���·��
			for (int i = 0; i < upload.length; i++)
			{
				String suffix = uploadFileName[i].substring(uploadFileName[i].lastIndexOf("."));
				
				String fileName = UUID.randomUUID().toString();
				
				String basepath = "/tpwupload/" + fileName + suffix;
				
				teacher.setTWechat(basepath);
				
				String realPath = sc.getRealPath("/");
				
				//·��׷��
				realPath = realPath + basepath;
				
				// �������������
				FileUtils.copyFile(upload[i], new File(realPath));
			}
		}
		else
		{
			teacher.setTWechat(teacher1.getTWechat());
		}
				
		teacherService.updateTeacher(teacher);
		
		//�����Ժ�
		user = usersService.getObj(teacher.getUId());
		user.setUIsfinish(2);
		usersService.updateUsers(user);
		
		response.setContentType("text/html");
		response.getWriter().write("success");
	}
	
	//�޸�����
	public void ajax_t_updatepass() throws IOException
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
	
	
	//============================================setter and getter=====================================================
	
	public TeacherService getTeacherService() 
	{
		return teacherService;
	}
	public void setTeacherService(TeacherService teacherService) 
	{
		this.teacherService = teacherService;
	}

	public Teacher getTeacher()
	{
		return teacher;
	}

	public void setTeacher(Teacher teacher)
	{
		this.teacher = teacher;
	}

	public TeacherDao getTeacherDao()
	{
		return teacherDao;
	}

	public void setTeacherDao(TeacherDao teacherDao)
	{
		this.teacherDao = teacherDao;
	}

	public TeachertypeService getTeachertypeService()
	{
		return teachertypeService;
	}

	public void setTeachertypeService(TeachertypeService teachertypeService)
	{
		this.teachertypeService = teachertypeService;
	}

	public File[] getUpload()
	{
		return upload;
	}

	public void setUpload(File[] upload)
	{
		this.upload = upload;
	}

	public String[] getUploadFileName()
	{
		return uploadFileName;
	}

	public void setUploadFileName(String[] uploadFileName)
	{
		this.uploadFileName = uploadFileName;
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
