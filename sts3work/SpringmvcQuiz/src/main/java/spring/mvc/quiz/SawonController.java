package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SawonController {

	@GetMapping("/")
	public String sawonform()
	{
		return "sawonform";
	}
	
	
	@PostMapping("/read")
	public ModelAndView readSawon(@ModelAttribute SawonDto dto)
	{
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("dto", dto);
		mview.setViewName("sawonresult");
		
		return mview;
	}
}
