package net.aitc.dao;
import java.util.List;

import net.aitc.dao.UserDao;
import net.aitc.model.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
public class UserDaoImpl implements UserDao
{
	@Autowired
	HibernateTemplate templat;

	@Override
	public void addUser(User user) 
	{
		templat.save(user);		
	}

	@Override
	public List<User> listUser()
	{
		return null;
	}

	@Override
	public User getUser(int uuid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(User user) {
		// TODO Auto-generated method stub
		
	}
}
