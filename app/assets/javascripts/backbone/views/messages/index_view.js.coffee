Chamber.Views.Messages ||= {}

class Chamber.Views.Messages.IndexView extends Backbone.View
  template: JST["backbone/templates/messages/index"]

  initialize: () ->
    @options.messages.bind('reset', @addAll)

  addAll: () =>
    @options.messages.each(@addOne)

  addOne: (message) =>
    view = new Chamber.Views.Messages.MessageView({model : message})
    $("tbody", @el).append(view.render().el)

  render: =>
    $(@el).html(@template(messages: @options.messages.toJSON()))
    return this
