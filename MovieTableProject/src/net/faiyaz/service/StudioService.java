package net.faiyaz.service;

import java.util.List;

import net.faiyaz.model.Studio;
import net.faiyaz.model.StudioPersistance;

public interface StudioService
{
	public int addStudio(StudioPersistance st);
	public List<StudioPersistance> getStudio();
	public int deleteStudio(StudioPersistance sp);
	public int updateStudio(StudioPersistance sp);
	public StudioPersistance getStudioByID(int id);
}
