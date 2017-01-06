import BaseEndpoint from './base';
const Q = new WeakMap();

export default class Item extends BaseEndpoint {
  constructor($q) {
    'ngInject';

    super($q);
    this._localstorageName = 'orm';
    this._baseAPIname = 'items';
    this.current = undefined;
    Q.set(this, $q);
  }

  // methods

  all () {
    return this._request('');
  }

  items (catID) {
    let data = {category_id: catID}
    return this._request('filter', data);
  }
}
