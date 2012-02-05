class Chamber.Models.Participant extends Backbone.Model
  paramRoot: 'participant'

class Chamber.Collections.ParticipantsCollection extends Backbone.Collection
  model: Chamber.Models.Participant
  url: '/participants'
