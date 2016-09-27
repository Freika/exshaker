$('.shaker').click(function(e){
  e.preventDefault();

  var race = $(this).data('race')
  var game = $(this).data('game')
  var sex  = $(this).data('sex')

  $.ajax({
    type: 'POST',
    dataType : 'json',
    url: '/api/nicks?game_id=' + game + '&race_id=' + race + '&sex=' +sex,
    success: function(data) {
      $('#nickbox').html(data.nick.name)
    }
  });
})
