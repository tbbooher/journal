Template.entries.helpers
  entries: -> Entries.find {owner: Meteor.userId()}, sort: createdAt: -1
  isNewEntry: -> !@entry_date && true

Template.entry.helpers
  slashToDash: (slashDate) -> slashDate.replace /\//g, '-'
  
#Template.updateaf.helpers
#  autoSaveMode: ->
#    if Session.get('autoSaveMode') then true else false
#  selectedPersonDoc: ->
#    People.findOne Session.get('selectedPersonId')
#  isSelectedPerson: ->
#    Session.equals 'selectedPersonId', @_id
#  formType: ->
#    if Session.get('selectedPersonId')
#      'update'
#    else
#      'disabled'
#  disableButtons: ->
#    !Session.get('selectedPersonId')