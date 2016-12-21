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
      // console.log(error);
      // console.log(result);
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }

  getLineItems (transactionId) {
    let defer = Q.get(this).defer();

    Meteor.call('/orm/lineitems/filter/', {transaction_id: transactionId}, (error, result) =>{
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }

  getSalesTax () {
    let defer = Q.get(this).defer();

    Meteor.call('/orm/setting/salestax/', (error, result) =>{
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }

  printTransaction(data) {
    let defer = Q.get(this).defer();

    Meteor.call('/orm/transactions/print/', data, (error, result) =>{
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }

  kitchen(data) {
    let defer = Q.get(this).defer();

    Meteor.call('/orm/transactions/kitchen/', data, (error, result) =>{
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }
}