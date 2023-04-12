package boot.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	@GetMapping("/test")
	public TestDto hello()
	{
		TestDto dto=new TestDto();
		
		dto.setName("박예은");
		dto.setAddr("서울시 서초구");
		
		return dto;
	}
}
