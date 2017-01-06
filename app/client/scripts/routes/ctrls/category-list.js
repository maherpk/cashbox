const CAT = new WeakMap();
const ORDER = new WeakMap();
const LOCATION = new WeakMap();
const RouteParams = new WeakMap();
const ITEM = new WeakMap();

export default class CategoryListCtrl {
  constructor(Category, Order, Item, $routeParams, $location) {
    'ngInject';

    CAT.set(this, Category);
    ORDER.set(this, Order);
    RouteParams.set(this, $routeParams);
    LOCATION.set(this, $location);
    ITEM.set(this, Item);

    this._items = [];

    this._init();
  }

  _init () {
    //console.log(ORDER.get(this));
    let id = RouteParams.get(this).catID;
    ITEM.get(this).items(id).then(data => {
      this._items = data;
    });
  }

  addToOrder (itemID) {
    ORDER.get(this).addItem(itemID);
    LOCATION.get(this).path('/cats/');
  }
}
