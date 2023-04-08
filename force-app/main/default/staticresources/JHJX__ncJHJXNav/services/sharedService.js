(function () {
	'use strict';

	angular.module('ncJHJXNav').service('jhjxNavService', SharedService);

	SharedService.$inject = [
		'remotingManager',
		'config',
		'messageService',
		'jhjxService',
		'$window'
	];

	function SharedService(remotingManager, config, messageService, jhjxService, $window) {
		var vm = this;

		vm.config = config.get();
		if (!vm.config.isDebugMode) console.log = function () {};

		vm.service = {
			percentage: 0,
			listCounter: 0,
			currentPage: 0,
			currentNav: 0,
			pageArray: [0, 1, 2],
			initPercentage: initPercentage,
			getPercentChange: getPercentChange,
			incrementCount: incrementCount,
			finishBookToCore: finishBookToCore,
			reservedLoanNumber: false,
			canReserveLoanNumber: false
		};
		console.log('reserveLoanButtonEnabled  ' + vm.config.reserveLoanButtonConfigEnabled);
		vm.service.canReserveLoanNumber = vm.config.reserveLoanButtonConfigEnabled;
		if (vm.service.canReserveLoanNumber) {
			vm.service.currentNav = 1;
		}
		if (vm.config.loanNumber != '') {
			console.log('vm.config.loanNumber ' + vm.config.loanNumber);
			vm.service.reservedLoanNumber = true;
		}

		return vm.service;

		function initPercentage() {
			console.log('initPercentage');
			console.log('vm.service.listCounter ' + vm.service.listCounter);

			if (vm.service.canReserveLoanNumber) {
				console.log('(1/(vm.service.listCounter)) ' + getPercentChange());
				vm.service.percentage = getPercentChange();
				console.log('vm.service.percentage ' + vm.service.percentage);
			} else {
				vm.service.percentage = 0;
			}
		}

		function getPercentChange() {
			console.log('getPercentChange ' + (1 / (vm.service.listCounter - 1)) * 100);
			return (1 / (vm.service.listCounter - 1)) * 100;
		}

		function incrementCount() {
			console.log('vm.service.listCounter before ' + vm.service.listCounter);
			vm.service.listCounter = vm.service.listCounter + 1;
			console.log('vm.service.listCounter after ' + vm.service.listCounter);
		}

		function finishBookToCore() {
			vm.service.currentNav++;
			var percentage = vm.service.currentNav * vm.service.getPercentChange();
			console.log('percentage ' + percentage);
			if (percentage <= 100) vm.service.percentage = percentage;
			var summaryTab = document.getElementById('tab-default-2__item');
			summaryTab.click();
		}
	}
})();
