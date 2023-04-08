(function(){
	'use strict';

	angular.module('ncAncillaryProducts').controller('ancProductsController', AncProductsController);

	AncProductsController.$inject = ['label', 'config', 'ancillaryProductsService', '$scope', '$window'];

	function AncProductsController(label, config, ancillaryProductsService, $scope, $window){
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = ancillaryProductsService;
		vm.someVar = vm.sharedService.someVar;

        console.log(' ancillaryProductsService somevar ' + vm.sharedService.somevar);


	}
})();