let btnColor = document.querySelector(".btnColor")
let body = document.querySelector("body")
let hexvalue = document.querySelector(".hexvalue")
let generateHex = () =>{
    let num = "0123456789abcdef"
      let hex = "#"
      for (let i = 0; i < 6; i++) {
        hex  += num[Math.floor(Math.random() *16)]
        
      }
      return hex
}
  

let AddColor = () =>{
    hexvalue.innerText = generateHex()
    body.style.backgroundColor = generateHex()
}
btnColor.addEventListener("click" ,AddColor)
// console.log(generateHex())