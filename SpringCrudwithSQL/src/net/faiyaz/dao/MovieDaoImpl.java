package net.faiyaz.dao;
import java.util.List;

import net.faiyaz.model.MoviePersistance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
public class MovieDaoImpl implements MovieDao
{
	@Autowired
	HibernateTemplate  hibernateTemp;
	@Override
	public int addMove(MoviePersistance mp)
	{
		try
		{
			hibernateTemp.save(mp);
			System.out.println("Done...");
			return 1;
		}
		catch(DataAccessException dae)
		{
			dae.printStackTrace();
			return 0;
		}
		
	}
	@Override
	public List<MoviePersistance> listMovie() 
	{
		List<MoviePersistance> lst=hibernateTemp.find("from MoviePersistance");
		return lst;
	}

}
