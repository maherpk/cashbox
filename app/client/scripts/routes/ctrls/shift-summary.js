import _ from 'lodash';

const SHIFT = new WeakMap();
const LOCATION = new WeakMap();
const TRANSACTION = new WeakMap();

export default class ShiftSummaryCtrl {
  constructor (Shift, $location, Transaction) {
    'ngInject';

    SHIFT.set(this, Shift);
    LOCATION.set(this, $location);
    TRANSACTION.set(this, Transaction);
    
    this._transactions = [];
    this._totalCash = 0;
    this._totalCard = 0;

    this._init();
  }

  _init() {

  	this._currentShift = SHIFT.get(this).current();

  	SHIFT.get(this).allTransactions().then(r => {
      //console.log(r);
      this._transactions = r;
      this._shiftTotal(r);
    });
  }

  _transactionItems(trans) {
  	let transBook = {};
  	angular.forEach(trans, (t) => {
  		transBook['transaction'] = t;
  		TRANSACTION.get(this).getLineItems(t.id).then(r => {
  			transBook['items'] = r;
  		});
  		this._transactions.push(transBook);
  	});
  }

  _shiftTotal(transactions) {
    console.log(transactions);
    angular.forEach(transactions, (singleton) =>{
      if (singleton.properties.transaction_type=="cash") {
        this._totalCash += parseFloat(singleton.properties.total);
      } else if (singleton.properties.transaction_type=="card") {
        this._totalCard += parseFloat(singleton.properties.total);
      }
    });
  }

  endShift() {
  	SHIFT.get(this).end();
  	LOCATION.get(this).path('/');
  }

  cancel() {
    LOCATION.get(this).path('/');
  }
}
