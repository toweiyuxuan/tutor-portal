package cn.wyx.service;

import cn.wyx.model.Mechanism;
import cn.wyx.model.Parent;
import cn.wyx.query.MechanismQuery;

public interface MechanismService extends BaseService<Mechanism, MechanismQuery> 
{
	public void updateMechanism(Mechanism mechanism);
}
