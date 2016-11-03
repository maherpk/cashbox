'use strict';

// importing controllers
import HomeCtrl from './ctrls/home';
import CategoryCtrl from './ctrls/categories';

// importing templates
import homeTpl from './html/home.html';
import catTpl from './html/categories.html';

export default function Router($routeProvider) {
  'ngInject';

  $routeProvider.when('/', {
    templateUrl: homeTpl,
    controller: HomeCtrl,
    controllerAs: '$routeCtrl'
  })
    .when('/cats/', {
      templateUrl: catTpl,
      controller: CategoryCtrl,
      controllerAs: '$routeCtrl'
    });
};
