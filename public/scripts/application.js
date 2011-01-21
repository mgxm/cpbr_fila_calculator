$(document).ready(function(){
  var $date   = $('header section#time span.date');
  var $time   = $('header section#time span.time');
  var $status = $('#content section#status ul.queue');
  var result  = null;
  
  update();
  
  setInterval(function() {
    update();
  }, 1000);
  
  function update() {
    $.getJSON('/calculator.json', function(data) {
      $date.text(data.date);
      $time.text(data.time);
      
      $status.html('');
      $.each(data.status, function(key, value) {
        $status.append('<li><a href="#"><span class="value">'+ key +'</span><span class="size _'+ value +'"></span></a></li>');
      });
      
    });
  }
});