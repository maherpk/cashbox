
exports.up = function(knex, Promise) {
	return Promise.all([knex.schema.table('transactions', (table) => {
		table.enu('transaction_type', ['cash', 'card']);
		table.decimal('items_total');
		table.decimal('tax');
		table.decimal('cash');
		table.decimal('balance');
		table.decimal('grand_total');
	})
	]);
  
};

exports.down = function(knex, Promise) {
  
};
