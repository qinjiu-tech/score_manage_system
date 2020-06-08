package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import tools.*;

import javax.annotation.Resource;
import javax.security.auth.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import net.sf.json.JSONObject;
import pojo.Faculty;
import pojo.Info;
import pojo.Register;
import pojo.Score;
import pojo.Special;
import pojo.User;
import service.UserDaoService;

@Controller
public class MyController {
	@Resource
	UserDaoService userDaoService;

	MyTools myTools = new MyTools();

	
	@ResponseBody()
	@RequestMapping("addInfo")
	public Map addInfo(Info info) {
		String status = "fail";
		String msg = "添加个人信息失败！";
		Map map = new HashMap();
		String id=info.getId();
		User user = userDaoService.getInfo(id);
		if (user != null) {
			int y = userDaoService.updateInfo(info);
			if (y != 0) {
				status = "success";
				msg = "修改个人信息成功！";
			}
		} else {
			int x = userDaoService.addInfo(info);
			if (x != 0) {
				status = "success";
				msg = "添加个人信息成功！";
			}
		}
		map.put("status", status);
		map.put("msg", msg);
		map.put("data",user);
		return map;
	}

	// 判断该用户是否未注册
	@ResponseBody()
	@RequestMapping("isUser")
	public Map isUser(String id) {
		Map map = new HashMap();
		Register register = userDaoService.isUser(id);
		if (register != null) {
			map.put("status", "fail");
			map.put("msg", "该用户已注册！");
		} else {
			map.put("status", "success");
			map.put("msg", "该用户还未注册！");
		}
		return map;
	}

	// 注册接口
	@ResponseBody()
	@RequestMapping("register")
	public Map register(Register register) {
		Map map = new HashMap();
		User user = userDaoService.getInfo(register.getId());
		if (user == null) {
			map.put("status", "fail");
			map.put("msg", "非本校师生无法注册！");
		} else if (!(user.getType()).equals(register.getType())) {
			map.put("status", "fail");
			map.put("msg", "注册失败，请检查身份！");
		} else {
			int x = userDaoService.addRegister(register);
			if (x != 0) {
				map.put("status", "success");
				map.put("msg", "注册成功！");
			} else {
				map.put("status", "fail");
				map.put("msg", "注册失败！");
			}
		}
		return map;
	}

	// 登录接口
	// 返回值
	// {
	// status:"success",
	// msg:"登录成功！",
	// data:{
	// type:"student"
	// }
	// }
	@ResponseBody()
	@RequestMapping("login")
	public Map login(String id, String pwd) {
		Map map = new HashMap();
		Register register = userDaoService.isUser(id);
		Map dataMap = new HashMap();
		if (register == null) {
			map.put("status", "fail");
			map.put("msg", "该用户还未注册！");
		} else {
			if (pwd.equals(register.getPwd())) {
				map.put("status", "success");
				map.put("msg", "登录成功！");
				dataMap.put("type", register.getType());
				map.put("data", dataMap);
			} else {
				map.put("status", "fail");
				map.put("msg", "密码不正确！");
			}
		}
		return map;
	}

	// 获取个人信息
	@ResponseBody()
	@RequestMapping("myInfo")
	public Map myInfo(String id) {
		Map map = new HashMap();
		User user = userDaoService.getInfo(id);
		if (user != null) {
			map.put("status", "success");
			map.put("msg", "获取个人信息成功！");
			map.put("data", user);
		} else {
			map.put("status", "fail");
			map.put("msg", "获取个人信息失败！");
		}
		return map;
	}

	// 获取所有院系
	@ResponseBody()
	@RequestMapping("getFaculty")
	public Map getFaculty() {
		Map map = new HashMap();
		List<Faculty> list = userDaoService.getFaculty();
		if (list.size() == 0) {
			map.put("status", "fail");
			map.put("msg", "获取院系失败！");
		} else {
			map.put("status", "success");
			map.put("msg", "获取院系成功！");
			map.put("data", list);
		}
		return map;
	}

	// 获取指定学院的所有专业
	@ResponseBody()
	@RequestMapping("getSpecial")
	public Map getSpecial(String title) {
		Map map = new HashMap();
//		map.put("data", title);
		List<Special> list = userDaoService.getSpecial(title);
		if (list.size() == 0) {
			map.put("status", "fail");
			map.put("msg", "当前年级专业为空！");
			map.put("data", title);
		} else {
			map.put("status", "success");
			map.put("msg", "获取专业成功！");
			map.put("data", list);
		}
		return map;
	}

	// 获取指定年级和专业的所有科目
	@ResponseBody()
	@RequestMapping("getSubject")
	public Map getSubject(String classes, String special) {
		Map map = new HashMap();
		List<Subject> list = userDaoService.getSubject(classes, special);
		if (list.size() != 0) {
			map.put("status", "success");
			map.put("msg", "获取所有科目成功！");
			map.put("data", list);
		} else {
			map.put("status", "fail");
			map.put("msg", "当前专业科目为空！");
		}
		return map;
	}

	// 获取指定年级和专业的所有学生
	@ResponseBody()
	@RequestMapping("getStudent")
	public Map getStudent(String classes, String special) {
		Map map = new HashMap();
		List<User> list = userDaoService.getStudent(classes, special);
		if (list.size() != 0) {
			map.put("status", "success");
			map.put("msg", "获取个人信息成功！");
			map.put("data", list);
		} else {
			map.put("status", "fail");
			map.put("msg", "获取个人信息失败！");
		}
		return map;
	}

	// 获取个人成绩
	@ResponseBody()
	@RequestMapping("getMyScore")
	public Map getMyScore(String id) {
		Map map = new HashMap();
		List<Score> list = userDaoService.getMyScore(id);
		if (list.size() == 0) {
			map.put("status", "fail");
			map.put("msg", "获取个人成绩失败！");
		} else {
			Map infoMap = myTools.scoreObjTool(list);
			infoMap.put("id", "201600800267");
			infoMap.put("name", "秦玖");
			map.put("status", "success");
			map.put("msg", "获取个人成绩成功！");
			map.put("data", infoMap);
		}
		return map;
	}

	// 获取指定专业和年级的全班成绩
	@ResponseBody()
	@RequestMapping("getScoreTable")
	public Map getScoreTable(String classes, String special) {
		Map map = new HashMap();
		List<User> allStudent = userDaoService.getStudent(classes, special);
		List resultList = new ArrayList();
		Iterator it = allStudent.iterator();
		while (it.hasNext()) {
			User user = (User) it.next();
			List<Score> list = userDaoService.getMyScore(user.getId());
			Map infoMap = myTools.scoreObjTool(list);
			infoMap.put("id", user.getId());
			infoMap.put("name", user.getName());
			resultList.add(infoMap);
		}
		if (resultList.size() == 0) {
			map.put("status", "fail");
			map.put("msg", "获取全班成绩失败！");
		} else {
			map.put("status", "success");
			map.put("msg", "获取全班成绩成功！");
			map.put("data", resultList);
		}
		return map;
	}

	// 编辑学生成绩接口
	// 传参
	// {
	// id:'201600800267',
	// data:JSON.stringify({
	// chinese:90,
	// math:99,
	// english:56,
	// ...
	// })
	// }
	@ResponseBody()
	@RequestMapping("updateScore")
	public Map updateScore(String id, String data) {
		String status = "fail";
		String msg = "更新成绩失败！";
		Map map = new HashMap();
		// json字符串转为json对象
		JSONObject obj = JSONObject.fromObject(data);
		Iterator it = obj.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry entry = (Map.Entry) it.next();
			// map.put(entry.getKey(),entry.getValue());
			String subject = (String) entry.getKey();
			int score = (int) entry.getValue();
			Score myScore = new Score();
			myScore.setId(id);
			myScore.setSubject(subject);
			myScore.setScore(score);
			// 获取当前同学的指定科目成绩信息
			List<Score> list = userDaoService.getCurScore(id, subject);
			if (list.size() == 0) {
				// 插入成绩
				int x = userDaoService.addCurScore(myScore);
				if (x != 0) {
					status = "success";
					msg = "插入成绩成功！";
				}
			} else {
				// 更新成绩
				int x = userDaoService.updateCurScore(myScore);
				if (x != 0) {
					status = "success";
					msg = "更新成绩成功！";
				}
			}
		}
		map.put("status", status);
		map.put("msg", msg);
		return map;
	}

	// 成绩分析
	@ResponseBody()
	@RequestMapping("scoreECharts")
	public Map scoreECharts(String classes, String special, String curSubject) {
		Map map = new HashMap();
		// 获取年级专业所有学生
		List<User> allStudent = userDaoService.getStudent(classes, special);
		Map infoMap = new HashMap();
		infoMap.put("subject", curSubject);
		Map dataMap = new HashMap();
		int A = 0;
		int B = 0;
		int C = 0;
		int D = 0;
		Iterator it = allStudent.iterator();
		while (it.hasNext()) {
			User user = (User) it.next();
			List<Score> scoreList = userDaoService.getCurScore(user.getId(), curSubject);
			if (scoreList.size() == 0) {
				D++;
			} else {
				Iterator itScore = scoreList.iterator();
				while (itScore.hasNext()) {
					Score scoreObj = (Score) itScore.next();
					int score = scoreObj.getScore();
					if (score > 85) {
						A++;
					} else if (score > 70) {
						B++;
					} else if (score > 60) {
						C++;
					} else {
						D++;
					}
//				map.put("test", score);
				}
			}
		}
		dataMap.put("A", A);
		dataMap.put("B", B);
		dataMap.put("C", C);
		dataMap.put("D", D);
		infoMap.put("data", dataMap);
		map.put("status", "success");
		map.put("data", infoMap);
		return map;
	}

}
