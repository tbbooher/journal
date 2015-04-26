#Tasks = new (Mongo.Collection)('tasks')
Entries = new (Mongo.Collection)('entries')

if Meteor.isClient
  # This code only runs on the client
  Template.body.helpers entries: ->
    # Show newest entries first
    Entries.find {}, sort: createdAt: -1
  Template.body.events 'submit .new-task': (event) ->
    # This function is called when the new task form is submitted
    text = event.target.text.value
    Entries.insert
      text: text
      createdAt: new Date
    # Clear form
    event.target.text.value = ''
    # Prevent default form submit
    false