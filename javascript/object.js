let arr = [1, 2, 4, 5];

let mynum = "abc";

let user = {
  myname: "asd",
  id: 3,
  [mynum]: "dasd",
  email: "abh@gmail.com",
  password: "122345",
};
console.log(user);

console.log(user["password"]);

user.email = "ttt@gmail.com";

// console.log(user);
// Object.freeze(user)
user.email = "ttt567567@gmail.com";
// console.log(user);

let newObj = new Object();

newObj.name = "abhishek";

console.log(newObj);

let userOne = {
  name: "kite",
  id: 4,
  address: {
    city: "delhi",
    state: "delhi",
    color: {
      backColor: "black",
    },
  },
};
// console.log(userOne.address.color.backColor);


console.log(user);

// console.log(user.email);
// console.log(user.id);
// console.log(user.password);

const {email,id,password} = user

let mypc = {
  name:"abc",
  id:5,
  email:"xyz"
}

// let obj3 =  Object.assign({},user,mypc)

let obj3 = {...user,...mypc}
// console.log(obj3);

console.log(Object.keys(mypc));
console.log(Object.values(mypc));
console.log(mypc.hasOwnProperty("abc"));





