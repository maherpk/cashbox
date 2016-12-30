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

Meteor.methods({'/orm/setting/discount/': () => {
	return Setting.select('*').where({
		key: 'Discount'
	}).run()[0];
}});

Meteor.methods({'/orm/setting/password/': () =>{
	return Setting.select('*').where({
		key: 'Password'
	}).run()[0];
}});

Meteor.methods({'/orm/setting/set-password/': (data) => {
	return Setting.where({
		key: 'Password'
	}).update({
		value: data
	}).run()[0];
}});