angular.module('starter.controllers', ['ionic'])
 
.controller('AppCtrl', function($scope, $timeout) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});
  $scope.list = [];
}) 

.controller('IntroCtrl', function($scope, $timeout, $ionicLoading, $http, User) {
  ///retrieve data from database using Restful
  $scope.playerlist = $http.get('http://localhost/ElectiveThesisProject/productprice/').
    then(function(response) { 
      console.log(response);
      $scope.list = response.data;
    }, function(response) {
      console.log(response);
      // called asynchronously if an error occurs
      // or server returns response with an error status.
    });

  // Setup the loader
  $ionicLoading.show({
    templateUrl:'templates/intro.html',
    animation: 'fade-in',
    showBackdrop: false,
    maxWidth: 10,
    showDelay: 0
  });
  // Set a timeout to clear loader, however you would actually call the $ionicLoading.hide(); method whenever everything is ready or loaded.
  $timeout(function () {
    $ionicLoading.hide();
  }, 2000);
  
  

   $scope.addToFavorite = function(index) {
        $scope.inup=index;
        $scope.Name = $scope.list[index].name;
        $scope.Price = $scope.list[index].price;
        $scope.Image = $scope.list[index].imageURL;
        $scope.Unitofmeasure = $scope.list[index].unitofmeasure;    
    var Quantity = document.getElementById('Quantity').value;
    User.favorites.push({Image:$scope.Image,Name:$scope.Name,Price:$scope.Price,Quantity:Quantity,Unitofmeasure:$scope.Unitofmeasure});
  }
  })


.controller('BasketCtrl', function($scope,  User, $http) {

  $scope.favorites = User.favorites;
  $scope.removePlayer = User.removeFromFavorites;
  
  $scope.getTotal = function(){
    var total = 0;
    for(var i = 0; i < $scope.favorites.length; i++){
        var product = $scope.favorites[i];
        total += (product.Price * product.Quantity);
    }
    return total;
}
console.log( $scope.favorites);
})
 .controller('ReportsCtrl', ['$scope', function($scope) {

      $scope.sendTheMail = function() {
        // create a new instance of the Mandrill class with your API key
        var m = new mandrill.Mandrill('IHNhkCwvtG94atpLU836zA');
        // Collect Inputs
        
        var FirstName = document.getElementById('FirstName').value;
        var LastName = document.getElementById('LastName').value;
        var Email = document.getElementById('Email').value;
        var ContactNumber = document.getElementById('ContactNumber').value;
        var City = document.getElementById('City').value;
        var MarketName = document.getElementById('MarketName').value;
        var StallNumeber = document.getElementById('StallNumeber').value;
        var ProductName = document.getElementById('ProductName').value;
        var VendorsProductPrice = document.getElementById('VendorsProductPrice').value;
        var emailBody = "<strong>Client Information</strong><br>From: " + LastName +","+ FirstName + "<br>Contact Number: " + ContactNumber + "<br><br><strong>Vendor Information</strong><br>City: " + City + "<br>Market Name: " + MarketName + "<br>Stall Numeber: " + StallNumeber + "<br>Product Name: " + ProductName + "<br>Vendor's Product Price: " + VendorsProductPrice;

        var params = {

            "message": {
                "from_email":Email,
                "to":[{"email":"cheje.vallecera@must.edu.ph"}],
                "subject": "Price Today App Report Vendor",
                "html": emailBody
            }
        };

        m.messages.send(params);
      };

    }])


        .controller('MapCtrl', function($scope, $ionicLoading, $compile) {
          function initialize() {
            var myLatlng = new google.maps.LatLng(8.477805, 124.651426);
            
            var mapOptions = {
              center: myLatlng,
              zoom: 16,
              mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map"),
                mapOptions);
            
            //Marker + infowindow + angularjs compiled ng-click
            var contentString = "<div><a ng-click='clickTest()'>Click me!</a></div>";
            var compiled = $compile(contentString)($scope);

            var infowindow = new google.maps.InfoWindow({
              content: compiled[0]
            });

            var marker = new google.maps.Marker({
              position: myLatlng,
              map: map,
              title: 'Uluru (Ayers Rock)'
            });

            google.maps.event.addListener(marker, 'click', function() {
              infowindow.open(map,marker);
            });

            $scope.map = map;
          }
          google.maps.event.addDomListener(window, 'load', initialize);
          
          $scope.centerOnMe = function() {
            if(!$scope.map) {
              return;
            }

            $scope.loading = $ionicLoading.show({
              content: 'Getting current location...',
              showBackdrop: false
            });

            navigator.geolocation.getCurrentPosition(function(pos) {
              $scope.map.setCenter(new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude));
              $scope.loading.hide();
            }, function(error) {
              alert('Unable to get location: ' + error.message);
            });
          };
          
          $scope.clickTest = function() {
            alert('Example of infowindow with ng-click')
          };
          
        })
















.controller('Exit', function($scope, $stateParams) {
  ionic.Platform.ready(function(){
    // will execute when device is ready, or immediately if the device is already ready.
  });

  var deviceInformation = ionic.Platform.device();

  var isWebView = ionic.Platform.isWebView();
  var isIPad = ionic.Platform.isIPad();
  var isIOS = ionic.Platform.isIOS();
  var isAndroid = ionic.Platform.isAndroid();
  var isWindowsPhone = ionic.Platform.isWindowsPhone();

  var currentPlatform = ionic.Platform.platform();
  var currentPlatformVersion = ionic.Platform.version();

  ionic.Platform.exitApp(); // stops the app
})





.factory('User', function() {
  var play = { favorites: []
  }

  play.addToFavorites = function(item) {
    play.favorites.unshift(item);
  }
  play.removeFromFavorites = function(index) {
    play.favorites.splice(index, 1);
    }
    
  return play;
})

.service( "BasketService" , [
  function services ( ) {
    var listProduct=[];

    this.getItems = function getItems ( ) {
      return items;
    };    

    return this;
  }
] );
