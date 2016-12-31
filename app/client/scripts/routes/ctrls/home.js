const SHIFT = new WeakMap();
const LOCATION = new WeakMap();

export default class HomeCtrl {
  constructor(Shift, $location, $mdDialog) {
    'ngInject';

    this._trigger = false;

    SHIFT.set(this, Shift);
    LOCATION.set(this, $location);

    Shift.latest().then(shift => {
      if (!shift.ended_at) {
        Shift.setCurrent(shift);
        $location.path('/cats/');
      }
    });
  }

  // methods
  startShift() {
    this._trigger = true;
  }

  setPassword() {
    let obj = {
      password: this._password
    }

    SHIFT.get(this).start(obj).then((data) => {
    //console.log(data);
    LOCATION.get(this).path('/cats/');
    }, (error) => {
      //console.log(error);
    });

    this._trigger = false;
  }
}