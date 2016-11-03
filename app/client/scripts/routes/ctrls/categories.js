const CAT = new WeakMap();

export default class CategoryCtrl {
  constructor(Category) {
    'ngInject';

    CAT.set(this, Category);

    // controls
    this._addingNew = false;
    this._cat = {
      name: ''
    };

    this.allCats = [];

    // start
    //
    this._init_();
  }

  all () {
    CAT.get(this).all().then(data => {
      this.allCats = data;
    });
  }

  addNew (obj) {
    CAT.get(this).add(obj).then(data => {
      this.allCats.push(data);
      this._cat = {
        name: ''
      };
      this._addingNew = false;
    });
  }

  edit (catId, name) {

  }

  setForm () {
    this._addingNew = true;
  }

  disableForm () {
    this._addingNew = false;
  }

  _init_ () {
    this.all();
  }
}
