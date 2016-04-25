package net.faiyaz.dao;
import java.util.List;
import net.faiyaz.model.MoviePersistance;
public interface MovieDao 
{
	public int addMove(MoviePersistance mp);
	public List<MoviePersistance> listMovie();
	
}