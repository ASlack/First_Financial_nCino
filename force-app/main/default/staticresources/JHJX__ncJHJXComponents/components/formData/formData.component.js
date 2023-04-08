(function () {
	'use strict';
	angular.module('ncJHJXComponents').component('formDataComponent', {
		controller: [
			'config',
			'label',
			'jhjxComponentsService',
			'$window',
			FormDataComponentController
		],
		controllerAs: 'vm',
		templateUrl: 'formData.partial.html',
		// Commented out for CORS issue
		//  templateUrl: ['config', function(config) {
		//      return config.get().listView;
		//  }]
		bindings: {
			header: '=',
			formData: '='
		}
	});

	function FormDataComponentController(config, label, jhjxComponentsService, $window) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = jhjxComponentsService;

		if (!vm.config.isDebugMode) console.log = function () {};

		console.log('formDataComponent init');

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
