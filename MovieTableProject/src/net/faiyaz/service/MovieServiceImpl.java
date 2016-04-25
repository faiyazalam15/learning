package net.faiyaz.service;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import net.faiyaz.dao.MovieDao;
import net.faiyaz.model.MoviePersistance;
public class MovieServiceImpl implements MoveService
{
	@Autowired
	MovieDao dao;
	@Override
	public int addMove(MoviePersistance mp)
	{
		int result=dao.addMove(mp);
		return result;
	}
	@Override
	public List<MoviePersistance> listMovie()
	{
		return dao.listMovie();
	}

}
