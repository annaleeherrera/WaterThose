$(function(){
  $("#water_button").click(function(){
    $.post('/devices/water?mac_address=12345').then(function() {
      alert('OK');
    });
  });
});
