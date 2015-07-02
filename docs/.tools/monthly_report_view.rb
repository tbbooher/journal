# this requires the ruby gem: "simple_calendar", "~> 0.1.5"

= calendar @events do |event|
  - if event.lack_of_discipline
    .calendar_report.discipline &nbsp;
  - if event.sick
    .calendar_report.sick &nbsp;
  - if event.workout
    .calendar_report.workout &nbsp;
  - if event.problem_attempted
    .calendar_report.problem_attempted &nbsp;
  - if event.flossed
    .calendar_report.flossed &nbsp;
  = link_to event.friends_in_focus, edit_journal_entry_path(event)

.row
  #discipline.span2.offset1.well.discipline.pointer
    Lack of Discipline
  #sick.span2.well.sick.pointer
    Sick
  #workout.span2.well.workout.pointer
    Workout
  #problem_attempted.span2.well.problem_attempted.pointer
    Problem Attempted
  #flossed.span2.well.flossed.pointer
    %span.white Flossed

%h3
  Monthly Report for
  = @month_string

#monthly_report{data: { month_string: @month_string }}