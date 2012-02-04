#Chamber.Views.Attachments ||= {}
#
#class Chamber.Views.Attachments.AttachmentView extends Backbone.View
#  template: JST["backbone/templates/attachments/attachment"]
#  
#  Messages = new Chamber.Collections.MessagesCollection
#  
#  initialize: ->
#    $("#messages").dropArea().bind("drop", @drop)
#  
#  drop: (e) =>
#    e.stopPropagation()
#    e.preventDefault()
#    e = e.originalEvent
#    
#    files = e.dataTransfer.files
#    @upload file for file in files
#
#  upload: (file) =>
#
#    message = Messages.create({
#      body: "Uploading " + file.name,
#      room_id: 611531309
#    }, {silent: true, success: ->
#      
#      $.upload("/attachments", {file: file}, {
#        dataType: "json",
#        upload: ->
#          progress: (e) ->
#            #Spine.Model.noSync(->
#            #  var per = Math.round((e.position / e.total) * 100);
#            #  message.updateAttributes({per: per});
#            #)
#            console.log(e)
#      }).success((data) ->
#        console.log('UPDATING', message)
#        console.log(data)
#        message.set({
#          body: file.name + ": " + data.url
#        })
#      )
#    })
