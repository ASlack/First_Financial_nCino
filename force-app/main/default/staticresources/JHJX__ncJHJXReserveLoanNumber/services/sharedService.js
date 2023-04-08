(function () {
	'use strict';

	angular.module('ncJHJXReserveLoanNumber').service('reserveLoanNumberService', SharedService);

	SharedService.$inject = [
		'remotingManager',
		'config',
		'label',
		'messageService',
		'bookingSummaryService',
		'$window'
	];

	function SharedService(
		remotingManager,
		config,
		label,
		messageService,
		bookingSummaryService,
		$window
	) {
		var vm = this;

		vm.config = config.get();
		vm.labels = label.getLabels();

		if (!vm.config.isDebugMode) console.log = function () {};

		vm.bookingSummaryService = bookingSummaryService;

		vm.service = {
			initiateReservation: initiateReservation,
			processPushTopicUpdate: processPushTopicUpdate,
			getRequestIndex: getRequestIndex,
			toggleSpinner: toggleSpinner,
			getButtonStatuses: getButtonStatuses,
			getBookingDataLiteList: getBookingDataLiteList,
			bookingDataLite: [],
			showSpinner: false,
			spinnerMessage: ''
		};

		populateBookingDataLiteList();

		return vm.service;

		function initiateReservation() {
			console.log('initiateReservation');
			toggleSpinner(true, vm.labels.ABJX_Reserving_Loan_Number);
			remotingManager.invokeAction(
				vm.config.initiateReservationAction,
				vm.config.objectId,
				function (result, event) {
					console.log('initiateReservation ' + JSON.stringify(result));
					if (event.status) {
						console.log('event.status ' + event.status);
						vm.config.requestHistory.splice(0, 0, {
							action: vm.labels.ABJX_Reserve_Loan_Number,
							status: vm.labels.ABJX_In_Progress,
							requestDate: result
						});
					} else {
						console.log('setting error from initiateReservation');
						toggleSpinner(false, null);
						messageService.setMessage(
							{
								type: messageService.messageTypes.error,
								text: event.message
							},
							true
						);
					}
				},
				{ escape: false }
			);
		}

		function processPushTopicUpdate(message) {
			console.log('(vm.config.objectId ' + vm.config.objectId);
			if (message != null) {
				try {
					message = JSON.parse(message);
				} catch (err) {
					console.log('processPushTopicUpdate failed to parse: ' + err.message);
					messageService.setMessage({
						type: messageService.messageTypes.error,
						text: 'processPushTopicUpdate failed to parse: ' + err.message
					});
				}
			}
			console.log('message ' + JSON.stringify(message));
			if (vm.config.objectId == message.nFUSE__Primary_Object_Id__c) {
				console.log('are equal');
				var reqIndex = getRequestIndex(message.nFUSE__External_Id__c);
				remotingManager.invokeAction(
					vm.config.getTransactionLog,
					message.nFUSE__External_Id__c,
					function (result, event) {
						console.log('result is ' + JSON.stringify(result));
						if (event.status) {
							var transLog = result;
							if (transLog != null) {
								if (
									reqIndex == 0 &&
									message.nFUSE__Vendor_Status__c != vm.labels.ABJX_In_Progress
								) {
									if (
										message.nFUSE__Vendor_Status__c ==
											vm.labels.ABJX_LoanNumberReservedICRT ||
										message.nFUSE__Vendor_Status__c == vm.labels.ABJX_LoanBookedICRT ||
										message.nFUSE__Vendor_Status__c == vm.labels.ABJX_LoanRenewedICRT ||
										message.nFUSE__Vendor_Status__c == vm.labels.ABJX_LoanModified
									) {
										if (
											message.nFUSE__Vendor_Status__c !=
											vm.labels.ABJX_LoanNumberReservedICRT
										) {
											toggleSpinner(false, null);
											getButtonStatuses();
											console.log('stopping spinner ' + message.nFUSE__Vendor_Status__c);
										} else {
											console.log('refreshing loan reserved bookign data');
											getBookingDataLiteList();
										}
									} else if (transLog.errorMessage != null) {
										console.log('setting error from processPushTopicUpdate');
										messageService.setMessage(
											{
												type: messageService.messageTypes.error,
												text: transLog.errorMessage
											},
											true
										);
										toggleSpinner(false, null);
									} else if (transLog.status == 'MiddlewareFailure') {
										console.log('failure from middleware');
										//todo: message for when middleware fails
										messageService.setMessage(
											{
												type: messageService.messageTypes.error,
												text: 'MIDDLEWARE FAILED'
											},
											true
										);
										toggleSpinner(false, null);
									}
								}
								vm.config.requestHistory.splice(reqIndex, 1, transLog);
							}
						}
					},
					{ escape: false }
				);
			}
		}

		function getButtonStatuses() {
			console.log('getButtonStatuses ');
			remotingManager.invokeAction(
				vm.config.getButtonStatuses,
				vm.config.objectId,
				function (result, event) {
					console.log('getButtonStatuses result ' + JSON.stringify(result));
					if (event.status) {
						var newButtonStatuses;
						try {
							newButtonStatuses = JSON.parse(result);
						} catch (err) {
							console.log('newButtonStatuses failed to parse:  ' + err.message);
							messageService.setMessage({
								type: messageService.messageTypes.error,
								text: 'newButtonStatuses failed to parse: ' + err.message
							});

							toggleSpinner(false, null);
							return;
						}

						vm.config.reserveLoanButtonEnabled = newButtonStatuses.reserveLoanButtonEnabled;
						vm.config.bookToCoreButtonEnabled = newButtonStatuses.bookToCoreButtonEnabled;
						vm.config.modifyLoanButtonEnabled = newButtonStatuses.modifyLoanButtonEnabled;
						vm.config.renewLoanButtonEnabled = newButtonStatuses.renewLoanButtonEnabled;
						//clear the reservation message
						vm.config.bookingdatapreview = null;
						vm.config.bookingdatapreviewastext = '{}';
						//reset view
						if (document.getElementById('datapreview1') != null)
							document.getElementById('datapreview1').style.display = 'none';

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

						toggleSpinner(false, null);
					} else {
						console.log('setting error from getButtonStatuses');
						messageService.setMessage(
							{
								type: messageService.messageTypes.error,
								text: event.message
							},
							true
						);
						toggleSpinner(false, null);
					}
				},
				{ escape: false }
			);
		}

		function getBookingDataLiteList() {
			remotingManager.invokeAction(
				vm.config.getBookingDataLiteList,
				vm.config.objectId,
				function (result, event) {
					if (event.status) {
						console.log('getBookingDataLiteList ' + JSON.stringify(result));
						console.log(
							'vm.config.bookingDataLite before ' + JSON.stringify(vm.config.bookingDataLite)
						);
						vm.config.bookingDataLite = result;
						toggleSpinner(false, null);
						console.log('stopping spinner from getBookingDataLiteList');
						populateBookingDataLiteList();
					} else {
						toggleSpinner(false, null);
						messageService.setMessage(
							{
								type: messageService.messageTypes.error,
								text: event.message
							},
							true
						);
					}
				},
				{ escape: false }
			);
		}

		function populateBookingDataLiteList() {
			console.log('vm.config.bookingDataLite ' + JSON.stringify(vm.config.bookingDataLite));
			var parsed = JSON.parse(vm.config.bookingDataLite);
			vm.service.bookingDataLite = [];
			var tempArray = [];
			var counter = 0;
			for (var i = 0; i < parsed.length; i++) {
				//if it's even, move the data from the temp array (creating rows)
				if (counter % 2 == 0) {
					//only do this after first row
					if (i > 1) {
						console.log('adding to array');
						vm.service.bookingDataLite.push(tempArray);
						tempArray = [];
					}
				}
				tempArray.push(parsed[i]);
				counter++;
				//console.log('tempArray i' + i + ' +' + JSON.stringify(tempArray));

				//console.log('vm.service.bookingDataLite ' + JSON.stringify(vm.service.bookingDataLite));
			}
			if (tempArray.length > 0) {
				if (tempArray.length % 2 != 0) {
					//hacky thing for spacing
					console.log('pushing a null');
					tempArray.push(null);
				}
				vm.service.bookingDataLite.push(tempArray);
			}
			if (vm.service.bookingDataLite != null) {
				console.log('vm.service.bookingDataLite' + JSON.stringify(vm.service.bookingDataLite));

				vm.bookingSummaryService.bookingDataLite = vm.service.bookingDataLite;
			}
			//console.log('vm.service.bookingDataLite ' + JSON.stringify(vm.service.bookingDataLite));
		}

		function getRequestIndex(externalIdStr) {
			for (var i = 0, len = vm.config.requestHistory.length; i < len; i++) {
				if (vm.config.requestHistory[i].extId === externalIdStr) {
					return i;
				}
			}
			return 0;
		}

		function toggleSpinner(isShow, spinMsg) {
			vm.service.showSpinner = isShow;
			vm.service.spinnerMessage = spinMsg;
		}
	}
})();
