package cn.wyx.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import cn.wyx.dao.UsersDao;
import cn.wyx.model.Users;
import cn.wyx.query.UsersQuery;

public class UsersDaoImpl extends BaseDaoImpl<Users, UsersQuery> implements UsersDao 
{

	@Override
	public String createHql(UsersQuery equery) 
	{
		String hql = "from Users u where 1=1 ";		
		return hql;
	}

	@Override
	public String createHqlCount(UsersQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String createHqlCondition(UsersQuery q) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Users getUsersByUname(String username)
	{
		Users user = null;
		String hql = "from Users u where u.UTel = ?";
		List list = this.getHibernateTemplate().find(hql, username);
		if(list.size() > 0)
		{
			user = (Users) list.get(0);
		}
		return user;
	}

	@Override
	public Users getUsersByUnameAndPWord(final String username, final String password)
	{
		final String hql = "from Users u where u.UTel = :UTel and u.UPassword = :UPassword";
		Users user = this.getHibernateTemplate().execute(new HibernateCallback<Users>() 
		{
			@Override
			public Users doInHibernate(Session session) throws HibernateException,SQLException 
			{
				Query query = session.createQuery(hql);
				query.setParameter("UTel",username);
				query.setParameter("UPassword",password);
				return (Users) query.uniqueResult();
			}
		});
		return user;
	}
	
}
