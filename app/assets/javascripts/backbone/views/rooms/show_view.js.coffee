Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.ShowView extends Backbone.View
  template: JST["backbone/templates/rooms/show"]
  
  events: {
    "click input[type=submit]": "doSubmit",
  }
  
  initialize: ->
    # Add drop event on #messages
    $("#messages").dropArea().bind("drop", @drop)

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
  
  
  drop: (e) =>
    e.stopPropagation()
    e.preventDefault()
    e = e.originalEvent
    
    files = e.dataTransfer.files
    @upload file for file in files
  
  upload: (file) =>
    @options.messages.url = '/messages'
    message = @options.messages.create({
      body: "Uploading " + file.name,
      room_id: room.id
    }, {
      silent: true, 
      success: (model, response) ->
        $.upload("/attachments", {message_id: model.id,attachment: file}, {
          dataType: "json",
          upload: {
            progress: (e) ->
              console.log("Upload progress event:", e)
          }
        }).success((data) ->
          # TODO Rerender the message after updating
          # Hack to not cause havoc in the MessagesController#update
          #model.unset("room")
          #model.unset("user")
          #model.set({attachment: data, body: file.name + ": " + data.attachment_url})
          #model.save()
        )
    })
    