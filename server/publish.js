Meteor.publish(null, function () {
  return [
    Entries.find()
  ];
});