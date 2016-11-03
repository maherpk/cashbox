
exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTable('shifts', (table) => {
      table.increments();
      table.timestamps(true, true);
      table.timestamp('started_at');
      table.timestamp('ended_at');
    })
  ]);
};

exports.down = function(knex, Promise) {

};
