import { Meteor } from 'meteor/meteor';
import './orm/_fixtures';

Meteor.startup(() => {
  // code to run on server at startup
  // process.env.POSTGRESQL_URL = 'postgres://127.0.0.1/mahercash';
  // process.env.MONGO_URL = 'nope';
  // process.env.PACKAGES_DIR = './node_modules';
});
