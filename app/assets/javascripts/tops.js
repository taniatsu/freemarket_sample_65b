$(function() {
  // カテゴリ色変更
  $("#categoryBtn").on("mouseover", function() {
    $(this).css({
      "color": "#FF9900"
    });
  });
  $("#categoryBtn").on("mouseout", function() {
    $(this).css({
      "color": "#333333"
    });
  });
  // カテゴリ大プルダウン色変更
  $(".dropDown-list").on("mouseover", function() {
    $(this).css({
      "background-color": "#3CCACE",
    });
  });
  $(".dropDown-list").on("mouseout", function() {
    $(this).css({
      "background-color": "white",
    });
  });
  // カテゴリ中・小プルダウン色変更
  $("li.dropDown-list-cal").on("mouseover", function() {
    $(this).css({
      "background-color": "#3CCACE",
    });
  });
  $("li.dropDown-list-cal").on("mouseout", function() {
    $(this).css({
      "background-color": "white",
    });
  });
  // プルダウンメニュー
  $(".headInner__Foot__left li").hover(function(){
    $(">ul:not(:animated)", this).slideDown();
    }, function(){
    $(">ul",this).slideUp();
  });
  
});