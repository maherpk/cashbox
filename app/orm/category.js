let Category = new PG.Table('categories');

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
  '/orm/category/add': (obj) => {
    return Category.insert(obj)
      .returning(['id', 'name']).run()[0];
  },
  '/orm/category/edit': (catID, name) => {
    let timestamp = new Date();
    Category
      .udpate({
        name: name,
        updated_at: timestamp
      })
      .where({
        id: catID
      })
      .returning(['id', 'name'])
      .run()[0];
  },
  '/orm/category/fetch': (catID) => {
    return Category.select('*').where({
      id: catID
    }).returning(['id', 'name']).run()[0];
  },
  '/orm/category/': () => {
    return Category.select('*').returning(['id', 'name']).run();
  }
});
