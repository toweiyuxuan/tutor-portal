package cn.wyx.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.wyx.dao.TeacherDao;
import cn.wyx.dao.TphotoDao;
import cn.wyx.model.Prelease;
import cn.wyx.model.Teacher;
import cn.wyx.model.Tphoto;
import cn.wyx.query.TphotoQuery;
import cn.wyx.service.TphotoService;
import cn.wyx.utils.Page;
import cn.wyx.utils.Uploadback;

import com.opensymphony.xwork2.ActionContext;

public class TphotoAction extends BaseAction 
{	
	//接收页面传值
	private Teacher teacher;
	private TeacherDao teacherDao;
	
	private Tphoto tphoto;
	private TphotoDao tphotoDao;
	private TphotoService tphotoService;

	//接收查询对象
	private TphotoQuery query = new TphotoQuery();
	
	//接收上传图片
	private File[] upload;
	//文件名的接收 File属性名FileName:固定写法
	private String[] uploadFileName;
		
	
	//增www/server/tomcat/
	public String ajax_tp_upload() throws Exception
	{		
		String result = "fail";
		// 获得servletContext
		ServletContext sc = ServletActionContext.getServletContext();
		
		query.setUId(tphoto.getUId());
		
		Long count = tphotoDao.queryObjByConditionCount(query, exclude);
		
		int cc = upload.length;
		
		if(count+cc > 9)
		{
			cc = (int) (9 - count);
		}
		// 获得服务的绝对路径
		for (int i = 0; i < cc; i++)
		{
			String suffix = uploadFileName[i].substring(uploadFileName[i].lastIndexOf("."));
			
			String fileName = UUID.randomUUID().toString();
			
			String basepath = "/tpupload/" + fileName + suffix;
			
			Tphoto tphoto1 = new Tphoto();
			
			BeanUtils.copyProperties(tphoto1, tphoto);
			
			tphoto1.setTpAddress(basepath);			
			
			Teacher teacher1 = teacherDao.getObj(tphoto.getUId());
			
			tphoto1.setUTel(teacher1.getUser().getUTel());
			
			tphotoService.save(tphoto1);
			
			String realPath = sc.getRealPath("/");
			
			//路径追加
			realPath = realPath + basepath;
			
			// 定义输入输出流
			FileUtils.copyFile(upload[i], new File(realPath));	
						
		}
		
		ActionContext context = ActionContext.getContext();
		Uploadback uploadbackCount = new Uploadback();
		uploadbackCount.setSuccess(cc);
		uploadbackCount.setFail(upload.length-cc);
		context.put("UploadbackCount", uploadbackCount);
		context.put("ID", tphoto.getUId());
				
		return SUCCESS;
	}
	public String tp_photoupload()
	{
		return SUCCESS;
	}
	
	
	
	//删除操作
	public void tp_detele() throws IOException
	{
		//删除对应图片
		tphotoService.delete(tphoto.getTpId());	
		response.getWriter().write("success");
	}	
	
	//查
	public String tp_photo()
	{		
		ActionContext context = ActionContext.getContext();		
		Integer pageNo = query.getPageNo();
		if(pageNo == null )
		{
			query.setPageNo(1);
		}	
		query.setUId(teacher.getUId());
		Page page = tphotoService.queryObjByCondition(query, exclude);		
		context.put("page", page);		
		return SUCCESS;
	}
	
	
	
	//============================================setter and getter=====================================================
	public TphotoQuery getQuery() 
	{
		return query;
	}
	public void setQuery(TphotoQuery query)
	{
		this.query = query;
	}
	public TphotoService getTphotoService() 
	{
		return tphotoService;
	}
	public void setTphotoService(TphotoService tphotoService) 
	{
		this.tphotoService = tphotoService;
	}

	public Teacher getTeacher()
	{
		return teacher;
	}

	public void setTeacher(Teacher teacher)
	{
		this.teacher = teacher;
	}

	public Tphoto getTphoto()
	{
		return tphoto;
	}

	public void setTphoto(Tphoto tphoto)
	{
		this.tphoto = tphoto;
	}

	public TphotoDao getTphotoDao()
	{
		return tphotoDao;
	}

	public void setTphotoDao(TphotoDao tphotoDao)
	{
		this.tphotoDao = tphotoDao;
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
	public TeacherDao getTeacherDao()
	{
		return teacherDao;
	}
	public void setTeacherDao(TeacherDao teacherDao)
	{
		this.teacherDao = teacherDao;
	}

}
