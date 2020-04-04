$(function(){
  var tab_dealing = $('.dealing');
  var tab_delt = $('.delt');
  var tab_content_dealing = $('.dealing__contents-item_status');
  var tab_content_delt = $('.delt__contents-item_status');
  
  tab_delt.on('click', function(){
    if(!tab_delt.hasClass('active')){
      tab_delt.addClass('active');
      tab_content_delt.addClass('contentOn');
      tab_dealing.removeClass('active');
      tab_content_dealing.removeClass('contentOn');
    }
  });
  tab_dealing.on('click', function(){
    if(!tab_dealing.hasClass('active')){
      tab_dealing.addClass('active');
      tab_content_dealing.addClass('contentOn');
      tab_delt.removeClass('active');
      tab_content_delt.removeClass('contentOn');
    }
  });
});
