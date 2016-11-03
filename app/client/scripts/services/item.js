const Q = new WeakMap();

export default class Item {
  constructor($q) {
    'ngInject';
    this.current = undefined;
    Q.set(this, $q);
  }

  // methods

  all () {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/items/', (error, result) => {
      if (error) {
        defer.reject(error);
      }

      if (result) {
        defer.resolve(result);
      }
    });

    return defer.promise;
  }
}
