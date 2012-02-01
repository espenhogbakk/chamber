Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.RoomView extends Backbone.View
  template: JST["backbone/templates/rooms/room"]

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
