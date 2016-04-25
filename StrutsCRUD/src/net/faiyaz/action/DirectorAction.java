package net.faiyaz.action;
import java.util.List;

import net.faiyaz.dao.DirectorDAO;
import net.faiyaz.model.Director;

import com.opensymphony.xwork2.ActionSupport;
public class DirectorAction extends ActionSupport
{
	private Director director;
	List<Director> directorList;
	//---------------------Getter and Setters------------------------------
	public List<Director> getDirectorList() {
		return directorList;
	}

	public void setDirectorList(List<Director> directorList) {
		this.directorList = directorList;
	}

	public Director getDirector() {
		return director;
	}

	public void setDirector(Director director) {
		this.director = director;
	}
//--------------------Working Method-----------------------------------------
	@Override
	public String execute() throws Exception 
	{
		return SUCCESS;
	}
	
	public String add()
	{
		try
		{
			
		DirectorDAO.add(getDirector());
		this.directorList=DirectorDAO.AllFetch();
		System.out.println(directorList);

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return SUCCESS;
		
		
	}
	
}
