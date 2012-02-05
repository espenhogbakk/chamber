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
        messages: @options.messages
      }
    )
    
    @participants_index_view = new Chamber.Views.Participants.IndexView(
      {
        el: $("#participants", @el)
        participants: @options.participants
      }
    )
  
  doSubmit: (e) ->
    # Get the body of the message from the input
    input = $("#body")
    body = input.val()

    # Create a new message
    @options.messages.create({
      body: body,
      room_id: room.id,
    }, {
      silent: true, 
      error: ->
        # Clear the input field
        input.val(body)
      }
    )

    # Clear the input field at once
    input.val("")

    e.preventDefault()
    return false
