$(function(){
  $('.input-price').keyup(function(){
    var price = $('.input-price').val();
    if (price >= 300 && price <= 9999999){
      var commission = Math.floor(price * 0.1);
      var profit = price - commission;
      $('.sell-price__box--center--right').text('¥' + commission);
      $('.sell-price__box--bold--right').text('¥' + profit);
      }
    else{
      $('.sell-price__box--center--right').text('-');
      $('.sell-price__box--bold--right').text('-');
    }
    }
  );
});
