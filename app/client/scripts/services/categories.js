import BaseEndpoint from './base';
const Q = new WeakMap();

export default class Category extends BaseEndpoint {
  constructor($q) {
    'ngInject';

    super($q);
    Q.set(this, $q);

    this._localstorageName = 'orm';
    this._baseAPIname = 'category';
  }

  // methods

  all() {
    return this._request('');
  }

  add(obj) {
    return this._request('add', obj);
  }
}
