const Q = new WeakMap();

export default class Category {
  constructor($q) {
    'ngInject';
    Q.set(this, $q);
  }

  // methods

  all() {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/category/', (error, result) => {
      if (error) {
        defer.reject(error);
      }

      if (result) {
        defer.resolve(result);
      }
    });

    return defer.promise;
  }

  add(obj) {
    let defer = Q.get(this).defer();

    Meteor.call('/orm/category/add/', obj, (error, result) => {
      if (error) {
        defer.reject(error);
      }

      if (result) {
        defer.resolve(result);
      }
    });

    return defer.promise;
  }

  items (catID) {
    let defer = Q.get(this).defer();

    Meteor.call('/orm/items/filter/', {
      category_id: catID
    }, (error, result) => {
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
