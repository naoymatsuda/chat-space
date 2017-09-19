$(function(){
  function buildHTML(chat){
    var image = (chat.image) ? `<img src = ${chat.image}>`: "";
    var html =
    `<div class="messages">
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

$(function () {
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
});
});
