package net.aitc.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import net.aitc.dao.UserDaoImpl;
import net.aitc.model.User;
public class UserServiceImpl implements UserService
{
	@Autowired  
	private UserDaoImpl daoImpl;

	@Override
	public void addUser(User user) 
	{
		daoImpl.addUser(user);
		
	}
	@Override
	public List<User> listUser() 
	{
		return null;
	}

	@Override
	public User getUser(int uuid) 
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(User user) 
	{
		// TODO Auto-generated method stub
		
	}

}
