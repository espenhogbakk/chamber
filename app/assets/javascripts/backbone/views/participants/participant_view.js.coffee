Chamber.Views.Messages ||= {}

class Chamber.Views.Participants.ParticipantView extends Backbone.View
  template: JST["backbone/templates/participants/participant"]

  tagName: "li"

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this