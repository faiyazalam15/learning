package net.faiyaz.dao;
import java.util.List;

import net.faiyaz.delegate.DirectorDelegation;
import net.faiyaz.model.Director;
import net.faiyaz.util.HibernateUtil;

import org.hibernate.Query;
import org.hibernate.Session;
public class DirectorDAO  //implements DirectorDelegation
{
	public static void add(Director director) 
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.save(director);
		session.beginTransaction().commit();
		System.out.println("Adding Done...");
		//return director;
	}
	public static List<Director> AllFetch()
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Query qry=session.createQuery("from net.faiyaz.model.Director");
		List<Director> result=qry.list();
		Object ob[]=result.toArray();
		for (Object object : ob) 
		{
			System.out.println(object);
		}
		return result;
		
	}
	
}
