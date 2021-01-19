// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require turbolinks
//= require semantic-ui
//= require_tree .

scroll_bottom = function(){
  $('#message-window').scrollTop($('#message-window')[0].scrollHeight);
}

clear_on_submit = function(){
  $('#message_body').on('keypress', function(e){
    if (e.keyCode == 13){
      $('button').click();
      e.target.value = ""
    }
  })
}

$(document).on('turbolinks:load', function(){
  $('.ui.dropdown').dropdown();

  // flash message close function
  $('.message .close').on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade');
  });

  clear_on_submit();
  scroll_bottom();
})