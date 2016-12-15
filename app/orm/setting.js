let Setting = new PG.Table('settings');

Meteor.methods({
	'/orm/setting/salestax/': () => {
		return Setting.select('*').where({
			key: 'Sales Tax'
		}).run()[0];
	}
});


Meteor.methods({
	'/orm/setting/tables/': () => {
		return Setting.select('*').where({
			key: 'Tables'
		}).run()[0];
	}
});