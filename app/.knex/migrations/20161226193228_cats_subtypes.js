
exports.up = function (knex, Promise) {
  return Promise.all([
    knex.schema.table('categories', (table) => {
      table.string('family');
      table.string('sub_family');
    })
  ]);
};

exports.down = function (knex, Promise) {

};
