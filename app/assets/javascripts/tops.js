$(function() {
  $("#catgotyBtn").on("mouseover", function() {
    $("#catgotyBtn").css({
      "color": "#FF9900"
    });
  });
  $("#catgotyBtn").on("mouseout", function() {
    $("#catgotyBtn").css({
      "color": "#333333"
    });
  });
});

// プルダウンメニュー実装途中
$(function(){
  $('#catgotyBtn').hover(function(){
      $("ul:not(:animated)", this).slideDown();
  }, function(){
      $("ul.dropdwn_menu",this).slideUp();
  });
});