package service;

import java.util.List;

import javax.security.auth.Subject;

import org.apache.ibatis.annotations.Param;

import pojo.Faculty;
import pojo.Info;
import pojo.Register;
import pojo.Score;
import pojo.Special;
import pojo.User;

public interface UserDaoService {
	User getInfo(String id);
	int addRegister(Register register);
	Register isUser(String id);
	List<Faculty> getFaculty();
	List<Special> getSpecial(String title);
	List<User> getStudent(String classes, String special);
	List<Score> getMyScore(String id);
	//获取确定同学的确定学科的成绩信息
	List<Score> getCurScore(String id,String subject);
	//更新成绩
	int updateCurScore(Score score);
	//添加成绩
	int addCurScore(Score score);
	List<Subject> getSubject(String classes, String special);
	//更新个人信息
	int updateInfo(Info info);
	//添加个人信息
	int addInfo(Info info);
}
