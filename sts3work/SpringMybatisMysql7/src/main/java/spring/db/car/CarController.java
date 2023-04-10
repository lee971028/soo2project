package spring.db.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/samsung/list")
	public String list(Model model)
	{
		
		//전체갯수
		int totalCount=dao.getTotalCount();
		
		//목록가져오기
		List<MyCarDto> list=dao.getAllDatas();
		
		//request에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "car/carlist";
	}
	
	
	//입력폼으로 가기
	@GetMapping("/samsung/writeform")
	public String carform()
	{
		return "car/writeform";
	}
	
	
	//insert
	@PostMapping("/samsung/write")
	public String insert(@ModelAttribute MyCarDto dto)
	{
		dao.insertMyCar(dto);
		return "redirect:list";
	}
	
	//수정폼으로 가기
	@GetMapping("/samsung/updateform")
	public String updateform(@RequestParam String num,Model model)
	{
		//dto가져오기
		MyCarDto dto=dao.getData(num);
		//저장
		model.addAttribute("dto", dto);
		return "car/updateform";
	}
	
	//수정
	@PostMapping("/samsung/update")
	public String update(@ModelAttribute MyCarDto dto)
	{
		dao.updateMyCar(dto);
		return "redirect:list";
	}
	
	
	//삭제
	@GetMapping("/samsung/delete")
	public String delete(String num)
	{
		dao.deleteCar(num);
		return "redirect:list";
	}
}
