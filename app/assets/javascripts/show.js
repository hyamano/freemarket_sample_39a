$(function(){

  $('.item__content__image__list__inner img').mouseover(function(){
  var $thisImg = $(this).attr('src');
  var $thisAlt = $(this).attr('alt');
  $('.item__content__image__top img').attr({src:$thisImg,alt:$thisAlt});
  });

}, false);

