package spring.anno.ex4;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component  //logicController �̸����� ���  @Component("name") �� �־ �ȴ�
public class LogicController {

	@Autowired
	//@Resource(name = "myDao") //��Ȯ�� ���� ���̵�� ����_��ȣ����������
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
