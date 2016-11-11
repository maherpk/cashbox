let Setting = new PG.Table('settings');

Meteor.methods({
	'/orm/setting/salestax/': () => {
		return Setting.select('*').where({
			key: 'Sales Tax'
		}).run()[0];
	}
});