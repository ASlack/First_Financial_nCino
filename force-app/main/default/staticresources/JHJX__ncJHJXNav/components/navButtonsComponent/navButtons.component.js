(function () {
	'use strict';
	angular.module('ncJHJXNav').component('jhjxNavButtonsComponent', {
		controller: ['config', 'label', 'jhjxNavService', 'jhjxService', '$scope', NavViewController],
		controllerAs: 'vm',
		templateUrl: 'jhjxNavButtons_html'
		// Commented out for CORS issue
		//  templateUrl: ['config', function(config) {
		//      return config.get().listView;
		//  }]
	});

	function NavViewController(config, label, jhjxNavService, jhjxService, $scope) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = jhjxNavService;
		vm.jhjxService = jhjxService;

		if (!vm.config.isDebugMode) console.log = function () {};

		console.log('jhjxNavButtonsComponent init ');

		vm.openModal = function () {
			console.log('toggling modal');
			if (vm.config.bookToCoreModalEnabled) {
				vm.jhjxService.modalOpen = true;
			} else {
				if (vm.config.bookToCoreButtonEnabled) vm.jhjxService.initiateBooking();
				if (vm.config.renewLoanButtonEnabled) vm.jhjxService.initiateRenewal();
				if (vm.config.modifyLoanButtonEnabled) vm.jhjxService.initiateModification();
			}
		};

		vm.next = function () {
			console.log('next');
			vm.sharedService.currentPage++;
			vm.sharedService.currentNav++;

			var percentage = vm.sharedService.currentNav * vm.sharedService.getPercentChange();
			console.log('percentage ' + percentage);
			if (percentage <= 100) vm.sharedService.percentage = percentage;
		};

		vm.prev = function () {
			console.log('prev');
			vm.sharedService.currentPage--;
			vm.sharedService.currentNav--;

			vm.sharedService.percentage =
				vm.sharedService.currentNav * vm.sharedService.getPercentChange();
		};

		$scope.$watch(
			function () {
				return vm.config.loanState;
			},
			function (newVal, oldVal) {
				console.log('loanState changed from ' + oldVal + ' to ' + newVal);
				//reset nav legend after rebooking
				if (
					newVal == 'Booking' &&
					vm.config.isBooking &&
					(oldVal == 'Error' ||
						oldVal == 'PartialBooked' ||
						oldVal == 'Booked' ||
						oldVal == 'IsModifying' ||
						oldVal == 'IsRenewing')
				) {
					//vm.prev();
				}
			}
		);
	}
})();
