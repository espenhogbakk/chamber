Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.ShowView extends Backbone.View
  events: {
    "click input[name=commit]": "commit"
  }

  initialize: ->

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
