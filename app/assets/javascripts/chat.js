$(function(){
  function buildHTML(chat){
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
         <div class="lower-message__image">
           ${chat.image}
          </div>
       </div>
    </div>`;
  return html;
  }

$(function () {
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    console.log(url);
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(chat){
      console.log(chat);
      var html = buildHTML(chat);
      $('.messages_group').append(html);
      $('#chat_text').val("");
    })
  })
});
});
