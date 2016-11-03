let Item = new PG.Table('items');

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
  '/orm/items/fetch/': (itemID) => {
    return Item.select('*').where({
      id: itemID
    }).returning(['id', 'name', 'price']).run()[0];
  },
  '/orm/items/': () => {
    return Item.select('*').returning(['id', 'name', 'price']).run();
  },
  '/orm/items/filter/': (filter) => {
    return Item.select('*').where(filter).returning(['id', 'name', 'price']).run();
  }
});
