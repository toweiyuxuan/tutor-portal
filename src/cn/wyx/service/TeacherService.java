package cn.wyx.service;

import cn.wyx.model.Teacher;
import cn.wyx.query.TeacherQuery;

public interface TeacherService extends BaseService<Teacher, TeacherQuery> 
{
	public void updateTeacher(Teacher teacher);
}
