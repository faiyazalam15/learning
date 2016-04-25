package net.faiyaz.Controller;
import p1.Student;
import com.opensymphony.xwork2.ActionSupport;
public class ActionController extends ActionSupport
{
	Student st;

	public Student getSt() {
		return st;
	}

	public void setSt(Student st) {
		this.st = st;
	}

	@Override
	public String execute() throws Exception
	{
		return SUCCESS;
	}

	@Override
	public void validate() 
	{
		if(st.getSid()<=0)
		{
			System.out.println("value Is"+st.getSid());
			addFieldError("st.sid","Please Fill This Column");
		}
	}
	
	
	

}
