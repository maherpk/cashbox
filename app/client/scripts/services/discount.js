const Q = new WeakMap();

export default class Discount {
  constructor($q) {
    'ngInject';
    this.current = undefined;
    Q.set(this, $q);
  }

  // methods

  all () {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/discounts/', (error, result) => {
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