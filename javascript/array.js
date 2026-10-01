let arr = [2, 3, 4, 6, "trg"];
console.log(arr);

let bus = ["a", "b", "c", "d", "e"];

// console.log(arr.length);
// console.log(arr.pop());
// console.log(arr.push(3));
// console.log(arr.unshift(8));
// console.log(arr.shift());
// console.log(arr.indexOf(8));
// console.log(arr.includes(7));
// console.log(arr.join("-"));
// console.log(arr.join("-"));

let arr1 = arr.slice(0, 3);
// console.log(arr1);

let arr2 = arr.splice(0, 3);
console.log(arr2);

console.log(arr);

let color = ["blue", "yellow", "black"];

let items = ["pen", "pencil", "rubber"];

let arr3 = [1, 2, 4, [2, 1, 2, 3], 3, [3, 6, [5, 4]]];
// console.log(arr3);
  let response = arr3.flat(Infinity)
  console.log(response);
  
// console.log(color.concat(items));
// console.log(arr3.flat(Infinity));


let newArr = [...color,...items,...arr3.flat(Infinity)]
console.log(newArr);
let nameIs = new  String("abhishek")
console.log(nameIs);


// let myName = Array.isArray(nameIs)
// console.log(myName);
