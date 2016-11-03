const SHIFT = new WeakMap();
const LOCATION = new WeakMap();

export default class HomeCtrl {
  constructor(Shift, $location) {
    'ngInject';

    SHIFT.set(this, Shift);
    LOCATION.set(this, $location);
  }

  // methods
  startShift () {
    console.log('I am starting shift');
    // SHIFT.get(this).all().then(data => {
    //   console.log(data);
    // });
    SHIFT.get(this).start().then((data) => {
      console.log(data);
      LOCATION.get(this).path('/cats/');
    });
  }
}
