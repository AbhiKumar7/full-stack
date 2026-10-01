// console.log(window);
// let h = document.getElementById("h")

// let  myName = document.getElementsByClassName("span")
// console.log(myName);


// let value = document.querySelectorAll("#h")
// console.log(value);

let htag = document.querySelector(".para")
console.log(htag.innerText);
htag.style.color = "red"
htag.style.padding = "10px"
htag.style.backgroundColor = "black"
// console.log(htag.textContent);



// let li = document.querySelectorAll(".number")
// console.log(li);

// li.forEach((list) =>{
//    list.style.color = "pink"
// })


let h1  = document.createElement("h1")
h1.innerText = "Water"
console.log(h1);

document.body.appendChild(h1)


let addFruits = (fruit) =>{
    let li = document.createElement("li")
    li.innerText = `${fruit}`
    let ul = document.querySelector(".list")
    ul.appendChild(li)
}


addFruits("apple")
addFruits("banana")
addFruits("dargon fruit")

let secondFruit = document.querySelector("li:nth-child(4)")
secondFruit.remove()

// let lastFruit = document.querySelector("li:last-child")
// lastFruit.remove()
