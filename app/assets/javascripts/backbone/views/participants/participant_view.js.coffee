Chamber.Views.Messages ||= {}

class Chamber.Views.Participants.ParticipantView extends Backbone.View
  template: JST["backbone/templates/participants/participant"]
  
  #events:
  #  "click .destroy" : "destroy"

  tagName: "li"
  
  #destroy: () ->
  #  @model.destroy()
  #  this.remove()
  #
  #  return false

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this