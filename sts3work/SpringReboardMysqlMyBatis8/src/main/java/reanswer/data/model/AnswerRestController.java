package reanswer.data.model;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AnswerRestController {

	@Autowired
	ReanswerDao adao;
	
	@GetMapping("/board/adelete") //ajax의 url과 일치
	public HashMap<String, Integer> answerDelete(@RequestParam int idx,
			@RequestParam String pass)
	{
		int check=adao.getCheckPass(idx, pass);
		
		if(check==1) //비번이 맞을경우 댓글삭제
		{
			adao.deleteAnswer(idx);
		}
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("check", check); //{"check":1}
		return map;
	}
	
	
}
