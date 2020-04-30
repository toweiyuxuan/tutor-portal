package cn.wyx.service;

import cn.wyx.model.Users;
import cn.wyx.query.UsersQuery;

public interface UsersService extends BaseService<Users, UsersQuery> 
{
	public Users getUsersByUname(String username);
	public Users getUsersByUnameAndPWord(String username, String password);
	
	public void updateUsers(Users user);
}
