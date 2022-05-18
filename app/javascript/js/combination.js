const flavor3 = document.getElementById("flavor3");
const flavor4 = document.getElementById("flavor4");
flavor3.style.display = "none";
document
  .getElementById("combination_third_flavor_id")
  .setAttribute("disabled", true);
flavor4.style.display = "none";
document
  .getElementById("combination_fourth_flavor_id")
  .setAttribute("disabled", true);

function buttonFlavor2() {
  flavor3.style.display = "none";
  document
    .getElementById("combination_third_flavor_id")
    .setAttribute("disabled", true);
  flavor4.style.display = "none";
  document
    .getElementById("combination_fourth_flavor_id")
    .setAttribute("disabled", true);
}
function buttonFlavor3() {
  flavor3.style.display = "";
  document
    .getElementById("combination_third_flavor_id")
    .removeAttribute("disabled");
  flavor4.style.display = "none";
  document
    .getElementById("combination_fourth_flavor_id")
    .setAttribute("disabled", true);
}
function buttonFlavor4() {
  flavor3.style.display = "";
  document
    .getElementById("combination_third_flavor_id")
    .removeAttribute("disabled");
  flavor4.style.display = "";
  document
    .getElementById("combination_fourth_flavor_id")
    .removeAttribute("disabled");
}

document.getElementById("combination_total_flavors_2").onclick = buttonFlavor2;
document.getElementById("combination_total_flavors_3").onclick = buttonFlavor3;
document.getElementById("combination_total_flavors_4").onclick = buttonFlavor4;
