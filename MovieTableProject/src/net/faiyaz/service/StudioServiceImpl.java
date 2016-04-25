package net.faiyaz.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import net.faiyaz.dao.StudioDao;
import net.faiyaz.model.Studio;
import net.faiyaz.model.StudioPersistance;
public class StudioServiceImpl implements StudioService
{

	@Autowired
	StudioDao stDao;
	@Override
	public int addStudio(StudioPersistance st)
	{
		int result=stDao.addStudio(st);
		return result;
	}
	@Override
	public List<StudioPersistance> getStudio()
	{
		return stDao.getStudio();
	}
	@Override
	public int deleteStudio(StudioPersistance sp) 
	{
		
		return stDao.deleteStudio(sp);
	}
	@Override
	public int updateStudio(StudioPersistance sp) 
	{
		return stDao.updateStudio(sp);
	}
	@Override
	public StudioPersistance getStudioByID(int id) 
	{
		return stDao.getStudioByID(id);
	}

}
