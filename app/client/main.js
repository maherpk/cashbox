import angular from 'angular';
import 'angular-meteor';
import 'angular-route';
import 'angular-material';

// importing routers
import Router from './scripts/routes/routes';

// importing services
import Shift from './scripts/services/shift';
import Category from './scripts/services/categories';
import Discount from './scripts/services/discount';
import Item from './scripts/services/item';
import Order from './scripts/services/order';
import Transaction from './scripts/services/transaction';
import Setting from './scripts/services/setting';

// importing filters
import itemName from './scripts/filters/itemName';
import itemPrice from './scripts/filters/itemPrice';

// importing components;
import OrderComponent from './scripts/components/order/order';

let app = angular.module('register', [
  'angular-meteor',
  'ngMaterial',
  'ngRoute'
])
  .config(Router)
  .filter('itemName', itemName)
  .filter('itemPrice', itemPrice)
  .service('Shift', Shift)
  .service('Category', Category)
  .service('Discount', Discount)
  .service('Item', Item)
  .service('Order', Order)
  .service('Transaction', Transaction)
  .service('Setting', Setting)
  .component('order', OrderComponent)
  .run(($rootScope, $location, Shift) => {
    'ngInject';

    $rootScope.$on('$routeChangeStart', (event, next, current) => {
      if (next && !Shift.current()) {
        //event.preventDefault();
        $location.path('/');
      }
    });
  });

export default app;
