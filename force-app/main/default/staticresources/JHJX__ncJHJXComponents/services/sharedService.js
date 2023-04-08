(function () {
	'use strict';

	angular.module('ncJHJXComponents').service('jhjxComponentsService', SharedService);

	SharedService.$inject = ['remotingManager', 'config', 'messageService', '$window'];

	function SharedService(remotingManager, config, messageService, $window) {
		var vm = this;

		vm.config = config.get();

		vm.service = {};

		return vm.service;
	}
})();
