import angular from 'angular';
import 'angular-meteor';
import 'angular-route';
import 'angular-material';

// importing routers
import Router from './scripts/routes/routes';

// importing services
import Shift from './scripts/services/shift';
import Category from './scripts/services/categories';
import Item from './scripts/services/item';
import Order from './scripts/services/order';

// importing filters
import itemName from './scripts/filters/itemName';

// importing components;
import OrderComponent from './scripts/components/order/order';

let app = angular.module('register', [
  'angular-meteor',
  'ngMaterial',
  'ngRoute'
])
  .config(Router)
  .filter('itemName', itemName)
  .service('Shift', Shift)
  .service('Category', Category)
  .service('Item', Item)
  .service('Order', Order)
  .component('order', OrderComponent);

export default app;
