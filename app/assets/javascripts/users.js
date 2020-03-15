// $(function(){
//   var tab_a = $('.dealing');
//   var tab_b = $('.delt');
//   var tab_content_a = $('.dealing__contents-item_status');
//   var tab_content_b = $('.delt__contents-item_status');
  
//   tab_b.on('click', function(){
//     if(!tab_b.hasClass('active')){
//       tab_b.addClass('active');
//       tab_content_b.addClass('contentOn');
//       tab_a.removeClass('active');
//       tab_content_a.removeClass('contentOn');
//     }
//   });
//   tab_a.on('click', function(){
//     if(!tab_a.hasClass('active')){
//       tab_a.addClass('active');
//       tab_content_a.addClass('contentOn');
//       tab_b.removeClass('active');
//       tab_content_b.removeClass('contentOn');
//     }
//   });
// });
document.addEventListener('DOMContentLoaded', function(){
  //タブ
  // var tabArrize = function(){
  //   var tabs = document.querySelectorAll('.tabs');
  //   var tabsArr = Array.prototype.slice.call(tabs);
  //   console.log(tabsArr);
  //   return tabsArr;
  // };
  // tabArrize();
  var tabs = document.querySelectorAll('.tabs');
  var tabsArr = Array.prototype.slice.call(tabs);
  var dealingContents = document.querySelector('.dealing__contents-item_status');
  var deltContents = document.querySelector('.delt__contents-item_status');
  
  tabsArr[0].addEventListener('click', tabChange_a);
  tabsArr[1].addEventListener('click', tabChange_b);
  function tabChange_a(){
    if(!tabsArr[0].classList.contains('active')){
      tabsArr[0].classList.add('active');
      tabsArr[1].classList.remove('active');
      dealingContents.classList.add('contentOn');
      deltContents.classList.remove('contentOn');
    }
  };
  function tabChange_b(){
    if(!tabsArr[1].classList.contains('active')){
      tabsArr[1].classList.add('active');
      tabsArr[0].classList.remove('active');
      deltContents.classList.add('contentOn');
      dealingContents.classList.remove('contentOn');
    }
  };

},false);