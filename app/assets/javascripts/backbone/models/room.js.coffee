class Chamber.Models.Room extends Backbone.Model
  paramRoot: 'room'
  
  initialize: ->
    @messages = new Chamber.Collections.MessagesCollection
    @messages.url = '/rooms/' + this.id + '/messages'
    return this

  defaults:
    name: null

class Chamber.Collections.RoomsCollection extends Backbone.Collection
  model: Chamber.Models.Room
  url: '/rooms'