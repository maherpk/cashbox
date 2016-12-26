
exports.up = function (knex, Promise) {
  return Promise.all([
    knex.schema.table('categories', (table) => {
      table.string('type');
      table.string('subtype');
    })
  ]);
};

exports.down = function (knex, Promise) {

};
