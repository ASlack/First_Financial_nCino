(function () {
	'use strict';

	angular.module('ncJHJXNav').controller('jhjxNavController', JHJXNavController);

	JHJXNavController.$inject = [
		'label',
		'config',
		'jhjxNavService',
		'messageService',
		'jhjxService',
		'$scope'
	];

	function JHJXNavController(label, config, jhjxNavService, messageService, jhjxService, $scope) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = jhjxNavService;

		if (!vm.config.isDebugMode) console.log = function () {};

		$scope.foundUpdates = function (data) {
			console.log('found updates ' + data);
			jhjxService.processPushTopicUpdate(data);
			$scope.$apply();
		};
		$scope.foundErrors = function (data) {
			console.log('found errors ' + data);
		};
		$scope.$watch(
			function () {
				return vm.config.loanState;
			},
			function (newVal, oldVal) {
				console.log('loanState changed from ' + oldVal + ' to ' + newVal);

				if (vm.config.isBooking == true && (oldVal == 'Booking' || newVal == 'Error')) {
					//   console.log('finished book to core');
					jhjxNavService.finishBookToCore();
				}
			}
		);
	}
})();
