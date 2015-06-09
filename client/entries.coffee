Template.entries.helpers entries: ->
# Show newest entries first
  Entries.find {owner: Meteor.userId()}, sort: createdAt: -1
