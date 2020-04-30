package cn.wyx.dao.impl;

import cn.wyx.dao.TphotoDao;
import cn.wyx.model.Tphoto;
import cn.wyx.query.TphotoQuery;

public class TphotoDaoImpl extends BaseDaoImpl<Tphoto, TphotoQuery> implements TphotoDao 
{

	@Override
	public String createHql(TphotoQuery equery) 
	{
		String hql = "from Tphoto tp where 1=1 ";
		hql = hql + createHqlCondition(equery) ;//+ " order by tp.tpId desc";
		return hql;
	}

	@Override
	public String createHqlCount(TphotoQuery q) 
	{
		String hql = "select count(tpId) from Tphoto tp where 1=1";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(TphotoQuery equery) 
	{
		String hql = " and tp.UId = "+ equery.getUId().toString();
		return hql;
	}
	
}
