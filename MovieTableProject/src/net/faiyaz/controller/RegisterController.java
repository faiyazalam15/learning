package net.faiyaz.controller;
import java.util.List;

import net.faiyaz.model.MoviePersistance;
import net.faiyaz.service.MovieServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
@Controller
@SessionAttributes
public class RegisterController 
{
	@Autowired
	MovieServiceImpl service;
	List<MoviePersistance> mov;
	
	
	@InitBinder
	public void initBinder(WebDataBinder binder)
	{
		binder.setDisallowedFields(new String[] {"mcost"});
	}
	
	
	@RequestMapping(value="movieFrom.fz",method=RequestMethod.GET)
	public ModelAndView movieForm()
	{
		ModelAndView model1=new ModelAndView("moveForm");
		return model1;
	}
	
	@RequestMapping(value="mvFrm.fz",method=RequestMethod.GET)
	public ModelAndView movieFormBack()
	{
		ModelAndView model1=new ModelAndView("moveForm");
		return model1;
	}
	
	
	@RequestMapping(value = "/addContact.fz", method = RequestMethod.POST)
	public ModelAndView submitAdmissionForm(@ModelAttribute("mv")MoviePersistance movie, BindingResult result) 
	{
		
		if (result.hasErrors()) 
		{

			ModelAndView model1 = new ModelAndView("moveForm");
			return model1;
		}
		else
		{
	
			String mtitle=movie.getMtitle();
			int mcost=movie.getMcost();
			String category=movie.getCategory();
			String dirid=movie.getDirid();
			String sid=movie.getSid();
			
			MoviePersistance pMoviePersistance=new MoviePersistance(movie.getMtitle(),movie.getMcost(),movie.getCategory(),movie.getDirid(),movie.getSid());
			service.addMove(pMoviePersistance);
			
			mov=service.listMovie();
			ModelAndView model1 = new ModelAndView("successData","mov",mov);
			return model1;
			
		}
	}
}
