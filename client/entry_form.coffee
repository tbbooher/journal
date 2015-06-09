Template.entry_form.rendered = ->
  $('#entry_date').datepicker()
  return

Template.entry_form.events 'submit #journal_entry_form': (event) ->
  event.preventDefault()
  form = event.target

  Entries.insert
    owner: Meteor.userId()
    entry_date: form.entry_date.value
    description: form.description.value
#      at_work: form.at_work.value
#      at_home: form.at_home.value
#      at_home_pc: form.at_home_pc.value
#      someday_maybe: form.someday_maybe.value
#      blog_post_ideas: form.blog_post_ideas.value
    friends: form.friends.value
    networking: form.networking.value
    consulting: form.consulting.value
    to_read: form.to_read.value
    goals: form.goals.value
    memory_verse: form.memory_verse.value
    purity: form.purity.value
    fitness: form.fitness.value
    devotional: form.devotional.value
    wife: form.wife.value
    relational: form.relational.value
    discipline: form.discipline.value
    stress: form.stress.value
    #facepicking: form.facepicking.value
    friends_in_focus: form.friends_in_focus.value
    health_statement: form.health_statement.value
    lack_of_discipline: form.lack_of_discipline.value
    sick: form.sick.value
    flossed: form.flossed.value
    workout: form.workout.value
    problem_attempted: form.problem_attempted.value
    problem_solved: form.problem_solved.value

  # now, lets clear out values
  event.target.description.value = ''
  return