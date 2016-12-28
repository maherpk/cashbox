
exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTableIfNotExists('discounts', (table) => {
      table.increments();
      table.string('name').notNullable();
      table.decimal('value');
      table.string('operator');
      table.boolean('is_active', true);
    })
  ]);
};

exports.down = function(knex, Promise) {
  
};
