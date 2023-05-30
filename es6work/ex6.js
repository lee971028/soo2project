//화살표 함수: 일반함수와의 차이점: 객체생성안됨,new 사용못함

//일반함수
function f1()
{
    console.log("일반함수 f1");
}

f1();

//화살표
let f2=()=>console.log("화살표함수f2");

f2();

//일반
function f3(a,b){
    return a+b;
}

let a=f3(5,7);
console.log(a); //12

//화살표
let f4=(a,b)=>a+b; //한줄일땐 리턴생략가능
let b=f4(11,22);
console.log(b);

function f5(x,y,z=30){

    return x+y+z;
}

console.log(f5(1,2,3));
console.log(f5(10,20));

//f5를 화살표함수 f6으로 구현후 호출
let f6=(x,y,z=30)=>x+y+z;

console.log(f6(1,2,3));
console.log(f6(10,20));

//오브젝트함수를 객체로 만들수도 있다
//f1안에 f2를 만들어서 f1호출할수 있다

let ob={

    f1:()=>{

        console.log(1);

        let f2=()=>console.log(2);
        f2();

        setTimeout(f2,1000);
    }
}

ob.f1();