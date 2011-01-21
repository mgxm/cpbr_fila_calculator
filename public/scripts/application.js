$(document).ready(function(){
  var $date = $('header section#time span.date');
  var $time = $('header section#time span.time');
  
  setInterval(function() {
    $time.html('10:30');
  }, 60*1000);
});