Template.entries.helpers
  entries: -> Entries.find {owner: Meteor.userId()}, sort: createdAt: -1
  isNewEntry: -> !@entry_date && true

Template.entry.helpers
  slashToDash: (slashDate) -> slashDate.replace /\//g, '-'