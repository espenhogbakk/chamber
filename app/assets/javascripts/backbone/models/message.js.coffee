class Chamber.Models.Message extends Backbone.Model
  paramRoot: 'message'

  defaults:
    author: null
    body: null
    room_id: null

class Chamber.Collections.MessagesCollection extends Backbone.Collection
  model: Chamber.Models.Message
  url: '/messages'