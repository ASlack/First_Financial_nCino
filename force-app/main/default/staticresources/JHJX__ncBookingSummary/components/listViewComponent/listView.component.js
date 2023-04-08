(function () {
	'use strict';
	angular.module('ncBookingSummary').component('bookingSummaryComponent', {
		controller: ['config', 'label', 'bookingSummaryService', '$window', ListViewController],
		controllerAs: 'bookingSummaryCtrl',
		templateUrl: 'BookingSummary_html'
		// Commented out for CORS issue
		//  templateUrl: ['config', function(config) {
		//      return config.get().listView;
		//  }]
	});

	function ListViewController(config, label, bookingSummaryService, $window) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = bookingSummaryService;

		if (!vm.config.isDebugMode) console.log = function () {};

		vm.redirect = function (idToRedirectTo) {
			console.log('redirecting');
			var pathArray = location.href.split('/');
			var protocol = pathArray[0];
			var host = pathArray[2];
			var url = protocol + '//' + host;

			$window.open(url + '/' + idToRedirectTo);
		};

		return vm;
	}
})();
