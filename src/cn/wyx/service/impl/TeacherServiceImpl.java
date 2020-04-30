package cn.wyx.service.impl;

import org.apache.commons.beanutils.BeanUtils;

import cn.wyx.dao.TeacherDao;
import cn.wyx.model.Teacher;
import cn.wyx.query.TeacherQuery;
import cn.wyx.service.TeacherService;

public class TeacherServiceImpl extends BaseServiceImpl<Teacher, TeacherQuery> implements TeacherService 
{	
	private TeacherDao teacherDao;
	
	public void setTeacherDao(TeacherDao teacherDao) 
	{
		this.teacherDao = teacherDao;
		this.baseDao = teacherDao;
	}

	@Override
	public void updateTeacher(Teacher teacher)
	{
		Teacher teacher1 = teacherDao.getObj(teacher.getUId());
		try 
		{
			//��Teacher�е��������Կ�����Teacher1��
			BeanUtils.copyProperties(teacher1, teacher);
		} catch (Exception e) 
		{
			e.printStackTrace();
		} 
		teacherDao.update(teacher1);		
	}
}
