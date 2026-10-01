console.log("hello world")

// const
// let 
// var
 
// console.log(firstName)
// const firstName = "Abhishek"


// const firstName = "Abhishek"
// console.log(firstName)


// firstName = "Aman"
// console.log(firstName)


// LET

// let firstName = "Abhishek"
// console.log(firstName)

// firstName = "aman"
// console.log(firstName);

let firstName = null;
console.log(firstName)


let LastName;
console.log(LastName)

// undefined || null



// data types

// primitive type
//  string
let nameValue = "XYZ";
console.log( typeof nameValue);
// number
let isNumber = "asdasd"
console.log( typeof isNumber);

//  boolean
let isUser = true
console.log(typeof isUser);

//  bigint
let followers = BigInt(2546546546546546546546546545445465)
console.log( typeof followers);
console.log(  followers);


//symbol
// undefined
// null

//  non primitive type(reference)

// oject
// array
// funtions


let student = {
    name:"abhishek",
    id:3456,
    adress:"erergrgrg",
    ispass:true
}

console.log(student.id)


let isValue = 45;
// console.log(typeof isValue);
// console.log( isValue);

let checkNumber = Number(isValue)
// console.log(typeof checkNumber);
// console.log( checkNumber);

let isLogin = ""
// console.log(typeof isLogin);
// console.log( isLogin);

let checkLogin = Boolean(isLogin)
// console.log(typeof checkLogin);
// console.log( checkLogin);


// console.log(2+2);
// console.log(2*7);
// console.log(2**6);
// console.log(6/2);
// console.log(5%2);

// console.log(2 === "2");
// console.log(2 == "2");
console.log(2 >= 1);


let stringOne = "First Name"
let stringTwo = "Last Name"

// let fullName = stringOne + " " + stringTwo
let fullName = `my name is ${stringOne} and last name is ${stringTwo}`

// console.log(fullName);


// stack or heap

let mySchool = "XYZ"

let otherSchool = mySchool
otherSchool = "abc"
// console.log(mySchool);
// console.log(otherSchool);


let user = {
    id:3,
    name:"lo",
    email:"abkksdsd"
}

let userTwo = user
userTwo.email = "ppppppp"


// console.log(user.email);
// console.log(userTwo.email);


// string

let str =  new String("abhishek 45 fkgobf")
// console.log(str);
// console.log(str[3]);
// console.log(str.length);
// console.log(str.toUpperCase());
// console.log(str.toLocaleLowerCase());
// console.log(str.charAt(4));
// console.log(str.substring(3));
// console.log(str.replace("45","60"));


// const str1 = "abhishek";
// console.log(str1.slice(-3));
// console.log(str1.length-1);


// console.log(str1);




function myName(){
    console.log("function working");
    
}   


let mynameArrow = () => {
    console.log("this arrow function");
    
}
mynameArrow()
myName()