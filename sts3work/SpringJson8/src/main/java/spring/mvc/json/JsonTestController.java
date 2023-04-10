package spring.mvc.json;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {

	@GetMapping("/list1")
	@ResponseBody /*json처리후 브라우져로 출력(일반컨트롤러일경우에만)*/
	public Map<String, String> list1()
	{
		Map<String, String> map=new HashMap<String, String>();
		
		map.put("name", "이승기");
		map.put("hp", "010-222-3333");
		map.put("addr", "서울시 강남구");
		
		return map;
	}
}
