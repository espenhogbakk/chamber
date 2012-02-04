class Chamber.Models.User extends Backbone.Model
  paramRoot: 'user'

class Chamber.Collections.UsersCollection extends Backbone.Collection
  model: Chamber.Models.User
  url: '/users'