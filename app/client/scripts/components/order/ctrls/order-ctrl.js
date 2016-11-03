'use strict';

const ORDER = new WeakMap();
const ITEM = new WeakMap();

export default class OrderCtrl {
  constructor(Order, Item) {
    'ngInject';
    ORDER.set(this, Order);
    ITEM.set(this, Item);

    this._items = [];

    this._init();
  }

  _init () {
    ITEM.get(this).all().then((data) => {
      console.log(data);
      this._items = data;
    });
  }

  order () {
    return ORDER.get(this).order();
  }

  increment (itemID) {
    ORDER.get(this).addItem(itemID);
  }

  decrement (itemID) {
    ORDER.get(this).removeItem(itemID);
  }

  total () {
    return ORDER.get(this).getTotal(this._items);
  }

  // methods
}
