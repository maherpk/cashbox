
exports.up = function(knex, Promise) {
	return Promise.all([knex.schema.table('shifts', (table) => {
			table.jsonb('properties');
		})
	]);
  
};

exports.down = function(knex, Promise) {
  
};
