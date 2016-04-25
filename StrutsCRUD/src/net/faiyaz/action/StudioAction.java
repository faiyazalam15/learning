package net.faiyaz.action;
import java.util.List;

import net.faiyaz.dao.StudioDAO;
import net.faiyaz.model.Studio;
import net.faiyaz.util.HibernateUtil;

import com.opensymphony.xwork2.ActionSupport;
public class StudioAction extends ActionSupport
{
	private Studio studio;
	private List<Studio> listContact;
	int id;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Studio getStudio() {
		return studio;
	}
	public void setStudio(Studio studio) {
		this.studio = studio;
	}
	public List<Studio> getListContact() {
		return listContact;
	}
	public void setListContact(List<Studio> listContact) {
		this.listContact = listContact;
	}
	
	public StudioAction()
	{
		listContact=StudioDAO.fetchAll();
	}
	public  String addStudio()
	{
		try
		{
		StudioDAO.addStudio(studio);
		listContact=StudioDAO.fetchAll();
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return SUCCESS;
	}
	
	public String delete()
	{
		StudioDAO.delete(getId());
		listContact=StudioDAO.fetchAll();
		
		return SUCCESS;
	}
	
}
