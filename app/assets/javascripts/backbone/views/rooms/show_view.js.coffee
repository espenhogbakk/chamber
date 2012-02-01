Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.ShowView extends Backbone.View
  template: JST["backbone/templates/rooms/show"]
  
  Messages = new Chamber.Collections.MessagesCollection
  
  events: {
    "click input[type=submit]": "doSubmit",
  }
  
  render: =>
    console.log("... render Rooms.ShowView ...")
    
    # Render a list of messages
    # Then input that into this render
    Messages.url = '/rooms/' + room.id + '/messages'
    Messages.fetch()
    
    view = new Chamber.Views.Messages.IndexView(
      {
        messages: Messages
      }
    )
    html = view.render()
    $("#foo", @el).html(html.el)
    return this
  
  doSubmit: (e) ->
    # Get the body of the message from the input
    body = $("#body").val()
    
    # Create a new message
    Messages.create({
      body: body,
      room_id: room.id
    })
    
    @render()
        
    e.preventDefault()
    return false
    
