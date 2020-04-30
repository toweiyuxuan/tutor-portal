package cn.wyx.dao.impl;

import cn.wyx.dao.MphotoDao;
import cn.wyx.model.Mphoto;
import cn.wyx.query.MphotoQuery;

public class MphotoDaoImpl extends BaseDaoImpl<Mphoto, MphotoQuery> implements MphotoDao 
{

	@Override
	public String createHql(MphotoQuery equery) 
	{
		String hql = "from Mphoto mp where 1=1 ";
		hql = hql + createHqlCondition(equery) ;//+ " order by mp.mpId desc";
		return hql;
	}

	@Override
	public String createHqlCount(MphotoQuery q) 
	{
		String hql = "select count(mpId) from Mphoto mp where 1=1";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(MphotoQuery equery) 
	{
		String hql = " and mp.UId = "+ equery.getUId().toString();
		return hql;
	}
	
}
