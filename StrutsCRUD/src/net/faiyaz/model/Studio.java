package net.faiyaz.model;
import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Studio 
{
	@Id
	int sid;
	String sname;
	String city;
	
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	@Override
	public String toString() {
		return "Studio [sid=" + sid + ", sname=" + sname + ", city=" + city
				+ "]";
	}
	
}
