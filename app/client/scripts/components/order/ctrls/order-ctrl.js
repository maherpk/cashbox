'use strict';

const ORDER = new WeakMap();
const ITEM = new WeakMap();
const SHIFT = new WeakMap();
const LOCATION = new WeakMap();
const DISCOUNT = new WeakMap();

export default class OrderCtrl {
  constructor(Order, Item, Shift, Discount, $location) {
    'ngInject';
    ORDER.set(this, Order);
    ITEM.set(this, Item);
    SHIFT.set(this, Shift);
    LOCATION.set(this, $location);
    DISCOUNT.set(this, Discount);

    this._shift = false;
    this._showPaymentTypes = false;
    this._showCashIn = false;
    this._showCardIn = false;
    this._currentTable = null;
    this._people = 1;
    this._serves = [];
    this._bills = [];
    this._items = [];
    this._tables = [];
    this._currentTrans = {};
    this._blankTable = {
      tableNumber: null,
      order: {},
      occupied: false
    }
    this._blanktrans = {
      properties: {},
      grand_total: null,
      discount_value: null,
      cash: null,
      balance: null,
      items_total: null,
      tax: null,
      transaction_type: ''
    }
    

    this._init();
  }

  _init() {
    ITEM.get(this).all().then((data) => {
      this._items = data;
    });

    SHIFT.get(this).getTables().then((data) => {
      this._numbers = data.value;
      for (var i = 0; i < this._numbers; i++) {
        let table = _.clone(this._blankTable);
        table.tableNumber = i + 1;
        this._tables.push(table);
      }
    });

    DISCOUNT.get(this).all().then(data => {
      this._discounts = data;
    });

    this._currentTrans = _.clone(this._blanktrans);
  }

  getShift() {
    return SHIFT.get(this).current();
  }

  order() {
    return ORDER.get(this).order();
  }

  increment(itemID) {
    ORDER.get(this).addItem(itemID);
  }

  decrement(itemID) {
    ORDER.get(this).removeItem(itemID);
  }

  itemsTotal() {
    return ORDER.get(this).getTotal(this._items);
  }

  tax() {
    return ORDER.get(this).getTax(this.itemsTotal());
  }

  discountValue() {
    return ORDER.get(this).getDiscount(this.itemsTotal() + this.tax());
  }

  peopleUp() {
    this._people++;
  }

  peopleDown() {
    this._people--;
  }

  save() {
    this._currentTrans.transaction_type = this._transaction_type;
    this._currentTrans.grand_total = this.calculateGTotal();
    this._currentTrans.discount_value = this.discountValue();
    this._currentTrans.items_total = this.itemsTotal();
    this._currentTrans.tax = this.tax();
    this._currentTrans.cash = parseInt(this.cashRecieve);
    this._currentTrans.balance = this.balance();
    if(this._transaction_type == 'card') {
      this._currentTrans.cash = 0;
      this._currentTrans.balance = 0;
    }

    let tableNumber = 'Take Away';
    if (this._currentTable){
      tableNumber = this._currentTable.tableNumber;
    }

    this._currentTrans.properties = {
      table: tableNumber,
      people: this._people,
      card_recp: this.cardRecp 
    }

    console.log(this._currentTrans);

  }

  print(props, flag) {
    if (angular.isUndefined(flag)) {
      props = (props) ? {
        properties: props
      } : false;
    }
    ORDER.get(this).reset();
    LOCATION.get(this).path('/');
  }

  endShift() {
    this._hideOrderBox = true;
    LOCATION.get(this).path('/summary/');
  }

  showPaymentTypes(props) {
    this._showPaymentTypes = !this._showPaymentTypes;
  }

  abort() {
    if (this._currentTable) {
      let index = this._tables.indexOf(this._currentTable);
      this._tables[index].order = {};
      this._tables[index].occupied = false;
      let ser = this._serves.indexOf(this._currentTable);
      this._serves.splice(ser, 1);
      this._currentTable = null;
    }
    this._showCashIn = false;
    this._showCardIn = false;
    this._people = 0;
    ORDER.get(this).reset();
    LOCATION.get(this).path('/');
  }

  back() {
    LOCATION.get(this).path('/');
  }

  hold() {
    this._hold = ORDER.get(this).hold();
    if (this._showPaymentTypes) {
      this._showPaymentTypes = !this._showPaymentTypes;
    }
  }

  unhold(order) {
    ORDER.get(this).unhold(order);
  }

  setTable(table) {
    if (this._currentTable) {
      this._currentTable.occupied = false;
    }
    this._currentTable = table;
    table.occupied = true;
  }

  serve() {
    ORDER.get(this).kitchenPrint(this._currentTable);
    this._currentTable.order = ORDER.get(this).serve();
    this._serves.push(this._currentTable);
    this._currentTable = null;
  }

  closeServe(serve) {
    ORDER.get(this).closeServe(serve.order);
    this._currentTable = serve;
  }

  qBills(props) {
    this._bills.push(props);
    this.hold();
  }

  cashIn() {
    this._showCashIn = true;
    this._transaction_type = 'cash';
  }

  cardIn() {
    this._showCardIn = true;
    this._transaction_type = 'card';
  }

  calculateGTotal() {
    let amount = 0;
    amount = (this.itemsTotal() + this.tax()) - this.discountValue();
    return Math.round(amount);
  }

  balance() {
    return Math.round(parseInt(this.cashRecieve) - this.calculateGTotal());
  }

  // methods
}