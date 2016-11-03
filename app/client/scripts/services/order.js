import _ from 'lodash';

export default class Order {
  constructor() {
    this._defaultOrder = [];
    this._order = [];
  }

  order() {
    return this._order = (this._order.length) ? this._order : angular.copy(this._defaultOrder);
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

}
