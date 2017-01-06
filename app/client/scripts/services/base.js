import isOnline from 'is-online';

const Q = new WeakMap();

export default class BaseEndpoint {
  _localstorageName = '';
  _baseAPIname = '';

  constructor($q) {
    Q.set(this, $q);
  }

	_request(endpoint, data = null) {
    let defer = Q.get(this).defer();
    isOnline().then(r => {
      if (r == false) {
        this._localstorageName = '/online/'
        // different storage & api name 
        // is online perform online request 
      } else {
        this._localstorageName = '/orm/';
        let apiEndpoint = this._localstorageName + this._baseAPIname + '/' + endpoint + '/';
        this._call(apiEndpoint, data).then(r => {
          defer.resolve(r);
        }, e => {
          defer.reject(e);
        })
      }
    });

    return defer.promise;
  }

  _call(apiEndpoint, data = null) {
    let defer = Q.get(this).defer();
    Meteor.call(apiEndpoint, data, (error, result) => {
      (error) ? defer.reject(error) : false;
      (result) ? defer.resolve(result) : false;
    });

    return defer.promise;
  }
}