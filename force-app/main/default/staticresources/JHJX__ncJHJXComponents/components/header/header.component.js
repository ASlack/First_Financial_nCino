(function () {
	'use strict';
	angular.module('ncJHJXComponents').component('headerComponent', {
		controller: [
			'config',
			'label',
			'jhjxComponentsService',
			'$window',
			HeaderComponentController
		],

		templateUrl: 'header.partial.html',
		bindings: {
			header: '=',
			description: '='
		},
		controllerAs: 'vm'
	});

	function HeaderComponentController(config, label, jhjxComponentsService, $window) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = jhjxComponentsService;
	}
})();
