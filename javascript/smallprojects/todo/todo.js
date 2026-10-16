let userinput = document.querySelector(".userinput");
let btnadd = document.querySelector(".btnadd");
let list = document.querySelector(".list");
let todolist = [];

let handleDelete = (id) => {
  todolist = todolist.filter((todo) => todo.id !== id)
  createElement()
};
let handleUpdate = (id) => {
   let todo =  todolist.find((todo) => todo.id === id)
     let newTodo = prompt("enter new todo")
   todo.text = newTodo
   createElement()
     
   
};

let createElement = () => {

  list.innerHTML = ""

  todolist.forEach((todo) =>{

 
  let li = document.createElement("li");
  let deletebtn = document.createElement("button");
  let updatebtn = document.createElement("button");
  deletebtn.innerText = "delete";
  updatebtn.innerText = "update";
 
  li.innerText = todo.text;
  

  deletebtn.addEventListener("click", () => {
    handleDelete(todo.id);
  });
  console.log(todolist);

  updatebtn.addEventListener("click", () => {
    handleUpdate(todo.id);
  });
  list.appendChild(li);
  list.appendChild(deletebtn);
  list.appendChild(updatebtn);
  })
};

let handleSubmit = () => {
  if (userinput.value === "") {
    alert("plz enter something");
  } else {
     let todo = {
    text: userinput.value,
    id: Math.random(),
  };
  todolist.push(todo);
    createElement();
  }

  userinput.value = "";
};

btnadd.addEventListener("click", handleSubmit);
