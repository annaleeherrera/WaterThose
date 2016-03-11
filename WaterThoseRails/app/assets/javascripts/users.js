$(function(){
  $("#timezone_offset").val(new Date().getTimezoneOffset());
  $(".water_button").click(function(){
    var mac_address= this.getAttribute('data-mac-address');
    $.post('/devices/water?mac_address='+mac_address).then(function() {
      alert('OK');
    });
  });
});
