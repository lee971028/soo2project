package spring.anno.ex4;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component  //logicController 이름으로 등록  @Component("name") 을 주어도 된다
public class LogicController {

	@Autowired
	//@Resource(name = "myDao") //정확한 빈의 아이디로 주입_모호성이있을때
	DaoInter daoInter;
	
	public LogicController(MyDao dao) {
		this.daoInter=dao;
	}
	
	
	//insert
	public void insert(String str)
	{
		daoInter.insertData(str);
	}
	
	//delete
	public void delete(String num)
	{
		daoInter.deleteData(num);
	}
}
