
exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.createTableIfNotExists('shifts', (table) => {
      table.increments();
      table.timestamps(true, true);
      table.timestamp('started_at');
      table.timestamp('ended_at');
    })
  ]);
};

exports.down = function(knex, Promise) {

};
