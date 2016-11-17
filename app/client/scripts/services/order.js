import _ from 'lodash';

const SHIFT = new WeakMap();
const TRANSACTION = new WeakMap();
const ITEM = new WeakMap();

export default class Order {
  constructor(Shift, Transaction, Item, $filter) {
    'ngInject';
    this._defaultOrder = [];
    this._order = [];
    this._hold = [];
    this._salesTax = 0;
    this._currentTransaction = 0;
    this.$filter = $filter;
    this._items = [];
    this._blankItem = {};
    this._renderdItems = [];
    this._renderTransaction = {};

    SHIFT.set(this, Shift);
    TRANSACTION.set(this, Transaction);
    ITEM.set(this, Item);

    this._init();
  }

  _init() {
    ITEM.get(this).all().then((data) => {
      this._items = data;
    });
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
    this.allItems
    let total = 0;
    _.forEach(this._order, (singleton) => {
      let idx = _.findIndex(allItems, {id: singleton.item_id});
      total += (allItems[idx].price * singleton.quantity);
    });

    return total;
  }

  getTax (amount) {
    if (this._salesTax == 0) {
      TRANSACTION.get(this).getSalesTax().then(data => {
        this._salesTax = parseInt(data.value);
      });
    }

    let taxed = (parseInt(this._salesTax) / 100) * parseInt(amount)
    return taxed;
  }

  save (obj) {
    obj = obj ? obj : {};
    let order = _.clone(this._order);
    let shiftID = SHIFT.get(this).current().id;

    obj.shift_id = shiftID;
    TRANSACTION.get(this).save(obj).then(data => {
      this._currentTransaction = data;
      _.forEach(order, (singleton) => {
        singleton.transaction_id = data;
        TRANSACTION.get(this).addLineItem(singleton);
      });
    });
    this.print(obj);
  }

  print(transaction) {
    this._renderTransaction.trans = transaction;
    let order = _.clone(this._order);
      this._renderdItems = [];
    _.forEach(order, (singleton) => {
      let item = _.clone(this._blankItem);
      item.Quantity = singleton.quantity;
      item.Name = this.$filter('itemName')(singleton.item_id, this._items);
      item.Price = this.$filter('itemPrice')(singleton.item_id, this._items) * singleton.quantity;
      this._renderdItems.push(item);
    });

    this._renderTransaction.items = _.clone(this._renderdItems);
    console.log(this._renderTransaction);
    TRANSACTION.get(this).printTransaction(this._renderTransaction);
  }

  reset () {
    this._order = _.clone(this._defaultOrder);
  }

  hold() {
    this._hold.push(this._order);
    this._order = _.clone(this._defaultOrder);
    return this._hold;
  }

  unhold(order) {
    if (this._order.length) {
      this._hold.push(this._order);
    }
    let index = this._hold.indexOf(order);
    this._hold.splice(index, 1);
    this._order = _.clone(order);
  }

}
