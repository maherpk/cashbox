const CAT = new WeakMap();
const ORDER = new WeakMap();
const LOCATION = new WeakMap();
const RouteParams = new WeakMap();

export default class CategoryListCtrl {
  constructor(Category, Order, $routeParams, $location) {
    'ngInject';

    CAT.set(this, Category);
    ORDER.set(this, Order);
    RouteParams.set(this, $routeParams);
    LOCATION.set(this, $location);

    this._items = [];

    this._init();
  }

  _init () {
    //console.log(ORDER.get(this));
    let id = RouteParams.get(this).catID;
    CAT.get(this).items(id).then(data => {
      this._items = data;
    });
  }

  addToOrder (itemID) {
    ORDER.get(this).addItem(itemID);
    LOCATION.get(this).path('/cats/');
  }
}
