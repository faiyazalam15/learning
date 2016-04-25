package net.aitc.controller;
import java.util.ArrayList;
import java.util.List;

import net.aitc.model.User;
import net.aitc.model.UserModel;
import net.aitc.service.UserServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class UserController 
{
	@RequestMapping(value = "/allusers", method = RequestMethod.GET, headers = "Accept=application/json")
	public List<UserModel> getUsers() 
	{
		List<UserModel> listOfUsers = new ArrayList<UserModel>();
		listOfUsers = createUsersList();
		return listOfUsers;
	}
	@RequestMapping(value = "/user", method = RequestMethod.POST,consumes = "application/json", produces = "application/json")
	public @ResponseBody UserModel createEmploye(@RequestBody UserModel user) 
	{
		User u=new User(user.getFullName(),user.getDob(),user.getSex(),user.getMob(),user.getDescription(),user.getEmail());
		System.out.println(u.getFullName());
		System.out.println(u.getDob());
		System.out.println(u.getSex());
		System.out.println(u.getMob());
		System.out.println(u.getDescription());
		System.out.println(u.getEmail());
        return user;
    }
	/*@RequestMapping(value = "/user/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public UserModel getCountryById(@PathVariable int id) 
	{
		List<UserModel> listOfUsers = new ArrayList<UserModel>();
		listOfUsers =createUsersList();
		for (UserModel user : listOfUsers) 
		{
			if (user.getUuid() == id)
				return user;
		}
		return null;
	}*/
	public List<UserModel> createUsersList() 
	{
		UserModel indiaCountry = new UserModel(1, "Faiyaz","3-may-1989","Male","999","Hw r u","faiyazalam15@gmail.com");
		UserModel chinaCountry = new UserModel(4, "China");
		UserModel nepalCountry = new UserModel(3, "Nepal");
		UserModel bhutanCountry = new UserModel(2, "Bhutan");

		List<UserModel> listOfCountries = new ArrayList<UserModel>();
		listOfCountries.add(indiaCountry);
		listOfCountries.add(chinaCountry);
		listOfCountries.add(nepalCountry);
		listOfCountries.add(bhutanCountry);
		return listOfCountries;
	}
}