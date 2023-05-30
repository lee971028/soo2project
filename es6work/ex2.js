// es6문법공부

/* var: 함수형변수
   let: 영역형변수(영역별로 다른메모리 갖느다)
*/

var a=1;
let b=2;

function myFuction(){

    var a=3; //7번행과 전혀다른변수
    let b=4;  //8행과 다른변수

    if(true){
        var a=5; 
        let b=6;

        console.log(a); //5
        console.log(b);  //6
    }

    console.log(a); //5
    console.log(b);  //4
}

myFuction();

console.log(a); //전역변수 출력1
console.log(b);  //2