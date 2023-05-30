//함수파라메터에 기본값 가능
function func1(x,y=200,z=300){
 
    console.log(x,y,z);
}

func1(3,4,5);
func1(100);
func1(2,5);
func1();

function func2(a,b){
    return a+b;
}

let r1=func2(5,6);
console.log(r1);

let arr=[2,5,9];
let r2=func2(arr[0],arr[1]);
console.log(r2);

//es6에서 추가된 기능,펼침연산자(...)라고 부른다
func1(...arr);
func1(arr[0],arr[1],arr[2]);

let r3=func2(...arr);
console.log(r3);