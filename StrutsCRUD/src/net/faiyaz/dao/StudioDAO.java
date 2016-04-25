package net.faiyaz.dao;
import java.util.List;
import net.faiyaz.model.Studio;
import net.faiyaz.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import com.opensymphony.xwork2.ActionSupport;
public class StudioDAO extends ActionSupport
{
	
	public static Studio addStudio(Studio st)
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		session.save(st);
		session.getTransaction().commit();
		System.out.println("done...");
		return st;
	}
	
	public static List<Studio> fetchAll()
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Query qry=session.createQuery("From net.faiyaz.model.Studio");
		List lst=qry.list();
		Object ob[]=lst.toArray();
		for (Object object : ob)
		{
			System.out.println(object);
		}
		return lst;
	}
	public static void delete(int id)
	{
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Studio st=(Studio)session.load(Studio.class,id);
		session.delete(st);
		session.beginTransaction().commit();
	}
	
}
