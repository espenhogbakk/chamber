class Chamber.Routers.RoomsRouter extends Backbone.Router
  initialize: (options) ->
    @rooms = new Chamber.Collections.RoomsCollection()
    @rooms.reset options.rooms

  routes:
    "/new"      : "newRoom"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newRoom: ->
    @view = new Chamber.Views.Rooms.NewView(collection: @rooms)
    $("#rooms").html(@view.render().el)

  index: ->
    @view = new Chamber.Views.Rooms.IndexView(rooms: @rooms)
    $("#rooms").html(@view.render().el)

  show: (id) ->
    room = @rooms.get(id)

    @view = new Chamber.Views.Rooms.ShowView(model: room)
    $("#rooms").html(@view.render().el)

  edit: (id) ->
    room = @rooms.get(id)

    @view = new Chamber.Views.Rooms.EditView(model: room)
    $("#rooms").html(@view.render().el)
