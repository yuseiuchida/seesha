const kind2 = document.getElementById("combination_total_flavors_2");
const kind3 = document.getElementById("combination_total_flavors_3");
const kind4 = document.getElementById("combination_total_flavors_4");
const flavor3 = document.getElementById("third_flavor_form");
const flavor4 = document.getElementById("fourth_flavor_form");
const categoryButton1 = document.getElementById("combination_first_flavor_category");
const categoryButton2 = document.getElementById("combination_second_flavor_category");
const categoryButton3 = document.getElementById("combination_third_flavor_category");
const categoryButton4 = document.getElementById("combination_fourth_flavor_category");
const category_length = categoryButton1.children.length;

setFlavors();
kind2.click();

kind2.addEventListener("click", function () {
  setFlavors();
});
kind3.addEventListener("click", function () {
  addFlavor3();
  removeFlavor4();
});
kind4.addEventListener("click", function () {
  addFlavor3();
  addFlavor4();
});


function setFlavors() {
  for (let i = category_length; i > 0; i--) {
    let b = document.getElementById("combination_first_flavor_" + i)
    let c = document.getElementById("combination_second_flavor_" + i)
    b.setAttribute("disabled", true);
    b.style.display = "none";
    c.setAttribute("disabled", true);
    c.style.display = "none";
  }
  let value1 = categoryButton1.value
  let value2 = categoryButton2.value
  let d = document.getElementById("combination_first_flavor_" + value1);
  let e = document.getElementById("combination_second_flavor_" + value2);
  d.removeAttribute("disabled");
  d.style.display = "";
  e.removeAttribute("disabled");
  e.style.display = "";
  removeFlavor3();
  removeFlavor4();
}

function removeFlavor3() {
  flavor3.style.display = "none"
  for (let i = 1; i <= category_length; i++) {
    let b = document.getElementById("combination_third_flavor_" + i)
    b.setAttribute("disabled", true);
    b.style.display = "none";
  }
}

function removeFlavor4() {
  flavor4.style.display = "none"
  for (let i = 1; i <= category_length; i++) {
    let b = document.getElementById("combination_fourth_flavor_" + i)
    b.setAttribute("disabled", true);
    b.style.display = "none";
  }
}

function addFlavor3() {
  flavor3.style.display = ""
  for (let i = category_length; i > 0; i--) {
    let b = document.getElementById("combination_third_flavor_" + i)
    b.setAttribute("disabled", true);
    b.style.display = "none";
  }
  let value = categoryButton3.value
  let c = document.getElementById("combination_third_flavor_" + value);
  c.removeAttribute("disabled");
  c.style.display = "";
}

function addFlavor4() {
  flavor4.style.display = ""
  for (let i = category_length; i > 0; i--) {
    let b = document.getElementById("combination_fourth_flavor_" + i)
    b.setAttribute("disabled", true);
    b.style.display = "none";
  }
  let value = categoryButton4.value
  let c = document.getElementById("combination_fourth_flavor_" + value);
  c.removeAttribute("disabled");
  c.style.display = "";
}


categoryButton1.addEventListener("change", function () {
  for (let i = 1; i <= category_length; i++) {
    let b = document.getElementById("combination_first_flavor_" + i);
    b.style.display = "none"
    b.setAttribute("disabled", true);
  }
  let value = categoryButton1.value
  let c = document.getElementById("combination_first_flavor_" + value);
  c.removeAttribute("disabled");
  c.style.display = "";
})

categoryButton2.addEventListener("change", function () {
  for (let i = 1; i <= category_length; i++) {
    let b = document.getElementById("combination_second_flavor_" + i);
    b.style.display = "none"
    b.setAttribute("disabled", true);
  }
  let value = categoryButton2.value
  let c = document.getElementById("combination_second_flavor_" + value);
  c.removeAttribute("disabled");
  c.style.display = "";
})

categoryButton3.addEventListener("change", function () {
  for (let i = 1; i <= category_length; i++) {
    let b = document.getElementById("combination_third_flavor_" + i);
    b.style.display = "none"
    b.setAttribute("disabled", true);
  }
  let value = categoryButton3.value
  let c = document.getElementById("combination_third_flavor_" + value);
  c.removeAttribute("disabled");
  c.style.display = "";
})

categoryButton4.addEventListener("change", function () {
  for (let i = 1; i <= category_length; i++) {
    let b = document.getElementById("combination_fourth_flavor_" + i);
    b.style.display = "none"
    b.setAttribute("disabled", true);
  }
  let value = categoryButton4.value
  let c = document.getElementById("combination_fourth_flavor_" + value);
  c.removeAttribute("disabled");
  c.style.display = "";
})