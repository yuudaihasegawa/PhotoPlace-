// $('#tab-contents .tab[id != "tab1"]').hide();
 
// $('#tab-menu a').on('click', function() {
//   $("#tab-contents .tab").hide();
//   $("#tab-menu .active").removeClass("active");
//   $(this).addClass("active");
//   $($(this).attr("href")).show();
//   return false;

// });

$(document).ready(function(){

  $('#tab-contents .tab[id != "tab1"]').hide();
 
  $('#tab-menu a').on('click', function() {
  $("#tab-contents .tab").hide();
  $("#tab-menu .active").removeClass("active");
  $(this).addClass("active");
  $($(this).attr("href")).show();
  return false;

});
  
  $('.bxslider').bxSlider({
    auto: false,           // 自動スライド
    speed: 1000,          // スライドするスピード
    moveSlides: 1,        // 移動するスライド数
    pause: 5000,          // 自動スライドの待ち時間
    maxSlides: 1,         // 一度に表示させる最大数
    slideWidth: 900,      // 各スライドの幅
    autoHover: true,       // ホバー時に自動スライドを停止
    responsive: true,
    easing: true  
  });

});

$(function() {
 
  $('#back').on('click',function(){
    $('body, html').animate({
      scrollTop:0
    }, 800);
      return false;
  });
 
});


