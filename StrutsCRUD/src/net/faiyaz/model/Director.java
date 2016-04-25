package net.faiyaz.model;
import javax.persistence.Entity;
import javax.persistence.Id;
@Entity
public class Director 
{
	@Id
	int did;
	String dfname;
	String dlname;
	String dcity;
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getDfname() {
		return dfname;
	}
	public void setDfname(String dfname) {
		this.dfname = dfname;
	}
	public String getDlname() {
		return dlname;
	}
	public void setDlname(String dlname) {
		this.dlname = dlname;
	}
	public String getDcity() {
		return dcity;
	}
	public void setDcity(String dcity) {
		this.dcity = dcity;
	}
	@Override
	public String toString() {
		return "Director [did=" + did + ", dfname=" + dfname + ", dlname="
				+ dlname + ", dcity=" + dcity + "]";
	}
	
	
	
}
