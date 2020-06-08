package dao;

import java.util.List;

import javax.security.auth.Subject;

import org.apache.ibatis.annotations.Param;

import pojo.Faculty;
import pojo.Info;
import pojo.Register;
import pojo.Score;
import pojo.Special;
import pojo.User;

public interface UserDao {
	User getInfo(String id);
	int addRegister(@Param("register")Register register);
//	该用户是否已经注册
	Register isUser(String id);
//	查询所有学院
	List<Faculty> getFaculty();
	List<Special> getSpecial(String title);
	//获取某个专业的所有人（参数：年级，专业）
	List<User> getStudent(@Param("classes")String classes,@Param("special")String special);
	List<Score> getMyScore(String id);
	//获取确定同学的确定学科的成绩信息
	List<Score> getCurScore(@Param("id")String id,@Param("subject")String subject);
	//更新成绩
	int updateCurScore(@Param("score")Score score);
	//添加成绩
	int addCurScore(@Param("score")Score score);
	//获取确定年级和专业的所有科目
	List<Subject> getSubject(@Param("classes")String classes,@Param("special")String special);
	
	//更新个人信息
	int updateInfo(@Param("info")Info info);
	//添加个人信息
	int addInfo(@Param("info")Info info);
}
