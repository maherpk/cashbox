let Transaction = new PG.Table('transactions');

Meteor.methods({
  '/orm/transactions/add/': (data) => {
    return Transaction.insert(data).returning('id').run()[0];
  },
  '/orm/transactions/filter/': (params) => {
    return Transaction.select('*').where(params).run();
  },
  '/orm/transactions/range/': (start, end) => {
    start = new Date(start).toISOString();
    end = new Date(end).toISOString();
    console.log(start);
    console.log(end);
    let query = `created_at BETWEEN '${start}'::timestamp AND '${end}'::timestamp;`;
    //return Transaction.select('*').whereBetween('created_at'. start, end).run();
    return Transaction.select('*').whereRaw(query)
  }
});
