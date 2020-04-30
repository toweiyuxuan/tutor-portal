package cn.wyx.service.impl;

import org.apache.commons.beanutils.BeanUtils;

import cn.wyx.dao.MechanismDao;
import cn.wyx.model.Mechanism;
import cn.wyx.model.Parent;
import cn.wyx.query.MechanismQuery;
import cn.wyx.service.MechanismService;

public class MechanismServiceImpl extends BaseServiceImpl<Mechanism, MechanismQuery> implements MechanismService 
{	
	private MechanismDao mechanismDao;
	
	public void setMechanismDao(MechanismDao mechanismDao) 
	{
		this.mechanismDao = mechanismDao;
		this.baseDao = mechanismDao;
	}

	@Override
	public void updateMechanism(Mechanism mechanism)
	{
		Mechanism mechanism1 = mechanismDao.getObj(mechanism.getUId());
		try 
		{
			//把Parent中的所有属性拷贝到Parent1中
			BeanUtils.copyProperties(mechanism1, mechanism);
		} catch (Exception e) 
		{
			e.printStackTrace();
		} 
		mechanismDao.update(mechanism1);
	}
}
