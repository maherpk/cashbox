const CAT = new WeakMap();
const ORDER = new WeakMap();
const RouteParams = new WeakMap();

export default class CategoryListCtrl {
  constructor(Category, Order, $routeParams) {
    'ngInject';

    CAT.set(this, Category);
    ORDER.set(this, Order);
    RouteParams.set(this, $routeParams);


    this._items = [];


    this._init();
  }

  _init () {
    console.log(ORDER.get(this));
    let id = RouteParams.get(this).catID;
    CAT.get(this).items(id).then(data => {
      this._items = data;
    });
  }

  addToOrder (itemID) {
    ORDER.get(this).addItem(itemID);
    console.log(ORDER.get(this).order());
  }

  removeFromOrder (itemID) {
    ORDER.get(this).removeItem(itemID);
  }
}
