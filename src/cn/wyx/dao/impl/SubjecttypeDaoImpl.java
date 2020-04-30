package cn.wyx.dao.impl;

import cn.wyx.dao.SubjecttypeDao;
import cn.wyx.model.Subjecttype;
import cn.wyx.query.SubjecttypeQuery;

public class SubjecttypeDaoImpl extends BaseDaoImpl<Subjecttype, SubjecttypeQuery> implements SubjecttypeDao 
{

	@Override
	public String createHql(SubjecttypeQuery equery) 
	{
		String hql = "from Subjecttype t where 1=1 ";		
		return hql;
	}

	@Override
	public String createHqlCount(SubjecttypeQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createHqlCondition(SubjecttypeQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}
	
}
