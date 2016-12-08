const SHIFT = new WeakMap();
const LOCATION = new WeakMap();

export default class HomeCtrl {
  constructor(Shift, $location, $mdDialog) {
    'ngInject';

    SHIFT.set(this, Shift);
    LOCATION.set(this, $location);
    Shift.checkPrinter().then(r => {
      if (r.status == false) {
        $mdDialog.show(
          $mdDialog.alert()
          .parent(angular.element(document.querySelector('#popupContainer')))
          .clickOutsideToClose(true)
          .title('Check Printer !')
          .textContent('Printer is not turned on, or cable is unplugged.')
          .ariaLabel('Check Printer')
          .ok('Try Again!')
        ).then(function() {
          $location.path('/');
        });
      }
    }, e => {
      //console.log(e);
    });

    Shift.latest().then(shift => {
      if (!shift.ended_at) {
        Shift.setCurrent(shift);
        $location.path('/cats/');
      }
    });
  }

  // methods
  startShift() {
    SHIFT.get(this).start().then((data) => {
      //console.log(data);
      LOCATION.get(this).path('/cats/');
    }, (error) => {
      //console.log(error);
    });
  }
}