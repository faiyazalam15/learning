package net.faiyaz.model;
import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class MoviePersistance implements Serializable
{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO )
	@Column(name="mid")
	int mid;
	@Column(name="mtitle")
	String mtitle;
	@Column(name="mcost")
	int mcost;
	@Column(name="category")
	String category;
	@Column(name="dirid")
	String dirid;
	@Column(name="sid")
	String sid;
	public MoviePersistance() {
		super();
	}
	public MoviePersistance(String mtitle, int mcost, String category,String dirid, String sid) 
	{
		super();
		this.mtitle = mtitle;
		this.mcost = mcost;
		this.category = category;
		this.dirid = dirid;
		this.sid = sid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public int getMcost() {
		return mcost;
	}
	public void setMcost(int mcost) {
		this.mcost = mcost;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDirid() {
		return dirid;
	}
	public void setDirid(String dirid) {
		this.dirid = dirid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	
}
