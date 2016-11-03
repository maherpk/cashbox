const Q = new WeakMap();

export default class Shift {
  constructor($q) {
    'ngInject';
    this.current = undefined;
    Q.set(this, $q);
  }

  // methods

  start () {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/shifts/add', (error, result) => {
      if (error) {
        defer.reject(error);
      }

      if (result) {
        this.current = result;
        defer.resolve(result);
      }
    });

    return defer.promise;
  }

  end (shiftID) {
    Meteor.call('/orm/shifts/end', shiftID);
  }

  all () {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/shifts/', (error, result) => {
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
