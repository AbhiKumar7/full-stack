var c = 5;

function Scope() {
  // let a = "a";
  //   var b = "b";
  var c = "r";
  //   console.log("innerfuntion",a);
  //   console.log("innerfuntion", c);
}

Scope();

// console.log(a);
// console.log(b);
// console.log(c);

// let a = 1;

// if (s) {
//   var x = 2;
//      let a = 4
//   console.log("====================================");
//   console.log(a);
//   console.log("====================================");
// }

// console.log(a);

function Outer() {
  let Value = 5;
  function Inner() {
    let pcName = "alpha";
    console.log(Value);
  }
  //   console.log(pcName);

  Inner();
}

// Outer();

let user = {
  name: "abhishek",
  id: 4,
  welcome: function () {
   //  console.log(this);

    console.log(`welcome ${this.name} to my pc`);
  },
};
 console.log("this",this);
 
console.log(user.welcome());


function newWorld(){
   // console.log(this);
   
}

console.log(newWorld());

let newArrow = () => {
// console.log(this);

}

// console.log(newArrow());




