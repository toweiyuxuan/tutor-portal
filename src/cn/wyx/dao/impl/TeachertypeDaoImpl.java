package cn.wyx.dao.impl;

import cn.wyx.dao.TeachertypeDao;
import cn.wyx.model.Teachertype;
import cn.wyx.query.TeachertypeQuery;

public class TeachertypeDaoImpl extends BaseDaoImpl<Teachertype, TeachertypeQuery> implements TeachertypeDao 
{

	@Override
	public String createHql(TeachertypeQuery equery) 
	{
		String hql = "from Teachertype t where 1=1 ";		
		return hql;
	}

	@Override
	public String createHqlCount(TeachertypeQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createHqlCondition(TeachertypeQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}
	
}
