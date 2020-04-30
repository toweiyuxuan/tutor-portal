package cn.wyx.service.impl;

import java.util.List;
import java.util.Set;

import cn.wyx.dao.MphotoDao;
import cn.wyx.model.Mechanism;
import cn.wyx.model.Mphoto;
import cn.wyx.model.Parent;
import cn.wyx.model.Subjecttype;
import cn.wyx.query.MphotoQuery;
import cn.wyx.service.MphotoService;

public class MphotoServiceImpl extends BaseServiceImpl<Mphoto, MphotoQuery> implements MphotoService 
{	
	private MphotoDao mphotoDao;
	
	public void setMphotoDao(MphotoDao mphotoDao) 
	{
		this.mphotoDao = mphotoDao;
		this.baseDao = mphotoDao;
	}
}
