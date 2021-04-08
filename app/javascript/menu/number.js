function appendNumber(new_number) {
  var count_up = $(".new_number");
  var number_output = `<i class="number">
                          ${new_number}
                          </i>`
  $(".h1").append(number_output);
}


$(function() {
  $("button").on("click", function() {
    $(".number").remove();
    var new_number = gon.number++ ;
    appendNumber(new_number)
  });
});