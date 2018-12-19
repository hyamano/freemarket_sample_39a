$(function() {
  var $children = $('#item_shipping_method_attributes_shipping_methods');
  var original = $children.html();

  $('#item_shipping_method_attributes_burden_fee').change(function() {
    var val1 = $(this).val();

    $children.html(original).find('option').each(function() {
      var val2 = $(this).data('val');
      if (val1 != val2) {
        $(this).not(':first-child').remove();
      }
    });

    if ($(this).val() === val1||val2) {
      var childSelect = $('.single-main__content__form__item__detail--second')
      childSelect.show();
    }
    else{
      childSelect.hide();
    }
  });
});

// $(function() {
//   var $cateChildren = $('#item_mcategory_id');
//   var original = $cateChildren.html();

//   $('#item_lcategory_id').change(function() {
//     var val1 = $(this).val();

//     $cateChildren.html(original).find('option').each(function() {
//       var val2 = $(this).data('val');
//       if (val1 != val2) {
//         $(this).not(':first-child').remove();
//       }
//     });
//     var $cateGrandChirdren = $('#item_scategory_id');
//     var original2 = $cateGrandChildren.html();

//     $cateChildren.change(function() {
//       var val3 = $(this).val();

//     $cateGrandChildren.html(original2).find('option').each(function() {
//       var val4 = $(this).data('val');
//       if (val3 != val4) {
//         $(this).not(':first-child').remove();
//       }
//     });
//   });
// });

