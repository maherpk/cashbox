exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTableIfNotExists('categories', (table) => {
      table.increments();
      table.timestamps(true, true);
      table.string('name').notNullable();
    }),
    knex.schema.createTableIfNotExists('items', (table) => {
      table.increments();
      table.timestamps(true, true);
      table.string('name').notNullable().unique();
      table.decimal('price');
      table.enu('unit', ['ml', 'mg', 'kg', 'ltrs', 'quantity']);
      table.bigInteger('category_id').unsigned().index();
      table.foreign('category_id').references('categories.id');
    })
  ]);

};

exports.down = function(knex, Promise) {

};
