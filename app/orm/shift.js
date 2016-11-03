let Shifts = new PG.Table('shifts');

Meteor.methods({
  // '/todos/delete': function (todoId) {
  //   Todos.delete().where({id: todoId}).run();
  // },
  // '/todos/setChecked': function (todoId, checked) {
  //   Todos.update({checked: checked}).where({id: todoId}).run();
  // },
  // '/todos/setText': function (todoId, newText) {
  //   Todos.update({text: newText}).where({id: todoId}).run();
  // }
  '/orm/shifts/add': () => {
    let timestamp = new Date();
    return Shifts.insert({
      started_at: timestamp
    }).returning(['id', 'started_at']).run()[0];
  },
  '/orm/shifts/end': (shiftID) => {
    let timestamp = new Date();
    return Shifts.udpate({ended_at: timestamp}).where({id:shiftID}).run();
  },
  '/orm/shifts/': () => {
    let d = Shifts.select('*').returning(['id','started_at', 'ended_at']).run();
    console.log(d);
    return d;
  }

});
