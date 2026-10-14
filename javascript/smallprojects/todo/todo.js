let userinput = document.querySelector(".userinput")
let btnadd = document.querySelector(".btnadd")
let list = document.querySelector(".list")


let handleSubmit = () =>{
    if(userinput.value === ""){
        alert("plz enter something")
    }else{
let li = document.createElement("li")
  let deletebtn = document.createElement("button")
  deletebtn.innerText = "delete"
  deletebtn.className = "deletebtn"
    li.innerText = userinput.value
    list.appendChild(li)
    list.appendChild(deletebtn)
    }

    userinput.value = ""

    
}


btnadd.addEventListener("click",handleSubmit)