import _ from 'lodash';
import BaseEndpoint from './base';

const Q = new WeakMap();

export default class Setting extends BaseEndpoint {
	constructor($q) {
    'ngInject';

    super($q);
    Q.set(this, $q);
    
    this._localstorageName = 'orm';
    this._baseAPIname = 'setting'
  }

  getTables() {
    return this._request('tables')
  }
}