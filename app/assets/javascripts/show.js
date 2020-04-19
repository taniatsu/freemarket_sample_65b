$(function() {
  //削除確認モーダル
  $("#modal-open-btn").on('click',function(){
    $('#overlay').fadeIn();
    return false;
  });
  // キャンセルボタンを押すとモーダルが閉じる
  $('#modal-close-btn').on('click',function(){
    $('#overlay').fadeOut();
    return false;
  });
});