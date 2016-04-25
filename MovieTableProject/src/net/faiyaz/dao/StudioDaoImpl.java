package net.faiyaz.dao;
import java.util.Iterator;
import java.util.List;

import net.faiyaz.model.StudioPersistance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateTemplate;
public class StudioDaoImpl implements StudioDao
{ 
	@Autowired
	HibernateTemplate hibernateTemplate;
	@Override
	public int addStudio(StudioPersistance st) 
	{
		try
		{
			hibernateTemplate.save(st);
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
	public List<StudioPersistance> getStudio()
	{
		List<StudioPersistance> lst=hibernateTemplate.find("from StudioPersistance");
		/*if(lst.size()>0)
		{
			Iterator<StudioPersistance> itr=lst.iterator();
			while(itr.hasNext())
			{
				StudioPersistance sp=(StudioPersistance)itr.next();
				System.out.println("Data From SQL");
				System.out.println(sp.getSid());
				System.out.println(sp.getSname());
				System.out.println(sp.getScity());
			}
			return lst;
		}
		else*/
		return lst;
	}
	@Override
	public int deleteStudio(StudioPersistance sp) 
	{
		try
		{
			hibernateTemplate.delete(sp);
			return 1;
		}
		catch(DataAccessException e)
		{
			e.printStackTrace();
			return 0;
		}
	}
	@Override
	public int updateStudio(StudioPersistance sp)
	{
		hibernateTemplate.update(sp);
		return 1;
	}
	@Override
	public StudioPersistance getStudioByID(int id)
	{
		List<StudioPersistance> lst=hibernateTemplate.find("from StudioPersistance where sid=?",id );
		StudioPersistance sp=null;
		Iterator<StudioPersistance> it=lst.iterator();
		while(it.hasNext())
		{
			sp=(StudioPersistance)it.next();
			
		}
		System.out.println("Get By ID");
		System.out.println(sp.getSid());
		System.out.println(sp.getSname());
		System.out.println(sp.getScity());
		System.out.println("---------------");
		return sp;
	}

}
