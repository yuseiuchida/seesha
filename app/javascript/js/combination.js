const kind2 = document.getElementById("combination_total_flavors_2");
const kind3 = document.getElementById("combination_total_flavors_3");
const kind4 = document.getElementById("combination_total_flavors_4");
const flavor3 = document.getElementById("flavor3");
const flavor4 = document.getElementById("flavor4");
const third_flavor = document.getElementById("combination_third_flavor_id");
const fourth_flavor = document.getElementById("combination_fourth_flavor_id");

if (kind3.checked) {
  flavor4.style.display = "none";
} else if (kind2.checked) {
  flavor3.style.display = "none";
  flavor4.style.display = "none";
}

kind2.addEventListener("click", function () {
  flavor3.style.display = "none";
  flavor4.style.display = "none";
  third_flavor.setAttribute("disabled", true);
  fourth_flavor.setAttribute("disabled", true);
});
kind3.addEventListener("click", function () {
  flavor3.style.display = "";
  flavor4.style.display = "none";
  third_flavor.removeAttribute("disabled");
  fourth_flavor.setAttribute("disabled", true);
});
kind4.addEventListener("click", function () {
  flavor3.style.display = "";
  flavor4.style.display = "";
  third_flavor.removeAttribute("disabled");
  fourth_flavor.removeAttribute("disabled");
});
