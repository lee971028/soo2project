let irum="최보현";
let birth=1997;
let food='삼겹살';

let curYear=new Date().getFullYear();

//예전출력방식
let result="이름: "+irum+"\n태어난 연도: "+birth+"\n나이: "+(curYear-birth)+"\n좋아하는 음식: "+food;

console.log(result);

//리터럴방식출력 : 중간변수는 $
let result2=`이름: ${irum}
태어난 연도: ${birth}
나이: ${curYear-birth}
좋아하는 음식: ${food}`

console.log(result2);