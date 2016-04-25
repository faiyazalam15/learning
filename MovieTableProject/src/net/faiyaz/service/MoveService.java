package net.faiyaz.service;
import java.util.List;
import net.faiyaz.model.MoviePersistance;
public interface MoveService
{
	public int addMove(MoviePersistance mp);
	public List<MoviePersistance> listMovie();
}
