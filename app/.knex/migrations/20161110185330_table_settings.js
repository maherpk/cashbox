
exports.up = function(knex, Promise) {
	return Promise.all([
		knex.schema.createTableIfNotExists('settings', (table) => {
	      table.increments();
	      table.string('key').notNullable();
	      table.string('value');
    	})
	]);
  
};

exports.down = function(knex, Promise) {
  
};
