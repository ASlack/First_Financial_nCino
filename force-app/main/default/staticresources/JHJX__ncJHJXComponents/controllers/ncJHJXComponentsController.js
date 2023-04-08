(function () {
	'use strict';

	angular.module('ncJHJXComponents').controller('componentsController', ComponentsController);

	ComponentsController.$inject = ['label', 'config', 'jhjxComponentsService', '$scope', '$window'];

	function ComponentsController(label, config, jhjxComponentsService, $scope, $window) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = jhjxComponentsService;
	}
})();
