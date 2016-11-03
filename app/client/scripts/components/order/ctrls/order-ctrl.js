'use strict';

const ORDER = new WeakMap();
const ITEM = new WeakMap();
const SHIFT = new WeakMap();

export default class OrderCtrl {
  constructor(Order, Item, Shift) {
    'ngInject';
    ORDER.set(this, Order);
    ITEM.set(this, Item);
    SHIFT.set(this, Shift);

    this._items = [];
    this._shift = false;

    this._init();
  }

  _init () {
    ITEM.get(this).all().then((data) => {
      console.log(data);
      this._items = data;
    });
  }

  getShift () {
    return SHIFT.get(this).current();
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

  checkout () {

  }

  abort () {

  }

  // methods
}
