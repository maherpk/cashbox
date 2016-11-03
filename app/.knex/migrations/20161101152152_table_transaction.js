exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTable('transactions', (table) => {
      table.increments();
      table.timestamps(true, true);
      table.bigInteger('shift_id').unsigned().index();
      table.foreign('shift_id').references('shifts.id');
      // table.uuid('uuid').defaultTo(knex.raw('uuid_generate_v4()'));
      table.jsonb('properties');
    }),
    knex.schema.createTable('line_items', (table) => {
      table.increments();
      table.bigInteger('quantity').unsigned();
      table.decimal('discount');
      table.bigInteger('item_id').unsigned().index();
      table.foreign('item_id').references('items.id');
      table.bigInteger('transaction_id').unsigned().index();
      table.foreign('transaction_id').references('transactions.id');
    })
  ]);
};

exports.down = function(knex, Promise) {

};
