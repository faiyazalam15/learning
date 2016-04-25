package net.faiyaz.model;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
public class DirectorPersistance implements Serializable
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int did;
	private String dfname;
	private String dlname;
	private String dcity;
	
	public DirectorPersistance() {
		super();
	}
	
	public DirectorPersistance(String dfname, String dlname,
			String dcity) {
		super();
		
		this.dfname = dfname;
		this.dlname = dlname;
		this.dcity = dcity;
	}

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
	
}
