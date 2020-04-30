package cn.wyx.service.impl;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;

import cn.wyx.dao.ParentDao;
import cn.wyx.dao.TeachertypeDao;
import cn.wyx.model.Parent;
import cn.wyx.model.Teachertype;
import cn.wyx.query.TeachertypeQuery;
import cn.wyx.service.TeachertypeService;

public class TeachertypeServiceImpl extends BaseServiceImpl<Teachertype, TeachertypeQuery> implements TeachertypeService 
{	
	//注入
	private TeachertypeDao teachertypeDao;
	
	private ParentDao parentDao;
	
	public void setTeachertypeDao(TeachertypeDao teachertypeDao) 
	{
		this.teachertypeDao = teachertypeDao;
		this.baseDao = teachertypeDao;
	}
	public void setParentDao(ParentDao parentDao)
	{
		this.parentDao = parentDao;
	}


	@Override
	public List<Teachertype> getStateTeachertypes(Integer pid)
	{
		//查询所有老师类型
		List<Teachertype> list = teachertypeDao.list();
		
		Parent parent = parentDao.getObj(pid);
		
		Set<Teachertype> teachertypes = parent.getTeachertypes();
		
		for(Teachertype t : list)
		{
			for(Teachertype ty : teachertypes)
			{
				if(t.getTtId().intValue() == ty.getTtId().intValue())
				{
					t.setSelect("yes");
				}
			}
		}
		return list;
	}

	@Override
	public void updateTeachertype(Integer pid, String teachertypeIds)
	{
		//获得用户
		Parent parent = parentDao.getObj(pid);
		Set<Teachertype> teachertypes = parent.getTeachertypes();
		//把原有的学科清掉
		teachertypes.clear();
		if(StringUtils.isNotBlank(teachertypeIds))
		{
			String[] ids = teachertypeIds.split(",");
			for(String teachertypeId : ids)
			{
				//根据id获得要分配学科
				Teachertype teachertype = teachertypeDao.getObj(new Integer(teachertypeId));
				teachertypes.add(teachertype);
			}
		}	
	}
}
