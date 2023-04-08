(function () {
	'use strict';
	angular.module('ncJHJXComponents').component('bookingStatusTableComponent', {
		controller: [
			'config',
			'label',
			'jhjxComponentsService',
			'$scope',
			BookingStatusTableComponentController
		],
		controllerAs: 'vm',
		templateUrl: 'bookingStatusTable.partial.html',
		// Commented out for CORS issue
		//  templateUrl: ['config', function(config) {
		//      return config.get().listView;
		//  }]
		bindings: {
			header: '=',
			statusHeader: '=',
			datetimeHeader: '=',
			actionHeader: '=',
			emptyDataLabel: '=',
			bookingStatusData: '='
		}
	});

	function BookingStatusTableComponentController(config, label, jhjxComponentsService, $scope) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = jhjxComponentsService;
	}
})();
