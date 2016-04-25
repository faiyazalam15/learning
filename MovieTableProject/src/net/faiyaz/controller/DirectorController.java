package net.faiyaz.controller;
import net.faiyaz.model.Director;
import net.faiyaz.model.DirectorPersistance;
import net.faiyaz.service.DirectorServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
@Controller
@SessionAttributes
public class DirectorController
{
	@Autowired
	DirectorServiceImpl dirservice;
	
	@RequestMapping(value="dir.fz",method=RequestMethod.GET)
	public ModelAndView directorForm()
	{
		ModelAndView model1=new ModelAndView("directorForm");
		return model1;
	}
	
	@RequestMapping(value="dirForm.fz",method=RequestMethod.POST)
	public ModelAndView directorSubmit(@ModelAttribute("director")Director director,BindingResult result)
	{
		int did=director.getDid();
		String dfname=director.getDfname();
		String dlname=director.getDlname();
		String dcity=director.getDcity();
		System.out.println(did);
		System.out.println(dfname);
		System.out.println(dlname);
		System.out.println(dcity);
		DirectorPersistance dp=new DirectorPersistance(director.getDfname(),director.getDlname(),director.getDcity());
		dirservice.addDirector(dp);
		ModelAndView model2=new ModelAndView("directorForm");
		return model2;
	}
}
