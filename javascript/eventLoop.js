console.log("A");
console.log("b");

setTimeout(() =>{
 console.log("settimeout");
 
},5000)
Promise.resolve().then(() =>{
   Promise.resolve().then(() =>{
    Promise.resolve().then(() =>{
        console.log("sdfsdf");
        
    })
   })
    
});
// Promise.resolve()
console.log("c");
console.log("d");
console.log("d");
console.log("d");



