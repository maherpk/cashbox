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
    this._enableAgain = false;
    this._tables = [];
    this._currentTable = null;
    this._serves = [];
    this._blankTable = {
      tableNumber: null,
      order: {},
      occupied: false
    }

    this._init();
  }

  _init () {
    ITEM.get(this).all().then((data) => {
      this._items = data;
    });

    SHIFT.get(this).getTables().then((data) => {
      this._numbers = data.value;
      for(var i=0; i<this._numbers; i++) {
        let table = _.clone(this._blankTable);
        table.tableNumber = i+1;
        this._tables.push(table);
      }
    });

    this._hideOrderBox = false;
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

  tax () {
    return ORDER.get(this).getTax(this.total());
  }

  checkout () {

  }

  save (props) {
    props = (props) ? {properties: props} : false;
    ORDER.get(this).save(props);
    this._showPaymentTypes = !this._showPaymentTypes;
    this.print(props, true);
    if(this._currentTable) {
      let index = this._tables.indexOf(this._currentTable);
      this._tables[index].order = {};
      this._tables[index].occupied = false;
      let ser = this._serves.indexOf(this._currentTable);
      this._serves.splice(ser, 1);
      this._currentTable = null;
    }
  }

  print (props, flag) {
    if(angular.isUndefined(flag)) {
      props = (props) ? {properties: props} : false;
    }
    ORDER.get(this).print(props);
    ORDER.get(this).reset();
    LOCATION.get(this).path('/');
    // .then(r => {
    //   this._enableAgain = true;
    //   LOCATION.get(this).path('/error/');
    // }, e =>{
    //   ORDER.get(this).reset();
    //   this._enableAgain = false;
    //   LOCATION.get(this).path('/');
    // });
  }

  endShift () {
    this._hideOrderBox = true;
    LOCATION.get(this).path('/summary/');
  }

  showPaymentTypes () {
    this._showPaymentTypes = !this._showPaymentTypes;
  }

  abort () {
    if(this._currentTable) {
      let index = this._tables.indexOf(this._currentTable);
      this._tables[index].order = {};
      this._tables[index].occupied = false;
      let ser = this._serves.indexOf(this._currentTable);
      this._serves.splice(ser, 1);
      this._currentTable = null;
    }
    ORDER.get(this).reset();
    LOCATION.get(this).path('/');
  }

  back () {
    LOCATION.get(this).path('/');
  }

  hold () {
    this._hold = ORDER.get(this).hold();
  }

  unhold(order) {
    ORDER.get(this).unhold(order);
  }

  setTable(table) {
    if(this._currentTable) {
      this._currentTable.occupied = false;
    }
    this._currentTable = table;
    table.occupied = true;
  }

  serve() {
    this._currentTable.order = ORDER.get(this).serve();
    this._serves.push(this._currentTable);
    this._currentTable = null;
  }

  closeServe(serve) {
    ORDER.get(this).closeServe(serve.order);
    this._currentTable = serve;
  }

  // methods
}
