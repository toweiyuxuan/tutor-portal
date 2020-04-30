package cn.wyx.service.impl;

import java.util.List;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

import cn.wyx.dao.ParentDao;
import cn.wyx.dao.SubjecttypeDao;
import cn.wyx.dao.TeachertypeDao;
import cn.wyx.model.Parent;
import cn.wyx.model.Subjecttype;
import cn.wyx.model.Teachertype;
import cn.wyx.query.ParentQuery;
import cn.wyx.service.ParentService;

public class ParentServiceImpl extends BaseServiceImpl<Parent, ParentQuery> implements ParentService 
{	
	private ParentDao parentDao;
		
	public void setParentDao(ParentDao parentDao) 
	{
		this.parentDao = parentDao;
		this.baseDao = parentDao;
	}

	@Override
	public void updateParent(Parent parent)
	{
		Parent parent1 = parentDao.getObj(parent.getUId());
		try 
		{
			//把Parent中的所有属性拷贝到Parent1中
			BeanUtils.copyProperties(parent1, parent);
		} catch (Exception e) 
		{
			e.printStackTrace();
		} 
		parentDao.update(parent1);		
	}
}
