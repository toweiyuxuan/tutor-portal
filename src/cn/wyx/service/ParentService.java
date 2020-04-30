package cn.wyx.service;

import java.util.List;

import cn.wyx.model.Parent;
import cn.wyx.model.Subjecttype;
import cn.wyx.model.Teachertype;
import cn.wyx.query.ParentQuery;

public interface ParentService extends BaseService<Parent, ParentQuery> 
{
	public void updateParent(Parent parent);
}
