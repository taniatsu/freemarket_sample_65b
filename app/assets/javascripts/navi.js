$(function(){
  // ナビの色変更,FURIMA
  $("li.navi__name").on("mouseover",function(){
    $("li.navi__name a").css({
      "color":"#3CCACE"
    });
  });
  $("li.navi__name").on("mouseout",function(){
    $("li.navi__name a").css({
      "color": "#333333"
    });
  });
  // カテゴリーLの色変更
  $("li.navi__categoryL").on("mouseover",function(){
    $("li.navi__categoryL a").css({
      "color":"#3CCACE"
    });
  });
  $("li.navi__categoryL").on("mouseout",function(){
    $("li.navi__categoryL a").css({
      "color": "#333333"
    });
    // カテゴリーMの色変更
  });
  $("li.navi__categoryM").on("mouseover",function(){
    $("li.navi__categoryM a").css({
      "color":"#3CCACE"
    });
  });
  $("li.navi__categoryM").on("mouseout",function(){
    $("li.navi__categoryM a").css({
      "color": "#333333"
    });
  });
  // カテゴリーSの色変更
  $("li.navi__categoryS").on("mouseover",function(){
    $("li.navi__categoryS a").css({
      "color":"#3CCACE"
    });
  });
  $("li.navi__categoryS").on("mouseout",function(){
    $("li.navi__categoryS a").css({
      "color": "#333333"
    });
  });
});