Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.ShowView extends Backbone.View
  template: JST["backbone/templates/rooms/show"]
  
  Messages = new Chamber.Collections.MessagesCollection
  
  events: {
    "click input[type=submit]": "doSubmit",
  }
  
  render: =>

    # Render a list of messages
    # Then input that into this element
    
    # Change the url, to only fetch messages for this room
    Messages.url = '/rooms/' + room.id + '/messages'
    Messages.fetch()
    
    view = new Chamber.Views.Messages.IndexView(
      {
        el: $("#messages", @el)
        messages: Messages
      }
    )
    
    messages_html = view.render().el

    $(".wrapper", @el).html(messages_html)

    return this
  
  doSubmit: (e) ->
    # Get the body of the message from the input
    body = $("#body").val()
    
    # Create a new message
    Messages.create({
      body: body,
      room_id: room.id
    })
        
    e.preventDefault()
    return false
    
