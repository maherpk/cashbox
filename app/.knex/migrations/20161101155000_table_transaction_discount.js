
exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.table('transactions', (table) => {
      table.bigInteger('discount').unsigned();
    })
  ]);
};

exports.down = function(knex, Promise) {

};
