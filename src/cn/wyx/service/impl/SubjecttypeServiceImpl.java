package cn.wyx.service.impl;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import cn.wyx.dao.ParentDao;
import cn.wyx.dao.SubjecttypeDao;
import cn.wyx.model.Parent;
import cn.wyx.model.Subjecttype;
import cn.wyx.query.SubjecttypeQuery;
import cn.wyx.service.SubjecttypeService;

public class SubjecttypeServiceImpl extends BaseServiceImpl<Subjecttype, SubjecttypeQuery> implements SubjecttypeService 
{	
	//注入
	private SubjecttypeDao subjecttypeDao;
	
	private ParentDao parentDao;
	
	public void setSubjecttypeDao(SubjecttypeDao subjecttypeDao) 
	{
		this.subjecttypeDao = subjecttypeDao;
		this.baseDao = subjecttypeDao;
	}
	public void setParentDao(ParentDao parentDao)
	{
		this.parentDao = parentDao;
	}


	@Override
	public List<Subjecttype> getStateSubjecttypes(Integer pid)
	{
		//查询所有学科类型
		List<Subjecttype> list = subjecttypeDao.list();
		
		Parent parent = parentDao.getObj(pid);
		
		Set<Subjecttype> subjecttypes = parent.getSubjecttypes();
		
		for(Subjecttype s : list)
		{
			for(Subjecttype ty : subjecttypes)
			{
				if(s.getSId().intValue() == ty.getSId().intValue())
				{
					s.setSelect("yes");
				}
			}
		}
		return list;
	}

	@Override
	public void updateSubjecttype(Integer pid, String subjecttypeIds)
	{
		//获得用户
		Parent parent = parentDao.getObj(pid);
		Set<Subjecttype> subjecttypes = parent.getSubjecttypes();
		//把原有的学科清掉
		subjecttypes.clear();
		if(StringUtils.isNotBlank(subjecttypeIds))
		{
			String[] ids = subjecttypeIds.split(",");
			for(String subjecttypeId : ids)
			{
				//根据id获得要分配学科
				Subjecttype subjecttype = subjecttypeDao.getObj(new Integer(subjecttypeId));
				subjecttypes.add(subjecttype);
			}
		}					
	}
}
