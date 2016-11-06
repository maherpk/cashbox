let LineItem = new PG.Table('line_items');

Meteor.methods({
  '/orm/lineitems/add/': (obj) => {
    return LineItem.insert(obj).returning('id').run()[0];
  },
  '/orm/lineitems/filter/': (filter) => {
    return LineItem.select('*').where(filter).run();
  }
});
