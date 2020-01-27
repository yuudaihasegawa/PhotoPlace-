$(document).ready(function(){

  $('#tab-contents-user .tab[id != "tab1"]').hide();
  
  $('#tab-menu-user a').on('click', function() {
    $("#tab-contents-user .tab").hide();
    $("#tab-menu-user .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    return false;
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