import _ from 'lodash';

const SHIFT = new WeakMap();
const LOCATION = new WeakMap();
const TRANSACTION = new WeakMap();
const ITEM = new WeakMap();

export default class ShiftSummaryCtrl {
  constructor (Shift, $location, Transaction, $mdDialog, Item) {
    'ngInject';

    ITEM.set(this, Item);
    SHIFT.set(this, Shift);
    LOCATION.set(this, $location);
    TRANSACTION.set(this, Transaction);
    
    this._transactions = [];
    this._items = [];
    this._totalCash = 0;
    this._totalCard = 0;
    this._selectedPurchaseItems = [];
    this._selectedPurchase = {};
    this._transactionsIds = [];
    this._shiftItems = [];

    this._init();
  }

  _init() {

  	this._currentShift = SHIFT.get(this).current();

  	SHIFT.get(this).allTransactions().then(r => {
      //console.log(r);
      this._transactions = r;
      this._shiftTotal(r);
    });

    SHIFT.get(this).shiftTransactions().then(r => {
      angular.forEach(r, (singleton) => {
        this._transactionsIds.push(singleton.id);
      });
    });

    ITEM.get(this).all().then(r => {
      this._items = r;
    });

    
  }

  _transactionItems(trans) {
  	let transBook = {};
  		TRANSACTION.get(this).getLineItems(t.id).then(r => {
  			transBook['items'] = r;
  		});
  		this._transactions.push(transBook);

    return transBook;
  }

  _shiftTotal(transactions) {
    //console.log(transactions);
    angular.forEach(transactions, (singleton) =>{
      if (singleton.properties.transaction_type=="cash") {
        this._totalCash += this.calculate(singleton.properties);
      } else if (singleton.properties.transaction_type=="card") {
        this._totalCard += this.calculate(singleton.properties);
      }
    });
  }

  transactionDetail(trans) {
    this._selectedPurchase = _.clone(trans);
    TRANSACTION.get(this).getLineItems(trans.id).then(r => {
      this._purchase = _.clone(r);
    });
  }

  endShift() {
  	SHIFT.get(this).end();
  	LOCATION.get(this).path('/');
  }

  cancel() {
    LOCATION.get(this).path('/');
  }

  generateSlip() {
    let data = {};
    data.cash = this._totalCash;
    data.card = this._totalCard;
    // SHIFT.get(this).printSummary(data).then(r => {
    //   console.log(r);
    // });

    SHIFT.get(this).shiftItems(this._transactionsIds).then(r => {
      let itemized = this.itemNames(r);
      console.log(itemized);
    });
  }

  itemNames (array) {
    let items = []
    console.log(array);
    let namedItems = [];
    namedItems = _.map(array, (value) => {
      let idx = _.findIndex(this._items, {id: parseInt(value.item_id)});
      value.name = (idx > -1) ? this._items[idx].name : '';
      value.unitPrice = (idx > -1) ? this._items[idx].price : '';
      value.quantity = parseInt(value.quantity);
      return value;
    });

    console.log(namedItems);

    let groups = _.groupBy(namedItems, (v) => {
      return v.name;
    });

    let smry = []; 
    _.forEach(groups, (k)=> {
      let q = _.reduce(k, (sm, n) => {
        console.log(sm);
        console.log(n);
        return sm + n.quanity;
      }, 0);

      smry.push({
        name: k.name,
        quanity: q
      });
    });
    console.log(smry);
    console.log(groups);
  }

  calculate(props) {
    let total = props.total;
    let discount = 0;
    if ('discount' in props) {
      discount = props.discount;
    }
    return Math.round(parseFloat(total) - parseFloat(discount));
  }


}
