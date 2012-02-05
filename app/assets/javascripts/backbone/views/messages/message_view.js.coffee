Chamber.Views.Messages ||= {}

class Chamber.Views.Messages.MessageView extends Backbone.View
  template: JST["backbone/templates/messages/message"]
  
  #events:
  #  "click .destroy" : "destroy"

  initialize: () ->
    @model.bind('change', @update)

  update: (message) =>
    console.log("MODEL HAS CHANGED")
    console.log(message)

  tagName: "tr"
  
  #destroy: () ->
  #  @model.destroy()
  #  this.remove()
  #
  #  return false

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
