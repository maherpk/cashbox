import _ from 'lodash';

const Q = new WeakMap();

export default class Transaction {
  constructor($q) {
    'ngInject';

    Q.set(this, $q);
  }

  save (properties) {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/transactions/add/', properties, (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }

  addLineItem (obj) {
    let defer = Q.get(this).defer();

    Meteor.call('/orm/lineitems/add/', obj, (error, result) => {
      console.log(error);
      console.log(result);
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }
}

// export default class Shift {
//   constructor($q) {
//     'ngInject';
//     this._current = undefined;
//     Q.set(this, $q);
//   }

//   // methods

//   start () {
//     let defer = Q.get(this).defer();
//     Meteor.call('/orm/shifts/add/', (error, result) => {
//       if (error) {
//         defer.reject(error);
//       }

//       if (result) {
//         this._current = result;
//         defer.resolve(result);
//       }
//     });

//     return defer.promise;
//   }

//   latest () {
//     let defer = Q.get(this).defer();
//     Meteor.call('/orm/shifts/latest/', (error, result) => {
//       (error) ? defer.reject(error) : false;
//       (result) ? defer.resolve(result) : false;
//     });

//     return defer.promise;
//   }

//   end (shiftID) {
//     Meteor.call('/orm/shifts/end/', shiftID);
//   }

//   all () {
//     let defer = Q.get(this).defer();
//     Meteor.call('/orm/shifts/', (error, result) => {
//       if (error) {
//         defer.reject(error);
//       }

//       if (result) {
//         defer.resolve(result);
//       }
//     });

//     return defer.promise;
//   }

//   current () {
//     return this._current;
//   }

//   setCurrent (shift) {
//     this._current = _.clone(shift);
//   }
// }
