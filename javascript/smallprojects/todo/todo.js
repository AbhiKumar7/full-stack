let userinput = document.querySelector(".userinput");
let btnadd = document.querySelector(".btnadd");
let list = document.querySelector(".list");
let todolist = [];

let handleDelete = (id) => {
  console.log(id);
  let filter = todolist.find((todo) => todo.id === id);
  console.log(filter);
};
let handleUpdate = (id) => {
  console.log(id);
  let filter = todolist.find((todo) => todo.id === id);
  console.log(filter);
};

let createElement = () => {
  let li = document.createElement("li");
  let deletebtn = document.createElement("button");
  let updatebtn = document.createElement("button");
  deletebtn.innerText = "delete";
  updatebtn.innerText = "update";
  let todo = {
    text: userinput.value,
    id: Math.random(),
  };
  todolist.push(todo);
  li.innerText = todo.text;
  list.appendChild(li);
  list.appendChild(deletebtn);
  list.appendChild(updatebtn);

  deletebtn.addEventListener("click", () => {
    handleDelete(todo.id);
  });
  console.log(todolist);

  updatebtn.addEventListener("click", () => {
    handleUpdate(todo.id);
  });
};

let handleSubmit = () => {
  if (userinput.value === "") {
    alert("plz enter something");
  } else {
    createElement();
  }

  userinput.value = "";
};

btnadd.addEventListener("click", handleSubmit);
