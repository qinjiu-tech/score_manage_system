package service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.security.auth.Subject;

import org.springframework.stereotype.Service;

import dao.UserDao;
import pojo.Faculty;
import pojo.Info;
import pojo.Register;
import pojo.Score;
import pojo.Special;
import pojo.User;
import service.UserDaoService;


@Service
public class UserDaoServiceImp implements UserDaoService{
	@Resource
	private UserDao userDao;

	@Override
	public User getInfo(String id) {
		// TODO Auto-generated method stub
		return userDao.getInfo(id);
	}
	
	@Override
	public int addRegister(Register register) {
		int x =userDao.addRegister(register);
		return x;
	}

	@Override
	public Register isUser(String id) {
		// TODO Auto-generated method stub
		return userDao.isUser(id);
	}

	@Override
	public List<Faculty> getFaculty() {
		// TODO Auto-generated method stub
		List<Faculty> list=userDao.getFaculty();
		return list;
	}

	@Override
	public List<Special> getSpecial(String title) {
		// TODO Auto-generated method stub
		List<Special> list=userDao.getSpecial(title);
		return list;
	}

	@Override
	public List<User> getStudent(String classes,String special) {
		// TODO Auto-generated method stub
		List<User> list= userDao.getStudent(classes,special);
		return list;
	}


	@Override
	public List<Score> getMyScore(String id) {
		// TODO Auto-generated method stub
		List<Score> list=userDao.getMyScore(id);
		return list;
	}

	@Override
	public List<Score> getCurScore(String id, String subject) {
		// TODO Auto-generated method stub
		List<Score> list=userDao.getCurScore(id, subject);
		return list;
	}

	@Override
	public int updateCurScore(Score score) {
		// TODO Auto-generated method stub
		int x =userDao.updateCurScore(score);
		return x;
	}

	@Override
	public int addCurScore(Score score) {
		// TODO Auto-generated method stub
		int x =userDao.addCurScore(score);
		return x;
	}

	@Override
	public List<Subject> getSubject(String classes, String special) {
		// TODO Auto-generated method stub
		List<Subject> list=userDao.getSubject(classes, special);
		return list;
	}

	@Override
	public int updateInfo(Info info) {
		// TODO Auto-generated method stub
		int x =userDao.updateInfo(info);
		return x;
	}

	@Override
	public int addInfo(Info info) {
		// TODO Auto-generated method stub
		int x =userDao.addInfo(info);
		return x;
	}


	
}
