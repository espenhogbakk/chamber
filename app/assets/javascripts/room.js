$(function() {

  if (room) {

    var messages = new Chamber.Collections.MessagesCollection
    messages.url = '/rooms/' + room.id + '/messages'
    
    var participants = new Chamber.Collections.ParticipantsCollection
    participants.url = '/rooms/' + room.id + '/participants'
    
    var room_show_view = new Chamber.Views.Rooms.ShowView(
      {
        messages: messages,
        participants: participants,
        model: room,
        el: $("#room")
      }
    )

    var jug = new Juggernaut({
      host: 'chamber.herokuapp.com',
      port: 80
    })
    //var jug = new Juggernaut()
    
    jug.subscribe("/observer", function(data){
        if (data.klass == 'Message') {
          message = new Chamber.Models.Message(data.record)
          messages.add(message)
        } else if (data.klass == "Participant" && data.record.room.id == room.id) {
          participant = new Chamber.Models.Participant(data.record)
          participants.add(participant)
        }
    })
  }
})