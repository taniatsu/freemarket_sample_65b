$(function() {
  // turbolinksを無効
  $(document).on('turbolinks:load', function() {
    //手数料。利益表示
  $('.itemsEdit__inputBox--sellPrice').on('input', function(){
    var price = $(this).val();
    var furima_fee = Math.floor(price * 0.1)
    var seller_gain = price - furima_fee
    if (price >= 300 && price <= 9999999) {
      $('.itemsEdit__sellPrice--right').text('¥' + furima_fee.toLocaleString())
      $('.itemsEdit__priceProfit--right').text('¥' + seller_gain.toLocaleString())
    } else {
      $('.itemsEdit__sellPrice--right').text('ー')
      $('.itemsEdit__priceProfit--right').text('ー')
    }
  });
    // 親カテゴリー選択後のイベント
    $("#select-parent-category").on("change",function(){
      // 親カテゴリーのvalue値を取得
      var parentCategory = $(this).val() ;
     
    })
  });
});
