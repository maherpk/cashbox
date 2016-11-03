exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTable('suppliers', (table) => {
      table.increments();
      table.timestamps(true, true);
      table.string('name').notNullable();
      table.jsonb('properties');
    }),
    knex.schema.createTable('supplies', (table) => {
      table.increments();
      table.timestamps(true, true);
      table.bigInteger('item_id').unsigned().index();
      table.foreign('item_id').references('items.id');
      table.bigInteger('supplier_id').unsigned().index();
      table.foreign('supplier_id').references('suppliers.id');
      table.bigInteger('quantity').unsigned();
    })
  ]);
};

exports.down = function(knex, Promise) {

};
