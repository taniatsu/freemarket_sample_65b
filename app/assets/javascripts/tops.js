$(function() {
  console.log("OK");
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
      "color": "#FF9900"
    });
  });
  $(".dropDown-list").on("mouseout", function() {
    $(this).css({
      "color": "#333333"
    });
  });
  // カテゴリ中・小プルダウン色変更
  $("li.dropDown-list-cal").on("mouseover", function() {
    $(this).css({
      "color": "#FF9900"
    });
  });
  $("li.dropDown-list-cal").on("mouseout", function() {
    $(this).css({
      "color": "#333333"
    });
  });
  // プルダウンメニュー
  $(".headInner__Foot__left li").hover(function(){
    console.log("Hi");
    $(">ul:not(:animated)", this).slideDown();
    }, function(){
    $(">ul",this).slideUp();
  });
  
});