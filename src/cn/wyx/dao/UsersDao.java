package cn.wyx.dao;

import cn.wyx.model.Users;
import cn.wyx.query.UsersQuery;

public interface UsersDao extends BaseDao<Users, UsersQuery> 
{
	public Users getUsersByUname(String username);
	public Users getUsersByUnameAndPWord(String username, String password);
}
