package net.faiyaz.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
import net.faiyaz.model.DirectorPersistance;
public class DirectorDaoImp implements DirectorDao
{
	@Autowired
	HibernateTemplate hibernateTemplate;
	@Override
	public int addDirector(DirectorPersistance dp) 
	{
		try
		{
			hibernateTemplate.save(dp);
			System.out.println("Done...");
			return 1;
		}
		catch(DataAccessException dae)
		{		
			dae.printStackTrace();
			return 0;
		}
	}

}
