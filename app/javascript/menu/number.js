function appendNumber(new_number) {
  var count_up = $(".new_number");
  var number_output = `<i class=".nmb">
                          ${new_number}
                          </i>`
  count_up.append(number_output);
}


$(function() {
  $("button").on("click", function() {
    $(".h1").remove();
    var new_number = gon.number++ ;
    appendNumber(new_number)
  });
});