Chamber.Views.Participants ||= {}

class Chamber.Views.Participants.IndexView extends Backbone.View
  initialize: () ->
    @options.participants.bind('add', @addParticipant)

  # Add a single message to this view.
  #
  # participant - A Chamber.Models.Participant instance describing the participant.
  #
  # Returns nothing.
  addParticipant: (participant) =>
    view = new Chamber.Views.Participants.ParticipantView
      model: participant

    view.render()

    $(@el).append view.el
