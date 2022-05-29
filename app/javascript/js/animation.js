const main = document.querySelector(".page-body");
main.classList.add("hidden");
window.onload = function () {
  setTimeout(function () {
    const clouds = document.querySelector(".clouds");
    clouds.classList.add("smoked");
    main.classList.remove("hidden");
  }, 2300);
};
