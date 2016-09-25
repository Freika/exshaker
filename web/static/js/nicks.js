  $('#orc-male').click(function(e){
    e.preventDefault();

    var race = $(this).data("race")
    var game = $(this).data("game")

    $.ajax({
      type: "POST",
      dataType : "json",
      url: "/api/nicks?game_id=" + game + "&race_id=" + race + "&sex=male",
      success: function(data) {
        $('#nickbox').html(data.nick.name)
      }
    });
  })

// function french_female() {
//   $('#generated').fadeOut(350, function() {
//     $.ajax({
//     url: 'scripts/french_female.php',
//       success: function(html) {
//       $("#generated").html(html);

//       }
//     });
//   });
//   $('#generated').fadeIn(350);

//   };
