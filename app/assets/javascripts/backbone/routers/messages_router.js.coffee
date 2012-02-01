class Chamber.Routers.MessagesRouter extends Backbone.Router
  initialize: (options) ->
    @messages = new Chamber.Collections.MessagesCollection()
    @messages.reset options.messages

  routes:
    "/new"      : "newMessage"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newMessage: ->
    @view = new Chamber.Views.Messages.NewView(collection: @messages)
    $("#messages").html(@view.render().el)

  index: ->
    @view = new Chamber.Views.Messages.IndexView(messages: @messages)
    $("#messages").html(@view.render().el)

  show: (id) ->
    message = @messages.get(id)

    @view = new Chamber.Views.Messages.ShowView(model: message)
    $("#messages").html(@view.render().el)

  edit: (id) ->
    message = @messages.get(id)

    @view = new Chamber.Views.Messages.EditView(model: message)
    $("#messages").html(@view.render().el)
