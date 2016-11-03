import angular from 'angular';
import 'angular-meteor';
import 'angular-route';
import 'angular-material';

// importing routers
import Router from './scripts/routes/routes';

// importing services
import Shift from './scripts/services/shift';
import Category from './scripts/services/categories';

// importing components;
import inventoryListComponent from './scripts/components/inventory/list-component';

let app = angular.module('register', [
  'angular-meteor',
  'ngMaterial',
  'ngRoute'
])
  .config(Router)
  .service('Shift', Shift)
  .service('Category', Category)
  .component('inventoryList', inventoryListComponent);

export default app;
