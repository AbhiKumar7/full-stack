const areaofrectangle = (length, width) => {
  if (typeof length === "number" && typeof width === "number") {
    return length * width;
  } else {
    console.log("somthing went wrong");
  }
};

// let res = areaofrectangle(3,9)
// console.log(res);

let reverseString = (str) => {
  if (typeof str === "number") {
    console.log("only string allow");
  }
  let res = "";
  for (let i = str.length - 1; i >= 0; i--) {
    res = res + str[i];
  }
  return res;
};
// let res = reverseString("sdasd")
// console.log(res);

// const isOddorEven = (num) =>{

//      let remainder = num % 2

//      if(remainder === 0){
//         console.log("even");

//      }else{
//         console.log("odd");

//      }

// }

// isOddorEven(22)

// const isPalindrome = (str) =>{
//   let reversedStr =   reverseString(str)
//   if(str === reversedStr){
//     console.log("yes");

//   }else{
//     console.log("no");

//   }

// }

// isPalindrome("loop")

// const leapYear = (year) =>{
//      console.log(year % 4);

// }

// leapYear(2025)

const fact = (num) => {
  let res = 1;
  for (let i = 1; i <= num; i++) {
    res = res * i;
  }
  return res;
};

// console.log(fact(4))

let arr = [55, 56, 34, 78, 89];

let findLargestNUmber = (arr) => {
  let largest = arr[0];
  for (let i = 1; i < arr.length; i++) {
    if (arr[i] > largest) {
      largest = arr[i];
    }
  }

  return largest;
};
// let  arr = [55,56,34,36456456456,78,89,3453]
//
// console.log(findLargestNUmber(arr))
let secondLargest = (arr) => {
  let secondLargest = -Infinity;
  let largest = -Infinity;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] > largest) {
      secondLargest = largest;
      largest = arr[i];
    } else if (arr[i] > secondLargest && arr[i] !== largest) {
      secondLargest = arr[i];
    }
  }
  return secondLargest;
};

// console.log(secondLargest(arr));

let swap = (a, b) => {
  let temp = a;
  a = b;
  b = temp;
  return [a, b];
};

// console.log(swap(10,5));
// removeDupliccates
// vowels
// fibonacci

let removeDuplicates = (num) => {
  let obj = {};
  let arr = [];
  for (let i = 0; i < num.length; i++) {
    if (!obj[num[i]]) {
      obj[num[i]] = true;
      arr.push(num[i]);
    }
  }
  return arr;
};

// console.log(removeDuplicates([1,2,2,3,4,5,5,7]));

let series = (number) => {
  let arr = [1, 2];

  for (let i = 2; i < number; i++) {
    arr.push(arr[i - 1] + arr[i - 2]);
  }
  return arr;
};

// console.log(series(7));

let countvowels = (str) => {
  let count = 0;
  for (let i = 0; i < str.length; i++) {
    let ch = str[i];

    if (ch === "a" || ch === "e" || ch === "i" || ch === "o" || ch === "u") {
      count++;
    }
  }
  return count;
};

console.log(countvowels("aman"));

let arrtofind = [10, 44, 55, 99];

let indexFind = (arrtofind, tar) => {
  for (let i = 0; i < arrtofind.length; i++) {
    if (arrtofind[i] === tar) {
      return i;
    }
  }
  return -1;
};

console.log(indexFind(arrtofind, 99));

let arrzero = [3, 5, 6, 0, 5, 3, 0, 6, 0, 5, 3, 4, 0];

let endTozero = (arr) => {
  let num = [];
  let count = 0;

  for (let i = 0; i < arr.length; i++) {
    if (arr[i] === 0) {
      count++;
    } else {
      num.push(arr[i]);
    }
  }

  for (let i = 0; i < count; i++) {
    num.push(0);
  }
  return num;
};

console.log(endTozero(arrzero));
