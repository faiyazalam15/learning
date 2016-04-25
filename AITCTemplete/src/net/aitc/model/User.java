package net.aitc.model;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
public class User
{
	@Id
	 @GeneratedValue(strategy=GenerationType.AUTO)
	int uuid;
	String fullName;
	String dob;
	String sex;
	String mob;
	String description;
	String email;
	public int getUuid() {
		return uuid;
	}
	public void setUuid(int uuid) {
		this.uuid = uuid;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User(String fullName, String dob, String sex, String mob,
			String description, String email) {
		super();
		this.fullName = fullName;
		this.dob = dob;
		this.sex = sex;
		this.mob = mob;
		this.description = description;
		this.email = email;
	}
	
	
}
