Chamber.Views.Messages ||= {}

class Chamber.Views.Messages.IndexView extends Backbone.View
  template: JST["backbone/templates/messages/index"]

  initialize: () ->
    @options.messages.bind('add', @addOne)

  addOne: (message, collection) =>
    console.log("Add:", message)
    view = new Chamber.Views.Messages.MessageView({model : message})
    $("tbody", @el).append(view.render().el)
    this.scroll()

  # Scroll the message index to the bottom.
  scroll: =>
    this.el.animate({
      scrollTop: this.el[0].scrollHeight
    }, 200)

  render: =>
    $(@el).html(@template(messages: @options.messages.toJSON()))

    return this