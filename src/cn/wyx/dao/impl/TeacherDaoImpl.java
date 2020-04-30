package cn.wyx.dao.impl;

import cn.wyx.dao.TeacherDao;
import cn.wyx.model.Teacher;
import cn.wyx.query.TeacherQuery;

public class TeacherDaoImpl extends BaseDaoImpl<Teacher, TeacherQuery> implements TeacherDao 
{

	@Override
	public String createHql(TeacherQuery equery) 
	{
		String hql = "from Teacher t where 1=1 ";		
		return hql;
	}

	@Override
	public String createHqlCount(TeacherQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createHqlCondition(TeacherQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}
	
}
