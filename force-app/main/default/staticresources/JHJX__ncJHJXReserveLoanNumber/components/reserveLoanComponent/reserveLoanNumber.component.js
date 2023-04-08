(function () {
	'use strict';
	angular.module('ncJHJXReserveLoanNumber').component('reserveLoanNumber', {
		controllerAs: 'vm',
		controller: function (
			config,
			label,
			remotingManager,
			reserveLoanNumberService,
			messageService,
			ui,
			bookingSummaryService,
			$scope,
			$window
		) {
			var vm = this;

			vm.config = config.get();

			vm.labels = label.getLabels();
			vm.sharedService = reserveLoanNumberService;

			if (!vm.config.isDebugMode) console.log = function () {};
			console.log('reserveLoanNumber init');

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

				var tempReqHistoryArr = [];
				console.log(
					'vm.labels.ABJX_Reserve_Loan_Number ' +
						vm.labels.ABJX_TABLE_ACTION_LOANRESERVE_COMPLETE
				);
				for (var i = 0; i < vm.config.requestHistory.length; i++) {
					console.log(
						'vm.config.requestHistory[i].action ' + vm.config.requestHistory[i].action
					);
					console.log(
						'vm.config.requestHistory[i].status ' + vm.config.requestHistory[i].status
					);
					if (
						vm.config.requestHistory[i].action ==
						vm.labels.ABJX_TABLE_ACTION_LOANRESERVE_COMPLETE
					) {
						tempReqHistoryArr.push(vm.config.requestHistory[i]);
					}
				}
				vm.config.requestHistory = tempReqHistoryArr;
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
		templateUrl: 'reserveLoanNumber.partial.html'
	});
})();
