'use strict';

const ORDER = new WeakMap();
const ITEM = new WeakMap();
const SHIFT = new WeakMap();
const LOCATION = new WeakMap();

export default class OrderCtrl {
  constructor(Order, Item, Shift, $location) {
    'ngInject';
    ORDER.set(this, Order);
    ITEM.set(this, Item);
    SHIFT.set(this, Shift);
    LOCATION.set(this, $location);

    this._items = [];
    this._shift = false;
    this._showPaymentTypes = false;
    this._hideOrderBox = false;

    this._init();
  }

  _init () {
    ITEM.get(this).all().then((data) => {
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

  save (props) {
    props = (props) ? {properties: props} : false;
    ORDER.get(this).save(props);
    ORDER.get(this).reset();
    LOCATION.get(this).path('/');

  }

  endShift () {
    this._hideOrderBox = true;
    LOCATION.get(this).path('/summary/');
  }

  showPaymentTypes () {
    this._showPaymentTypes = !this._showPaymentTypes;
  }

  abort () {
    ORDER.get(this).reset();
  }

  hold () {
    this._hold = ORDER.get(this).hold();
  }

  unhold(order) {
    ORDER.get(this).unhold(order);
  }

  // methods
}
