#Tasks = new (Mongo.Collection)('tasks')
Entries = new (Mongo.Collection)('entries')

if Meteor.isClient
  # This code only runs on the client
  Template.body.rendered = ->
    $('#entry_date').datepicker()
    return
  Template.body.helpers entries: ->
    # Show newest entries first
    Entries.find {owner: Meteor.userId()}, sort: createdAt: -1
  Template.body.events 'submit #journal_entry_form': (event) ->
    # This function is called when the new task form is submitted
    Entries.insert
      owner: Meteor.userId()
      entry_date: event.target.entry_date.value
      description: event.target.description.value
      at_work: event.target.at_work.value
      at_home: event.target.at_home.value
      at_home_pc: event.target.at_home_pc.value
      someday_maybe: event.target.someday_maybe.value
      blog_post_ideas: event.target.blog_post_ideas.value
      friends: event.target.friends.value
      networking: event.target.networking.value
      consulting: event.target.consulting.value
      to_read: event.target.to_read.value
      goals: event.target.goals.value
      memory_verse: event.target.memory_verse.value
      purity: event.target.purity.value
      fitness: event.target.fitness.value
      devotional: event.target.devotional.value
      wife: event.target.wife.value
      relational: event.target.relational.value
      discipline: event.target.discipline.value
      stress: event.target.stress.value
      #facepicking: event.target.facepicking.value
      friends_in_focus: event.target.friends_in_focus.value
      health_statement: event.target.health_statement.value
      lack_of_discipline: event.target.lack_of_discipline.value
      sick: event.target.sick.value
      flossed: event.target.flossed.value
      workout: event.target.workout.value
      problem_attempted: event.target.problem_attempted.value
      problem_solved: event.target.problem_solved.value
    # now, lets clear out values
    event.target.description.value = ''
    # Prevent default form submit
    false