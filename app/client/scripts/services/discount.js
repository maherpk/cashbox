import BaseEndpoint from './base';

export default class Discount extends BaseEndpoint {
  constructor($q) {
    'ngInject';

    super($q);
    this._localstorageName = 'orm';
    this._baseAPIname = 'discounts';
  }

  // methods

  all () {
    return this._request('');
  }
}