Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.EditView extends Backbone.View
  template : JST["backbone/templates/rooms/edit"]

  events :
    "submit #edit-room" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (room) =>
        @model = room
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
