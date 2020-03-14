$(function() {
  console.log("OK");
  $(".headInner__Foot__left li").hover(function(){
    console.log("Hi");
    $(">ul:not(:animated)", this).slideDown();
    }, function(){
    $(">ul",this).slideUp();
  });
});