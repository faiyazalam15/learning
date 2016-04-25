package net.faiyaz.dao;
import java.util.List;

import net.faiyaz.controller.StudioController;
import net.faiyaz.model.Studio;
import net.faiyaz.model.StudioPersistance;
public interface StudioDao 
{
	public int addStudio(StudioPersistance st);
	public List<StudioPersistance> getStudio();
	public int deleteStudio(StudioPersistance sp);
	public int updateStudio(StudioPersistance sp);
	public StudioPersistance getStudioByID(int id);
}
