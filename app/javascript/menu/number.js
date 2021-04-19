function appendNumber(new_number, menu_id) {
  var number_output = `<i class="item_number">
                          ${new_number}
                          </i>`
  $(`#${menu_id} .number_box`).append(number_output);
}


$(function() {
  $(`.plus_btn`).on("click", function() {
    var menu_id = $(this).attr('id')
    $(`#${menu_id} .item_number`).remove();
    var new_number = ++gon.number;
    appendNumber(new_number, menu_id)
  });
});

$(function() {
  $(`.minus_btn`).on("click", function() {
    var menu_id = $(this).attr('id')
    $(`#${menu_id} .item_number`).remove();
    var new_number = --gon.number;
    appendNumber(new_number, menu_id)
  });
});

