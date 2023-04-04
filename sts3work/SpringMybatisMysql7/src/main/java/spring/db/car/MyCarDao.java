package spring.db.car;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	private SqlSession session;
	
	//총갯수
	public int getTotalCount()
	{
		return session.selectOne("getTotalCountOfMyCar");
	}
	
	//전체데이타
	public List<MyCarDto> getAllDatas()
	{
		return session.selectList("getAllDatasOfMycar");
	}
	
	//insert
	public void insertMyCar(MyCarDto dto)
	{
		session.insert("insertOfMyCar", dto); //id,파라메타
	}
	
	//수정폼
	public MyCarDto getData(String num)
	{
		return session.selectOne("getOneDataOfMyCar", num);
	}
	
	//수정
	public void updateMyCar(MyCarDto dto)
	{
		session.update("updateOfMyCar", dto);
	}
}
