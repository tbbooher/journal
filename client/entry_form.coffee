# todo: should use simple-schema and autoform modules

Template.entry_form.onRendered ->
#  dt = '7/3/2015' # this is the _worse_ way to do this . . . would like to use autoValue from collections2
#  console.log dt
#  $("#entry_date").val(dt)
  # none of the following work -- I have no idea why, but I would really like to know
  $("#entry_date").datepicker
    orientation: "top left"
    calendarWeeks: true
    autoclose: true
  
entrySchema = ['entry_date',  'description',  'friends_in_focus',  'memory_verse',  'workout_done',  'purity',  'devotional',  'discipline',  'fitness',  'wife',  'relational',  'stress',  'flossed',  'sick',  'problem_solved',  'problem_attempted',  'lack_of_discipline',  'workout']

@autorun =>
  data = Template.currentData()
  if data?.entry_date
    for fieldName in entrySchema
      @$("[name=#{fieldName}]").val data[fieldName]
  else
    @$("form")[0].reset()


Template.entry_form.events 'submit #journal_entry_form': (event) ->
  event.preventDefault()
  entry = 'owner': Meteor.userId()
  # need to take care of created_at
  entry[field] = event.target[field].value for field in entrySchema
  dbUpsert = Entries.upsert "_id":@_id, entry
  event.target.reset() if dbUpsert.insertedId
  return

Template.entry_form.helpers
  isNewEntry: -> !@entry_date && true