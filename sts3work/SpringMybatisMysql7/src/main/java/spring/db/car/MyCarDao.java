package spring.db.car;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	private SqlSession session;
	
	//�Ѱ���
	public int getTotalCount()
	{
		return session.selectOne("getTotalCountOfMyCar");
	}
	
	//��ü����Ÿ
	public List<MyCarDto> getAllDatas()
	{
		return session.selectList("getAllDatasOfMycar");
	}
	
	//insert
	public void insertMyCar(MyCarDto dto)
	{
		session.insert("insertOfMyCar", dto); //id,�Ķ��Ÿ
	}
	
	//������
	public MyCarDto getData(String num)
	{
		return session.selectOne("getOneDataOfMyCar", num);
	}
	
	//����
	public void updateMyCar(MyCarDto dto)
	{
		session.update("updateOfMyCar", dto);
	}
}
