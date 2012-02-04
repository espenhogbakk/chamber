Chamber.Views.Participants ||= {}

class Chamber.Views.Participants.IndexView extends Backbone.View
  template: JST["backbone/templates/participants/index"]

  initialize: () ->
    #@options.participants.bind('reset', @addAll)
    @options.participants.bind('add', @addOne)
  
  #addAll: () =>
  #  @options.participants.each(@addOne)

  addOne: (participant) =>
    view = new Chamber.Views.Participants.ParticipantView({model : participant})
    $(@el).append(view.render().el)

  render: =>
    $(@el).html(@template(participants: @options.participants.toJSON()))
    return this