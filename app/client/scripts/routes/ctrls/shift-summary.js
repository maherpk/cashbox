const SHIFT = new WeakMap();

export default class ShiftSummaryCtrl {
  constructor (Shift) {
    'ngInject';
    SHIFT.set(this, Shift);
  }
}
