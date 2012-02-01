Chamber.Views.Rooms ||= {}

class Chamber.Views.Rooms.NewView extends Backbone.View
  template: JST["backbone/templates/rooms/new"]

  events:
    "submit #new-room": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (room) =>
        @model = room
        window.location.hash = "/#{@model.id}"

      error: (room, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
