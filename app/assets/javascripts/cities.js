  var country = document.getElementById("country");
  var state = document.getElementById("state");
  // var city = document.getElementById("city");
  console.log(1)

  country.addEventListener("change", function(){
    $.ajax({
      url: "/sign_up?country=" + country.value,
      type: "GET"
    })
  })

  state.addEventListener("change", function(){
    $.ajax({
      url: "/towns?country=" + country.value + "&state=" + state.value,
      type: "GET"
    })
  })
