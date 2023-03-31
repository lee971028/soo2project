package data.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.dto.ShopDto;
import jakarta.servlet.http.HttpSession;

@Controller
public class HelloController {

	List<ShopDto> list=new ArrayList<>();
	
	 @GetMapping("/")
	    public String home()
	    {
	        return "home";
	    }
	 
	 @GetMapping("/hello1")
	    public String hello1(Model model)
	    {
	        System.out.println("hello1 controller");
	        model.addAttribute("message","Have a Nice Day!!!");
	        model.addAttribute("today", new Date());
	        ShopDto dto=ShopDto.builder()
	                .num(100)
	                .sangpum("남방")
	                .su(2)
	                .dan(20000)
	                .color("blue")
	                .build();
	        model.addAttribute("dto",dto);
	        return "hello1";
	    }
	 
	 @GetMapping("/hello2")
	    public String hello2(String name,int age,Model model)
	    {
	        model.addAttribute("msg",name+"님의 나이는 "+age+"세입니다");
	        return  "hello2";
	    }
	 
	 @GetMapping("/list")
	    public String list(Model model)
	    {
	        list.add(new ShopDto(1,"스커트",2,20000,"orange"));
	        list.add(new ShopDto(2,"티셔츠",3,35000,"pink"));
	        list.add(new ShopDto(3,"자켓",4,78000,"#fcdfed"));
	        ShopDto dto4=ShopDto.builder()
	                        .num(4)
	                          .sangpum("버버리코트")
	                            .su(23)
	                                .dan(2000000)
	                                   .color("green")
	                        .build();
	        list.add(dto4);

	        model.addAttribute("list",list);
	        return "list";
	    }
	 
	 @GetMapping("/detail")
	    public String detail(@RequestParam int index,Model model)
	    {
	        model.addAttribute("dto",list.get(index));
	        return "detail";
	    }
	 
	 @GetMapping("/login1")
	    public String login1(HttpSession session)
	    {
	        session.setAttribute("myid","admin");
	        return "login";
	    }
	 
	 @GetMapping("/login2")
	    public String login2(HttpSession session)
	    {
	        session.setAttribute("myid","angel");
	        return "login";
	    }

}
