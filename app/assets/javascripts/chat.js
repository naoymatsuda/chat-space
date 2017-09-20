$(function(){
  function buildHTML(chat){
    var image = (chat.image) ? `<img src = ${chat.image}>`: "";
    var html =
    `<div class="messages data-messages-id = "${ chat.id }" ">
       <div class="upper-message">
         <div class="upper-message__user-name">
           ${chat.name}
         </div>
         <div class="upper-message__date">
           ${chat.time}
         </div>
       </div>
       <div class="lower-message">
         <div class="lower-message__content">
           ${chat.text}
         </div>
         <img class="lower-message__image">
           ${image}
       </div>
    </div>`;
  return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    onclick = "undisabled()";
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(chat){
      var html = buildHTML(chat);
      $('.messages_group').append(html);
      $('#chat_text').val("");
    })
  })

  setInterval(function(){
    var chat_id = $('.messages').last().data('messages-id');
    $.ajax({
      url: location.href,
      type: 'GET',
      data: { num: chat_id },
      dataType: 'json'
    })
    .done(function(chat){
      chat.forEach(function(chat){
        var html = buildHTML(chat);
        $('.messages_group').append(html);
      });
    })
    .fail(function(){
      alert('自動更新に失敗しました');
    });
  },5000);
});
