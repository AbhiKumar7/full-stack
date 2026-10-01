let btnhide = document.querySelector(".btnhide");
let display = document.querySelector(".display");

let handleHide = () => {
  if (display.style.display !== "none") {
    display.style.display = "none";
    btnhide.innerText = "unHide";
  } else {
    display.style.display = "flex";
    btnhide.innerText = "Hide";
  }
};

btnhide.addEventListener("click", handleHide);
