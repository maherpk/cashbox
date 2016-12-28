
exports.up = function (knex, Promise) {
  return Promise.all([
    knex.schema.table('categories', (table) => {
      table.string('family');
      table.string('sub_family');
    }),
    knex.schema.table('discounts', (table) => {
      table.boolean('is_active', true);
    })
  ]);
};

exports.down = function (knex, Promise) {

};
