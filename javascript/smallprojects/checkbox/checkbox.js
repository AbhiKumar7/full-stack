let submit = document.querySelector(".submit")
let checkbox = document.querySelector("#checkbox")
let display = document.querySelector(".display")
let visa = document.querySelector("#visa")
let master = document.querySelector("#master")
let paypal = document.querySelector("#paypal")
let displaytwo = document.querySelector(".displaytwo")
let para = document.querySelector(".para")



let handleSubmit = () =>{
    if(checkbox.checked){
              display.innerText = "your login"
    }else{
              display.innerText = "plz login"

    }

    if(visa.checked){
              displaytwo.innerText = "u can use visa"
              para.innerText = visa.value
              
          
    }else if(master.checked){
              displaytwo.innerText = "u can use master"
              para.innerText = master.value

         
    }else if(paypal.checked){
              displaytwo.innerText = "u can use paypal"
              para.innerText = paypal.value


    }else{
        displaytwo.innerText = "plz select your card"
    }



}

submit.addEventListener("click",handleSubmit)