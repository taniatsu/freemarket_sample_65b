
  $(document).on('turbolinks:load', ()=> {
    // 画像用のinputを生成する関数
    const buildFileField = (index)=> {
      const html = `<div data-index="${index}" class="js-file_group">
                      <input class="js-file img-add" type="file"
                      name="item[images_attributes][${index}][url]"
                      id="item_images_attributes_${index}_url">
                    </div>`;
      return html;
    }
  
    // file_fieldのnameに動的なindexをつける為の配列
    let fileIndex = [1,2,3,4,5];
    lastIndex = $('.js-file_group:last').data('index');
    fileIndex.splice(0, lastIndex);
  
    $('.hidden-destroy').hide();
  
    // プレビュー用のimgタグを生成する関数
    const buildImg = (index, url)=> {
      const html = `<div class="img-container">
                      
                        <img data-index="${index}" src="${url}" width="100px" height="100px" class="img-count">
                        <br>
                        <span class="js-remove">削除</span>
                      
                    </div>`;
      return html;
    }
  
  
  
    $('#image-box').on('change', '.js-file', function(e) {
      const targetIndex = $(this).parent().data('index');
      // ファイルのブラウザ上でのURLを取得する
      const file = e.target.files[0];
      const blobUrl = window.URL.createObjectURL(file);
      
      // 該当indexを持つimgタグがあれば取得して変数imgに入れる(画像変更の処理)
      if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
        img.setAttribute('src', blobUrl);
      } else {  // 新規画像追加の処理
        $('#previews').append(buildImg(targetIndex, blobUrl));
        
        const imgCount= $('.img-count');
        if(imgCount.length < 5){
          $('#image-box').append(buildFileField(fileIndex[0]));
          fileIndex.shift();
          fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
        }else{
          $('.js-file_group').css('display', 'none');
        }
        
      }
    });
  
  
    $('#image-box').on('click', '.js-remove', function() {
      const targetIndex = $(this).parent().data('index')
      // 該当indexを振られているチェックボックスを取得する
      const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
      // もしチェックボックスが存在すればチェックを入れる
      if (hiddenCheck) hiddenCheck.prop('checked', true);
      $(this).parent().remove();
      $(`img[data-index="${targetIndex}"]`).remove();
      // 画像入力欄が0個にならないようにしておく
      if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
      
    });
  });  
