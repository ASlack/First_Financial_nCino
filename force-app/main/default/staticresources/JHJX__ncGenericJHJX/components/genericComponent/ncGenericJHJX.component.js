(function () {
	'use strict';
	angular.module('ncGenericJHJX').component('genericJHJX', {
		controllerAs: 'vm',
		controller: function (
			config,
			label,
			remotingManager,
			jhjxService,
			messageService,
			ui,
			bookingSummaryService
		) {
			var vm = this;

			vm.config = config.get();
			vm.labels = label.getLabels();
			vm.sharedService = jhjxService;
			if (!vm.config.isDebugMode) console.log = function () {};

			console.log('genericJHJX init');

			vm.$onInit = function () {
				console.log('state is ' + vm.config.loanState);
				if (
					vm.config.requestHistory.length > 0 &&
					vm.config.requestHistory[0].action == vm.labels.ABJX_Reserving_Loan_Number
				) {
					vm.sharedService.toggleSpinner(true, vm.labels.ABJX_Reserving_Loan_Number);
				} else if (
					vm.config.requestHistory.length > 0 &&
					vm.config.requestHistory[0].action == vm.labels.ABJX_Booking_To_Core
				) {
					vm.sharedService.toggleSpinner(true, vm.labels.ABJX_Booking_To_Core);
				} else if (
					vm.config.requestHistory.length > 0 &&
					vm.config.requestHistory[0].action == vm.labels.ABJX_Renewing_To_Core
				) {
					vm.sharedService.toggleSpinner(true, vm.labels.ABJX_Renewing_To_Core);
				} else if (
					vm.config.requestHistory.length > 0 &&
					vm.config.requestHistory[0].action == vm.labels.ABJX_Modifying_To_Core
				) {
					vm.sharedService.toggleSpinner(true, vm.labels.ABJX_Modifying_To_Core);
				} else {
					vm.sharedService.toggleSpinner(false, null);
				}

				if (
					vm.config.reserveLoanButtonEnabled === true &&
					vm.config.bookToCoreButtonEnabled === true
				) {
					vm.config.previewType = 'loanmessage';
				} else if (vm.config.bookToCoreButtonEnabled === true) {
					vm.config.previewType = 'loanmessage';
				} else if (vm.config.reserveLoanButtonEnabled === true) {
					vm.config.previewType = 'reservationmessage';
				} else {
					vm.config.previewType = 'loanmessage';
				}
			};
		},
		templateUrl: 'GenericJHJX.partial.html'
	});
})();
