package tools;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import pojo.Score;
import pojo.User;

public class MyTools {
	public Map scoreObjTool(List<Score> list) {
		Map map = new HashMap();
		Iterator it = list.iterator();
		int totalScore=0;
	    while (it.hasNext()) {
	    	Score score=(Score) it.next(); 
	    	map.put(score.getSubject(),score.getScore());
	    	totalScore+=score.getScore();
	    }
	    map.put("totalScore",totalScore);
	    Map newMap = new HashMap();
		newMap.put("data",map);
		return newMap;
	}
}
