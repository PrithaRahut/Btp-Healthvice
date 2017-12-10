'use strict';

var fIndex = angular.module('index.factory', []);

fIndex.factory('indexFactory', [ function () {
  return {
    getJSON: function (callback) {
      callback({
        'index': {
          1: {
            'id': 1,
            'upvotes': 0,
            'downvotes': 0,
            'user_actions': {
              'voted': false               
            }
          },
        }
      });
    }
  };
}]);