$(function(){
  //価格表示
  $('.itemsNew__inputBox--price').on('input', function(){
    var price = $(this).val();
    var furima_fee = Math.floor(price * 0.1)
    var seller_gain = price - furima_fee

    if (price >= 300 && price <= 9999999) {
      $('.itemsNew__sellPrice--right').text('¥' + furima_fee.toLocaleString())
      $('.itemsNew__priceProfit--right').text('¥' + seller_gain.toLocaleString())
    } else {
      $('.itemsNew__sellPrice--right').text('ー')
      $('.itemsNew__priceProfit--right').text('ー')
    }
  });
});