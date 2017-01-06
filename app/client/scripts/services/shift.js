import _ from 'lodash';
import BaseEndpoint from './base';

const Q = new WeakMap();

export default class Shift extends BaseEndpoint {
  constructor($q) {
    'ngInject';

    super($q);
    Q.set(this, $q);
    
    this._localstorageName = 'orm';
    this._baseAPIname = 'shifts'
    this._current = undefined;
    
  }

  start (data) {
    return this._request('add', data);
  }

  latest () {
    return this._request('latest');
  }

  end (shiftID) {
    shiftID = (shiftID) ? shiftID : this._current.id;
    this._request('end', shiftID);
    this._current = false;
  }

  all () {
    return this._request('');
  }

  current () {
    return this._current;
  }

  setCurrent (shift) {
    this._current = _.clone(shift);
  }

  printSummary(data) {
    return this._request('print-summary', data);
  }

  shiftTransactions(shift) {
    shift = (shift) ? shift : this.current();
    let data = { shift_id: shift.id };
    return this._request('all-transactions', data);
  }

  shiftItems (shift) {
    shift = (shift) ? shift : this.current();
    let data = { shift_id: shift.id };
    return this._request('shift-items', data);
  }

  sendCsvEmail () {
    return this._request('all-items-csv');
  }
}
