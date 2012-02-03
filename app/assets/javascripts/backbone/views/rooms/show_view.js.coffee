Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.ShowView extends Backbone.View
  template: JST["backbone/templates/rooms/show"]
  
  events: {
    "click input[type=submit]": "doSubmit",
  }
  
  initialize: ->
    @messages_index_view = new Chamber.Views.Messages.IndexView(
      {
        el: $("#messages", @el)
        messages: @collection
      }
    )
  
  doSubmit: (e) ->
    # Get the body of the message from the input
    body = $("#body").val()
    
    # Create a new message
    @collection.create({
      body: body,
      room_id: room.id
    }, {silent: true})

    e.preventDefault()
    return false
    
