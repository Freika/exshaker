$('#orc-male').click(function(e){
  e.preventDefault();

  race = this.data("race")
  game = this.data("game")

  $.ajax({
    type: "POST",
    dataType : "json",
    url: "/api/nicks/game_id=" + game + "&race_id=" + race + "sex=male",
    async: true,
    success: function(data) {
      console.log(data)
    }
  });
});
