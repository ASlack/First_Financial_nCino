(function () {
	'use strict';
	angular.module('ncJHJXComponents').component('tableComponent', {
		controller: [
			'config',
			'label',
			'jhjxComponentsService',
			'$window',
			DataTableComponentController
		],
		controllerAs: 'vm',
		templateUrl: 'dataTable.partial.html',
		// Commented out for CORS issue
		//  templateUrl: ['config', function(config) {
		//      return config.get().listView;
		//  }]
		bindings: {
			header: '=',
			tableData: '='
		}
	});

	function DataTableComponentController(config, label, jhjxComponentsService, $window) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = jhjxComponentsService;
		if (!vm.config.isDebugMode) console.log = function () {};

		console.log('DataTableComponentController init');

		vm.redirect = function (idToRedirectTo) {
			console.log('redirecting');
			var pathArray = location.href.split('/');
			var protocol = pathArray[0];
			var host = pathArray[2];
			var url = protocol + '//' + host;
			$window.open(url + '/' + idToRedirectTo);
		};
	}
})();
