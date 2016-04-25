package net.aitc.dao;
import java.util.List;
import net.aitc.model.User;
public interface UserDao 
{	   
	public void addUser(User user);    
	public List<User> listUser();
	public User getUser(int uuid);
	public void deleteUser(User user); 
}
