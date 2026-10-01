let displayNumber = document.querySelector(".displayNumber");
let btnmins = document.querySelector(".btn-mins");
let btnplus = document.querySelector(".btn-plus");
let count = 0;

let handleAdd = () => {
  if (count < 10) {
    count++;
  }

  displayNumber.innerText = count;
};
let handleSub = () => {
  if (count > 0) {
    count--;
  }

  displayNumber.innerText = count;
};
btnplus.addEventListener("click", handleAdd);
btnmins.addEventListener("click", handleSub);
