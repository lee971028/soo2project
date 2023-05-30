//const  :상수

const PI=3.14589;
let r=3;

let area=r*r*PI;
console.log("반지름이 %d인 원의 너비: %f: ",r,area);

//PI=1.23564;

//const도 객체선언이 가능
const pp={
    "name":"홍길동",
    "addr":"서울 강남"
}

console.log("이름: "+pp.name);
console.log("주소: "+pp.addr);

//객체타입일경우 멤버는 변경가능
pp.name="이효리";
pp.addr="제주시";

console.log("이름: "+pp.name);
console.log("주소: "+pp.addr);

/*pp={

}  :객체값 자체변경은 에러발생*/