
let stop = document.querySelector(".btnstop")
let keyboard = document.querySelector(".keyboard")
   let start =  document.querySelector(".btnstart")
   let body =  document.querySelector("body")
   let h =  document.querySelector("h2")
//     document.querySelector("h1").innerText = "UGC"
    
// },4000);
// let handleStop = () =>{

//     clearTimeout(changeText)
//     console.log('====================================');
//     console.log("stop");
//     console.log('====================================');
// }
// document.querySelector(".btnstop").addEventListener("click",handleStop)

let  interval;
let generateHex = () =>{
    let num = "0123456789abcdef"
      let hex = "#"
      for (let i = 0; i < 6; i++) {
        hex  += num[Math.floor(Math.random() *16)]
        
      }
      return hex
}

let handleStart = () =>{
    let changeColor = () =>{
        
        body.style.backgroundColor = generateHex()
    }
    if(!interval){

        interval =  setInterval(changeColor,500)
    }
}

let handleStop = () =>{
      clearInterval(interval)
      interval = null
}

start.addEventListener("click",handleStart)
stop.addEventListener("click",handleStop)


let handleCreate = () =>{

  console.log("mouse over");
  h.style.color = "red"
 
    }

    let handleOut = () =>{

  console.log("mouse out");
  h.style.color = "black"
 
    }
// keyboard.addEventListener("keydown",handleCreate)
 


h.addEventListener("mouseover",handleCreate)
h.addEventListener("mouseout",handleOut)