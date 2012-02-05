Chamber.Views.Messages ||= {}

class Chamber.Views.Messages.IndexView extends Backbone.View
  initialize: =>
    @options.messages.bind("add", @addMessage)
    @scroll()

  # Add a single message to this view.
  #
  # message - A Chamber.Models.Message instance describing the message.
  #
  # Returns nothing.
  addMessage: (message) =>
    view = new Chamber.Views.Messages.MessageView
      model: message

    view.render()

    $("tbody", @el).append view.el

    @scroll()

  # Scroll the message index to the bottom.
  scroll: =>
    $(@el).animate {
      scrollTop: @el.scrollHeight
    }, 200