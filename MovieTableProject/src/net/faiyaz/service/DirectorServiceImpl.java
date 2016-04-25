package net.faiyaz.service;
import net.faiyaz.dao.DirectorDao;
import net.faiyaz.model.DirectorPersistance;
import org.springframework.beans.factory.annotation.Autowired;

public class DirectorServiceImpl implements DirectorServiece
{
	@Autowired
	DirectorDao directordao;
	@Override
	public int addDirector(DirectorPersistance dp) 
	{
		directordao.addDirector(dp);
		return 0;
	}
	

}
