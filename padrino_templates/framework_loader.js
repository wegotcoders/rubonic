document.addEventListener('DOMContentLoaded', function() {

  // Initialize your app
  var myApp = new Framework7();

  // Export selectors engine
  var $$ = Dom7;

  // Add view
  // NOTE: In this example '.view-main' needs to exist in the dom or you will get
  // an 'f7view undefined' error in the console
  var mainView = myApp.addView('.view-main', {
      // Because we use fixed-through navbar we can enable dynamic navbar
      dynamicNavbar: true
  });

});