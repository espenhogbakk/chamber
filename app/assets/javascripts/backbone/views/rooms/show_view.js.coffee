Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.ShowView extends Backbone.View
  events: {
    "click input[name=commit]": "commit"
  }

  initialize: ->
    # Add drop event on #messages
    $("#messages").dropArea().bind("drop", @drop)

    new Chamber.Views.Messages.IndexView
      el: "#messages"
      messages: @model.messages

    new Chamber.Views.Participants.IndexView
      el: "#participants"
      participants: @model.participants

  # Commit a new message.
  #
  # event - A jQuery event that trigged the commit.
  #
  # Returns nothing.
  commit: (event) ->
    input = $("input[name=body]", @el)

    @model.messages.create {
      body: input.val(),
      room_id: @model.id
    }, { silent: true }

    input.val("")

    event.preventDefault()
  
  drop: (e) =>
    e.stopPropagation()
    e.preventDefault()
    e = e.originalEvent
    
    files = e.dataTransfer.files
    @upload file for file in files
  
  upload: (file) =>
    @model.messages.url = '/messages'
    message = @model.messages.create {
      body: "Uploading " + file.name,
      room_id: @model.id
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
    }