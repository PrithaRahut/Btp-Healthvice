'use strict';

var index = angular.module('app.index', ['index.factory']);

index.controller('indexController', ['indexFactory', function (indexFactory) {

    var data = this;

    data.functions = {
      getFeed: function () {
        indexFactory.getJSON(function (response) {
          data.feed = response.index;
        });
      }
    };

    this.functions.getFeed();
    
    this.upvote = function(e) { e.upvotes++; console.log('in this.upvote');};
    
    this.downvote = function(e) { e.downvotes--};
  }

]);

index.directive('cardInteractions', [ function () {
  return {
    restrict: 'E' 
  };
}]);