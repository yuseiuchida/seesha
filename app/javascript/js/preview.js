  let form = document.getElementById("image-form");
  form.addEventListener("change", function () {
    let fileReader = new FileReader();
    fileReader.onload = (function () {
      document.getElementById('preview').src = fileReader.result;
    });
    fileReader.readAsDataURL(form.files[0]);
  })