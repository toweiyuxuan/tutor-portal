package cn.wyx.service.impl;

import org.apache.commons.beanutils.BeanUtils;

import cn.wyx.dao.UsersDao;
import cn.wyx.model.Parent;
import cn.wyx.model.Users;
import cn.wyx.query.UsersQuery;
import cn.wyx.service.UsersService;

public class UsersServiceImpl extends BaseServiceImpl<Users, UsersQuery> implements UsersService 
{	
	private UsersDao usersDao;
	
	public void setUsersDao(UsersDao usersDao) 
	{
		this.usersDao = usersDao;
		this.baseDao = usersDao;
	}

	@Override
	public Users getUsersByUname(String username)
	{
		return usersDao.getUsersByUname(username);
	}

	@Override
	public Users getUsersByUnameAndPWord(String username, String password)
	{
		return usersDao.getUsersByUnameAndPWord(username, password);
	}

	@Override
	public void updateUsers(Users user)
	{
		Users user1 = usersDao.getObj(user.getUId());
		try 
		{
			//把user中的所有属性拷贝到user1中
			BeanUtils.copyProperties(user1, user);
		} catch (Exception e) 
		{
			e.printStackTrace();
		} 
		usersDao.update(user1);		
	}
}
