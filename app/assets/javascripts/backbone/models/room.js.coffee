class Chamber.Models.Room extends Backbone.Model
  paramRoot: "room"

  initialize: ->
    @messages = new Chamber.Collections.MessagesCollection
    @messages.url = "/rooms/" + @id + "/messages"

    @participants = new Chamber.Collections.ParticipantsCollection
    @participants.url = "/rooms/" + @id + "/participants"

class Chamber.Collections.RoomsCollection extends Backbone.Collection
  model: Chamber.Models.Room
  url: "/rooms"
