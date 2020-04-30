package cn.wyx.service.impl;

import cn.wyx.dao.TphotoDao;
import cn.wyx.model.Tphoto;
import cn.wyx.query.TphotoQuery;
import cn.wyx.service.TphotoService;

public class TphotoServiceImpl extends BaseServiceImpl<Tphoto, TphotoQuery> implements TphotoService 
{	
	private TphotoDao tphotoDao;
	
	public void setTphotoDao(TphotoDao tphotoDao) 
	{
		this.tphotoDao = tphotoDao;
		this.baseDao = tphotoDao;
	}
}
