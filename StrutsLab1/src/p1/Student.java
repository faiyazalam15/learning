package p1;
public class Student 
{
	int sid;
	String sname;
	String pwd;
	String state;
	String gen;
	String hob;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getHob() {
		return hob;
	}
	public void setHob(String hob) {
		this.hob = hob;
	}
	@Override
	public String toString() {
		return "Student [sid=" + sid + ", sname=" + sname + ", pwd=" + pwd
				+ ", state=" + state + ", gen=" + gen + ", hob=" + hob + "]";
	}
	
}
