import isOnline from 'is-online';

const Q = new WeakMap();

export default class Online{
	constructor($q) {
    'ngInject';

    Q.set(this, $q);
  }

  checkOnline() {
    let defer = Q.get(this).defer();
    isOnline().then(r => {
      if (r == true) {
        defer.resolve(r);
      } else {
        defer.reject(r);
      }
    });

    return defer.promise;
  }


}