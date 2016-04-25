package net.faiyaz.controller;
import java.util.Iterator;
import java.util.List;

import net.faiyaz.model.Studio;
import net.faiyaz.model.StudioPersistance;
import net.faiyaz.service.StudioServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudioController
{
	@Autowired
	StudioServiceImpl serImpl;
	List<StudioPersistance> stu;
		
	public StudioServiceImpl getSerImpl() {
		return serImpl;
	}

	public void setSerImpl(StudioServiceImpl serImpl) {
		this.serImpl = serImpl;
	}


	@RequestMapping(value="std.fz")
	public ModelAndView fromShow(@ModelAttribute("command")StudioPersistance studio,BindingResult result)
	{
		stu=serImpl.getStudio();
		ModelAndView model1=new ModelAndView("studioForm","stu",stu);
		return model1;
	}
	
	@RequestMapping(value="stdSub.fz",method=RequestMethod.POST)
	public ModelAndView submitForm(@ModelAttribute("command")StudioPersistance studio,BindingResult result)
	{
		System.out.println(studio.getSid());
		System.out.println(studio.getSname());
		System.out.println(studio.getScity());
		
		StudioPersistance sp=new StudioPersistance(studio.getSname(),studio.getScity());
		serImpl.addStudio(sp);
		
		
		/*if(stu.size()>0)
		{
			Iterator<StudioPersistance> itr=stu.iterator();
			while(itr.hasNext())
			{
				StudioPersistance sp1=(StudioPersistance)itr.next();
				System.out.println("Data From SQL");
				System.out.println(sp1.getSid());
				System.out.println(sp1.getSname());
				System.out.println(sp1.getScity());
			}
		}	*/	
		stu=serImpl.getStudio();
		ModelAndView model1=new ModelAndView("studioForm","stu",stu);
		return model1;
	}
	@RequestMapping(value="delete.fz")
	public ModelAndView delData(@ModelAttribute("command")StudioPersistance studio,BindingResult result)
	{
		
		System.out.println(studio.getSid());
		System.out.println(studio.getSname());
		System.out.println(studio.getScity());
		serImpl.deleteStudio(studio);
		
		stu=serImpl.getStudio();
		ModelAndView model1=new ModelAndView("studioForm","stu",stu);
		return model1;
	}	
	
	@RequestMapping(value="stdUpd.fz")
	public ModelAndView editSub(@ModelAttribute("command")StudioPersistance studio,BindingResult result)
	{
		
		System.out.println(studio.getSid());
		System.out.println(studio.getSname());
		System.out.println(studio.getScity());
		serImpl.updateStudio(studio);
		
		stu=serImpl.getStudio();
		ModelAndView model1=new ModelAndView("studioForm","stu",stu);
		return model1;
	}
	
	@RequestMapping(value="edit.fz")
	public ModelAndView editData(@ModelAttribute("command")StudioPersistance studio,BindingResult result)
	{
		serImpl.getStudioByID(studio.getSid());
		System.out.println(studio.getSid());
		System.out.println(studio.getSname());
		System.out.println(studio.getScity());		
		stu=serImpl.getStudio();
		ModelAndView model1=new ModelAndView("studioUpdate","stu",stu);
		return model1;
	}
	
}
