$(document).ready(function() {
  var d = $('#messages');
  d.animate({ scrollTop: d.prop("scrollHeight")}, 1000);
    });

// refresh every 2 seconds
setInterval(function(){
   $("#refresh").click();
},2000);
