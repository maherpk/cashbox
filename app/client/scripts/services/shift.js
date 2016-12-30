import _ from 'lodash';

const Q = new WeakMap();

export default class Shift {
  constructor($q) {
    'ngInject';
    this._current = undefined;
    Q.set(this, $q);
  }

  // methods

  start () {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/shifts/add/', (error, result) => {
      if (error) {
        defer.reject(error);
      }

      if (result) {
        this._current = result;
        defer.resolve(result);
      }
    });

    return defer.promise;
  }

  latest () {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/shifts/latest/', (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }

  end (shiftID) {
    shiftID = (shiftID) ? shiftID : this._current.id;
    Meteor.call('/orm/shifts/end/', shiftID);
    this._current = false;
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

  current () {
    //this.allTransactions();
    return this._current;
  }

  setCurrent (shift) {
    this._current = _.clone(shift);
  }

  allTransactions (shift) {
    shift = (shift) ? shift : this.current();
    let defer = Q.get(this).defer();

    Meteor.call('/orm/transactions/filter/', { shift_id: shift.id }, (error, result) => {
      if (error) {
        defer.reject(error);
      }

      if (result) {
        defer.resolve(result);
      }
    });

    return defer.promise;
  }

  checkPrinter() {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/shifts/check-printer/', (error, result) =>{
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });
    return defer.promise;
  }

  getTables() {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/setting/tables/', (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });
    return defer.promise;
  }

  printSummary(data) {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/shifts/print-summary/', data, (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });
    return defer.promise;
  }

  shiftTransactions(shift) {
    shift = (shift) ? shift : this.current();
    let defer = Q.get(this).defer();
    Meteor.call('/orm/transactions/in-shift-all/', { shift_id: shift.id }, (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });
    return defer.promise;
  }

  shiftItems (shift) {
    shift = (shift) ? shift : this.current();
    let defer = Q.get(this).defer();
    Meteor.call('/orm/shifts/shift-items/', { shift_id: shift.id }, (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });
    return defer.promise;
  }

  sendCsvEmail () {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/shifts/all-items-csv/', (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });
    return defer.promise;
  }

  password () {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/setting/password/', (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });
    return defer.promise;
  }

  setPassword (data) {
    let defer = Q.get(this).defer();
    Meteor.call('/orm/setting/set-password/',data, (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });
    return defer.promise;
  }
}
