function appendNumber(new_number) {
  var count_up = $(".new_number");
  var number_output = `<i class="item_number">
                          ${new_number}
                          </i>`
  $(".number_box").append(number_output);
}


$(function() {
  $("button").on("click", function() {
    $(".item_number").remove();
    var new_number = gon.number++ ;
    appendNumber(new_number)
  });
});