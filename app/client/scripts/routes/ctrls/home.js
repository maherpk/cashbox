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
        LOCATION.get(this).path('/cats/');
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
      SHIFT.get(this).setCurrent(data);
      LOCATION.get(this).path('/cats/');

    }, (error) => {
      //console.log(error);
    });

    this._trigger = false;
  }

  forward() {
    console.log('here');
    LOCATION.get(this).path('/cats/');
  }
}