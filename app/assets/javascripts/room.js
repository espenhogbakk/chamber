$(function() {
  
  var room_show_view = new Chamber.Views.Rooms.ShowView(
    {
      model: room,
      el: $("#room")
    }
  )
  room_show_view.render()

  var jug = new Juggernaut
  jug.subscribe("/observer", function(data){
    room_show_view.render()
  })


})