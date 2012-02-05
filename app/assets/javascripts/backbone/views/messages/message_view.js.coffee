Chamber.Views.Messages ||= {}

class Chamber.Views.Messages.MessageView extends Backbone.View
  template: JST["backbone/templates/messages/message"]

  tagName: "tr"

  render: ->
    $(@el).html @template(@model.toJSON())

    return this
