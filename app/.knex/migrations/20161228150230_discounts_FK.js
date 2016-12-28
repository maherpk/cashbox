
exports.up = function (knex, Promise) {
  return Promise.all([
    knex.schema.table('transactions', (table) => {
      table.dropColumn('discount');
      table.decimal('discount_value');
      table.bigInteger('discount_id').unsigned().index();
      table.foreign('discount_id').references('discounts.id');
      
    }),
    knex.schema.table('line_items', (table) => {
      table.dropColumn('discount');
      table.decimal('discount_value');
      table.bigInteger('discount_id').unsigned().index();
      table.foreign('discount_id').references('discounts.id');
      
    })
  ]);
};

exports.down = function (knex, Promise) {

};
