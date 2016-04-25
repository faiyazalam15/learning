package net.faiyaz.model;

public class Studio 
{
	int sid;
	String sname;
	String scity;
	public Studio()
	{
		super();
	}
	public Studio(String sname, String scity)
	{
		super();
		this.sname = sname;
		this.scity = scity;
	}
	public int getSid() 
	{
		return sid;
	}

	public void setSid(int sid)
	{
		this.sid = sid;
	}

	public String getSname() 
	{
		return sname;
	}

	public void setSname(String sname) 
	{
		this.sname = sname;
	}

	public String getScity()
	{
		return scity;
	}

	public void setScity(String scity)
	{
		this.scity = scity;
	}

}
