package cn.wyx.dao.impl;

import org.apache.commons.lang.StringUtils;

import cn.wyx.dao.PreleaseDao;
import cn.wyx.model.Prelease;
import cn.wyx.query.PreleaseQuery;

public class PreleaseDaoImpl extends BaseDaoImpl<Prelease, PreleaseQuery> implements PreleaseDao 
{

	@Override
	public String createHql(PreleaseQuery equery) 
	{
		String hql = "from Prelease r where 1=1 ";
		hql = hql + createHqlCondition(equery) + " order by r.RId desc";
		return hql;
	}

	@Override
	public String createHqlCount(PreleaseQuery q) 
	{
		String hql = "select count(RId) from Prelease r where 1=1";
		hql = hql + createHqlCondition(q);
		return hql;
	}

	@Override
	public String createHqlCondition(PreleaseQuery equery) 
	{
		String hql = "";
		if (equery.getPArea() != null)
		{
			hql = hql + " and r.PArea = :PArea";
		}	
		if (equery.getPGrade()!= null)
		{
			hql = hql + " and r.PGrade = :PGrade";
		}
		if (StringUtils.isNotBlank(equery.getPSubjecttype()))
		{
			hql = hql + " and r.PSubjecttype like :PSubjecttype";
		}
		if (equery.getWhereQuery() == "parent")
		{
			hql = hql + " and r.UId = " + equery.getUId().toString();
		}

		return hql;
	}
	
}
