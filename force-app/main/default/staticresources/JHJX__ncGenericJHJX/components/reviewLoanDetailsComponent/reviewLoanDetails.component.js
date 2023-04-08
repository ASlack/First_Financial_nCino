(function () {
	'use strict';
	angular.module('ncGenericJHJX').component('reviewLoanDetails', {
		controllerAs: 'vm',
		controller: function (
			config,
			label,
			remotingManager,
			jhjxService,
			messageService,
			ui,
			bookingSummaryService,
			$scope,
			$window
		) {
			var vm = this;

			vm.config = config.get();
			vm.labels = label.getLabels();
			vm.picklistList = [];
			vm.sharedService = jhjxService;

			if (!vm.config.isDebugMode) console.log = function () {};

			console.log('reviewLoanDetails init' + JSON.stringify(vm.config.picklistArray));

			vm.$onInit = function () {
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

			vm.redirect = function (idToRedirectTo) {
				console.log('redirecting');
				var pathArray = location.href.split('/');
				var protocol = pathArray[0];
				var host = pathArray[2];
				var url = protocol + '//' + host;
				$window.open(url + '/' + idToRedirectTo);
			};
		},
		templateUrl: 'reviewLoanDetails.partial.html'
	});
})();
