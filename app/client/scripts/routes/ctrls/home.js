const SHIFT = new WeakMap();
const LOCATION = new WeakMap();

export default class HomeCtrl {
  constructor(Shift, $location) {
    'ngInject';

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
  startShift () {
    SHIFT.get(this).start().then((data) => {
      console.log(data);
      LOCATION.get(this).path('/cats/');
    }, (error) => {
      console.log(error);
    });
  }
}
