console.log("A");
console.log("b");

setTimeout(() =>{
 console.log("settimeout1");
 
},0)

setTimeout(() =>{
 console.log("settimeout2");
 
},0)
setTimeout(() =>{
 console.log("settimeout3");
 
},0)
let count = 0
// setInterval(() =>{
//     count += 1
//     console.log(count);
    
    
// },1000)
Promise.resolve().then(() =>{
   Promise.resolve().then(() =>{
    Promise.resolve().then(() =>{
        console.log("sdfsdf");
        
    })
   })
    
});
Promise.resolve()
console.log("c");
console.log("d");
console.log("d");
console.log("d");



