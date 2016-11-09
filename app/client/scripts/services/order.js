import _ from 'lodash';

const SHIFT = new WeakMap();
const TRANSACTION = new WeakMap();

export default class Order {
  constructor(Shift, Transaction) {
    'ngInject';
    this._defaultOrder = [];
    this._order = [];

    SHIFT.set(this, Shift);
    TRANSACTION.set(this, Transaction);
  }

  order() {
    return this._order = (this._order.length) ? this._order : _.clone(this._defaultOrder);
  }

  addItem(itemID) {
    let idx = _.findIndex(this._order, {item_id: itemID});
    if (idx > -1) {
      this._order[idx].quantity += 1;
    } else {
      this._order.push({
        item_id: itemID,
        quantity: 1
      });
    }
  }

  removeItem(itemID) {
    let idx = _.findIndex(this._order, {item_id: itemID});
    if (this._order[idx].quantity === 1) {
      this._order.splice(idx, 1);
    } else {
      this._order[idx].quantity += -1;
    }
  }

  getTotal (allItems) {
    let total = 0;
    _.forEach(this._order, (singleton) => {
      let idx = _.findIndex(allItems, {id: singleton.item_id});
      total += (allItems[idx].price * singleton.quantity);
    });

    return total;
  }

  save (obj) {
    obj = obj ? obj : {};
    let order = _.clone(this._order);
    let shiftID = SHIFT.get(this).current().id;

    obj.shift_id = shiftID;

    TRANSACTION.get(this).save(obj).then(data => {
      console.log(data);
      _.forEach(order, (singleton) => {
        singleton.transaction_id = data;
        TRANSACTION.get(this).addLineItem(singleton);
      });
    });
  }

  reset () {
    this._order = _.clone(this._defaultOrder);
  }

}
