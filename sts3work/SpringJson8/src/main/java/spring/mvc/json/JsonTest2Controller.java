package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController  /*JsonÀü¿ëÀÌ¹Ç·Î ÀÏ¹Ý¸Þ¼­µå ¾ÈµÊ*/
public class JsonTest2Controller {

	@GetMapping("/list2")
	public List<PhotoDto> list2()
	{
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("»÷µåÀ§Ä¡", "1.jpg"));
		list.add(new PhotoDto("²¿Ä¡±¸ÀÌ", "2.jpg"));
		list.add(new PhotoDto("±×¶óÅÁ", "5.jpg"));
		list.add(new PhotoDto("¸Á°íºù¼ö", "11.jpg"));
		list.add(new PhotoDto("¿ì¾ûÁ¶¸²", "9.jpg"));
		return list;
	}
	
	
	@GetMapping("/list3")
	public Map<String,Object> list3(@RequestParam String name)
	{
		List<PhotoDto> list=new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("»÷µåÀ§Ä¡", "1.jpg"));
		list.add(new PhotoDto("²¿Ä¡±¸ÀÌ", "2.jpg"));
		list.add(new PhotoDto("±×¶óÅÁ", "5.jpg"));
		list.add(new PhotoDto("¸Á°íºù¼ö", "11.jpg"));
		list.add(new PhotoDto("¿ì¾ûÁ¶¸²", "9.jpg"));
		
		Map<String, Object> map=new HashMap<String, Object>();
		
		for(PhotoDto dto:list)
		{
			if(name.equals(dto.getName())) {
				map.put("name",dto.getName());
				map.put("photo",dto.getPhoto());
			}
		}
		
		return map;		
	}
}
