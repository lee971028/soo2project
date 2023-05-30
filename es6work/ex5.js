let arr1=[2,4,6];
let arr2=[7,8];
let arr3=[11,12,...arr1,22,...arr2];

console.log(arr3.length); //8
console.dir(arr3); //구조까지 보기좋게 출력

let arr4=[...[100,200],...arr2];
console.log(arr4);

function fsum(arr){

    let sum=0;

    //방법1
   /* for(i=0;i<arr.length;i++){
        sum+=arr[i];
    }*/
    //방법2
    for(let a in arr){
        sum+=arr[a];
    }

    console.log("합계: "+sum);
}

fsum(arr3);