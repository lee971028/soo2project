package mycar.data;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
//자동으로 mysql에 mycar라는 테이블이 만들어진다..변수가 변경될경우는 자동수정
@Table(name = "mycar")
@Data
public class MycarDto {

	@Id //각 엔티티를 구별할수 있는 식별아이디를 갖도록 설계(시퀀스)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long num;
	@Column(name = "carname")
	private String carname;
	@Column //이름이 같으면 생략
	private int carprice;
	@Column
	private String carcolor;
	@Column
	private String carguip;
	@CreationTimestamp //엔티티가 생성되는 시점의 시간 자동등록
	@Column(updatable = false)   //수정시 이컬럼은 수정하지 않겠다는 의미..안주면 수정시 null이 됨다
	private Timestamp guipday;
}
