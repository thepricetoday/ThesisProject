// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);

    }
    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleDefault();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {
  $stateProvider

    .state('app', {
    url: '/app',
    abstract: true,
    templateUrl: 'templates/menu.html',
    controller: 'AppCtrl'
  })

/**index**/
.state('app.products', {
      url: '/products',
      views: {
        'menuContent': {
          templateUrl: 'templates/products.html',
          controller: 'IntroCtrl'
        }
      }
    })
.state('app.basket', {
      url: '/basket',
      views: {
        'menuContent': {
          templateUrl: 'templates/basket.html',
          controller: 'BasketCtrl'
        }
      }
    })
/**menu***/
  .state('app.exit', {
      url: '/exit',
      views: {
        'menuContent': {
          templateUrl: '/',
          controller: 'Exit'
        }
      }
    })
    .state('app.report', {
      url: '/report',
      views: {
        'menuContent': {
          templateUrl: 'templates/report.html',
          controller: 'ReportsCtrl'
        }
      }
    })
.state('app.single3', {
    url: '/report/3',
    views: {
      'menuContent': {
        templateUrl: 'templates/ThankyouMsg.html',
        controller: 'ReportsCtrl'
      }
    }
  }) 
.state('app.maps', {
      url: '/maps',
      views: {
        'menuContent': {
          templateUrl: 'templates/map.html',
        controller: 'MapCtrl'

          
        }
      }
    })
;
  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/app/products');
});
