package cn.wyx.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import cn.wyx.dao.MechanismDao;
import cn.wyx.dao.MphotoDao;
import cn.wyx.model.Mechanism;
import cn.wyx.model.Mphoto;
import cn.wyx.model.Teacher;
import cn.wyx.model.Tphoto;
import cn.wyx.query.MphotoQuery;
import cn.wyx.service.MphotoService;
import cn.wyx.utils.Page;
import cn.wyx.utils.Uploadback;

import com.opensymphony.xwork2.ActionContext;

public class MphotoAction extends BaseAction 
{
	private Mechanism mechanism;
	private MechanismDao mechanismDao;
	private Mphoto mphoto;
	private MphotoDao mphotoDao;
	private MphotoService mphotoService;
	private MphotoQuery query = new MphotoQuery();
	
	//用于接收土图片
	private File[] upload;
	//文件名的接收 File属性名FileName:固定写法
	private String[] uploadFileName;
		
	
	//查
	public String mp_photo()
	{		
		ActionContext context = ActionContext.getContext();		
		Integer pageNo = query.getPageNo();
		if(pageNo == null )
		{
			query.setPageNo(1);
		}	
		query.setUId(mechanism.getUId());
		Page page = mphotoService.queryObjByCondition(query, exclude);		
		context.put("page", page);
		return SUCCESS;
	}
	
	//增
	public String ajax_mp_upload() throws Exception
	{
		// 获得servletContext
		ServletContext sc = ServletActionContext.getServletContext();
		
		query.setUId(mphoto.getUId());
		
		Long count = mphotoDao.queryObjByConditionCount(query, exclude);
		
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
			
			String basepath = "/mpupload/" + fileName + suffix;
			
			Mphoto mphoto1 = new Mphoto();
			
			BeanUtils.copyProperties(mphoto1, mphoto);
			
			mphoto1.setMpAddress(basepath);

			Mechanism mechanism1 = mechanismDao.getObj(mphoto.getUId());	
			
			mphoto1.setUTel(mechanism1.getUser().getUTel());
			
			mphotoService.save(mphoto1);
			
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
		context.put("ID", mphoto.getUId());
		
		return SUCCESS;
	}
	
	//删除操作
	public void mp_detele() throws IOException
	{
		//删除对应图片
		mphotoService.delete(mphoto.getMpId());	
		response.getWriter().write("success");
	}	
	
	
	//============================================setter and getter=====================================================
	public MphotoQuery getQuery() 
	{
		return query;
	}
	public void setQuery(MphotoQuery query)
	{
		this.query = query;
	}
	public MphotoService getMphotoService() 
	{
		return mphotoService;
	}
	public void setMphotoService(MphotoService mphotoService) 
	{
		this.mphotoService = mphotoService;
	}

	public Mechanism getMechanism()
	{
		return mechanism;
	}

	public void setMechanism(Mechanism mechanism)
	{
		this.mechanism = mechanism;
	}

	public Mphoto getMphoto()
	{
		return mphoto;
	}

	public void setMphoto(Mphoto mphoto)
	{
		this.mphoto = mphoto;
	}

	public MphotoDao getMphotoDao()
	{
		return mphotoDao;
	}

	public void setMphotoDao(MphotoDao mphotoDao)
	{
		this.mphotoDao = mphotoDao;
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

	public MechanismDao getMechanismDao()
	{
		return mechanismDao;
	}

	public void setMechanismDao(MechanismDao mechanismDao)
	{
		this.mechanismDao = mechanismDao;
	}
	
}
