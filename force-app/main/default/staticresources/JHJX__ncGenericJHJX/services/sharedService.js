(function () {
	'use strict';

	angular.module('ncGenericJHJX').service('jhjxService', SharedService);

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

		console.log('jhjxService init');

		vm.service = {
			initiateBooking: initiateBooking,
			initiateReservation: initiateReservation,
			initiateRenewal: initiateRenewal,
			initiateModification: initiateModification,
			processPushTopicUpdate: processPushTopicUpdate,
			getRequestIndex: getRequestIndex,
			getCoreBookingMessage: getCoreBookingMessage,
			toggleSpinner: toggleSpinner,
			getButtonStatuses: getButtonStatuses,
			getBookingDataLiteList: getBookingDataLiteList,
			populateBookingDataReviewList: populateBookingDataReviewList,
			bookingDataLite: [],
			bookingDataReview: [],
			showSpinner: false,
			spinnerMessage: '',
			modalOpen: false
		};

		populateBookingDataLiteList();
		populateBookingDataReviewList();
		populateDataTableArrays();

		return vm.service;

		function initiateBooking() {
			messageService.clear();
			console.log('initiateBooking');
			vm.config.isBooking = true;
			vm.config.loanState = 'Booking'; //used as a flag for later
			window.window.scrollTo(0, 0); //scroll to top of window
			toggleSpinner(true, vm.labels.ABJX_Booking_To_Core);

			var selectedProductsMap = {};
			for (var i = 0; i < vm.config.picklistArray.length; i++) {
				for (var j = 0; j < vm.config.picklistArray[i].length; j++) {
					if (vm.config.picklistArray[i][j] != null) {
						//must check this from the hacky null doing spacing work
						for (var k = 0; k < vm.config.picklistArray[i][j].length; k++) {
							console.log(
								'vm.config.picklistArray[i][j][k]' +
									JSON.stringify(vm.config.picklistArray[i][j][k])
							);
							if (vm.config.picklistArray[i][j][k].isSelected == true) {
								selectedProductsMap[
									vm.config.namespace +
										vm.config.picklistArray[i][j][k][vm.config.namespace + 'ElemName__c']
								] = vm.config.picklistArray[i][j][k][vm.config.namespace + 'ElemValue__c'];
							}
						}
					}
				}
			}
			console.log('selectedProductsMap ' + JSON.stringify(selectedProductsMap));

			remotingManager.invokeAction(
				vm.config.initiateBookingAction,
				vm.config.objectId,
				selectedProductsMap,
				function (result, event) {
					if (event.status) {
						vm.config.requestHistory.splice(0, 0, {
							action: vm.labels.ABJX_Book_To_Core,
							status: vm.labels.ABJX_In_Progress,
							requestDate: result
						});
					} else {
						console.log('setting error from initiateBooking');
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

		function initiateReservation() {
			messageService.clear();
			console.log('initiateReservation');
			window.window.scrollTo(0, 0); //scroll to top of window
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
										vm.config.loanState = 'Error';
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
										vm.config.loanState = 'Error';
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
								bookingSummaryService.getBookingSummary(vm.config.requestHistory);
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

						console.log('vm.config.loanState ' + vm.config.loanState);
						console.log('loanState ' + newButtonStatuses.loanState);
						vm.config.loanState = newButtonStatuses.loanState;
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
		function initiateRenewal() {
			messageService.clear();
			vm.config.isBooking = true;
			window.window.scrollTo(0, 0); //scroll to top of window
			toggleSpinner(true, vm.labels.ABJX_Renewing_To_Core);

			var selectedProductsMap = {};
			for (var i = 0; i < vm.config.picklistArray.length; i++) {
				for (var j = 0; j < vm.config.picklistArray[i].length; j++) {
					if (vm.config.picklistArray[i][j] != null) {
						//must check this from the hacky null doing spacing work
						for (var k = 0; k < vm.config.picklistArray[i][j].length; k++) {
							console.log(
								'vm.config.picklistArray[i][j][k]' +
									JSON.stringify(vm.config.picklistArray[i][j][k])
							);
							if (vm.config.picklistArray[i][j][k].isSelected == true) {
								selectedProductsMap[
									vm.config.namespace + vm.config.picklistArray[i][j][k]['ElemName__c']
								] = vm.config.picklistArray[i][j][k][vm.config.namespace + 'ElemValue__c'];
							}
						}
					}
				}
			}
			console.log('selectedProductsMap ' + JSON.stringify(selectedProductsMap));

			remotingManager.invokeAction(
				vm.config.initiateRenewalAction,
				vm.config.objectId,
				selectedProductsMap,
				function (result, event) {
					if (event.status) {
						vm.config.requestHistory.splice(0, 0, {
							action: vm.labels.ABJX_Renewing_To_Core,
							status: vm.labels.ABJX_In_Progress,
							requestDate: result
						});
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
		function initiateModification() {
			messageService.clear();
			vm.config.isBooking = true;
			window.window.scrollTo(0, 0); //scroll to top of window
			toggleSpinner(true, vm.labels.ABJX_Modifying_To_Core);

			var selectedProductsMap = {};
			for (var i = 0; i < vm.config.picklistArray.length; i++) {
				for (var j = 0; j < vm.config.picklistArray[i].length; j++) {
					if (vm.config.picklistArray[i][j] != null) {
						//must check this from the hacky null doing spacing work
						for (var k = 0; k < vm.config.picklistArray[i][j].length; k++) {
							console.log(
								'vm.config.picklistArray[i][j][k]' +
									JSON.stringify(vm.config.picklistArray[i][j][k])
							);
							if (vm.config.picklistArray[i][j][k].isSelected == true) {
								selectedProductsMap[
									vm.config.namespace + vm.config.picklistArray[i][j][k]['ElemName__c']
								] = vm.config.picklistArray[i][j][k][vm.config.namespace + 'ElemValue__c'];
							}
						}
					}
				}
			}
			console.log('selectedProductsMap ' + JSON.stringify(selectedProductsMap));

			remotingManager.invokeAction(
				vm.config.initiateModificationAction,
				vm.config.objectId,
				selectedProductsMap,
				function (result, event) {
					if (event.status) {
						vm.config.requestHistory.splice(0, 0, {
							action: vm.labels.ABJX_Modifying_To_Core,
							status: vm.labels.ABJX_In_Progress,
							requestDate: result
						});
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

		function getCoreBookingMessage() {
			console.log('calling  getCoreBookingMessage');
			//vm.config.bookingdatapreview = result;
			vm.config.bookingdatapreviewastext = JSON.stringify(vm.config.bookingdatapreview, null, 2);
			toggleSpinner(true, vm.labels.ABJX_ObtainingPreview);
			remotingManager.invokeAction(
				vm.config.getCoreBookingMessage,
				vm.config.objectId,
				vm.config.previewType,
				function (result, event) {
					if (event.status) {
						vm.config.bookingdatapreview = result;
						vm.config.bookingdatapreviewastext = JSON.stringify(
							vm.config.bookingdatapreview,
							null,
							2
						);
						//reset view
						if (document.getElementById('datapreview1') != null)
							document.getElementById('datapreview1').style.display = 'none';
						toggleSpinner(false, null);
						console.log(
							'vm.config.bookingdatapreview ' + JSON.stringify(vm.config.bookingdatapreview)
						);
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
		function getBookingDataLiteList() {
			remotingManager.invokeAction(
				vm.config.getBookingDataLiteList,
				vm.config.objectId,
				function (result, event) {
					if (event.status) {
						console.log('getBookingDataLiteList result ' + JSON.stringify(result));
						var str = JSON.stringify(result);
						try {
							toggleSpinner(false, null);
							console.log('stopping spinner from getBookingDataLiteList');
							populateBookingDataLiteList();
						} catch (err) {
							console.log('getBookingDataLiteList result failed to parse ' + err.message);
							toggleSpinner(false, null);
							messageService.setMessage({
								type: messageService.messageTypes.error,
								text: 'getBookingDataLiteList result failed to parse ' + err.message
							});
						}
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

				console.log('vm.service.bookingDataLite ' + JSON.stringify(vm.service.bookingDataLite));
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
				console.log('vm.service.bookingDataLite' + vm.service.bookingDataLite);

				vm.bookingSummaryService.bookingDataLite = vm.service.bookingDataLite;
			}
			//console.log('vm.service.bookingDataLite ' + JSON.stringify(vm.service.bookingDataLite));
		}
		function populateBookingDataReviewList() {
			console.log(
				'populateBookingDataReviewList ' + JSON.stringify(vm.config.bookingDataReview)
			);
			var parsed = JSON.parse(vm.config.bookingDataReview);

			vm.service.bookingDataReview = [];
			var tempArray = [];
			var counter = 0;
			for (var i = 0; i < parsed.length; i++) {
				//if it's even, move the data from the temp array (creating rows)
				if (counter % 2 == 0) {
					//only do this after first row
					if (i > 1) {
						console.log('adding to array');
						vm.service.bookingDataReview.push(tempArray);
						tempArray = [];
					}
				}
				tempArray.push(parsed[i]);
				counter++;
				//console.log('tempArray i' + i + ' +' + JSON.stringify(tempArray));

				//console.log('vm.service.bookingDataReview ' + JSON.stringify(vm.service.bookingDataReview));
			}
			if (tempArray.length > 0) {
				if (tempArray.length % 2 != 0) {
					//hacky thing for spacing
					console.log('pushing a null');
					tempArray.push(null);
				}
				vm.service.bookingDataReview.push(tempArray);
			}

			//console.log('vm.service.bookingDataReview ' + JSON.stringify(vm.service.bookingDataReview));
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

		function populateDataTableArrays() {
			vm.config.customers = convertEscapedStringToJsonObject(vm.config.customers);
			vm.config.collaterals = convertEscapedStringToJsonObject(vm.config.collaterals);
			vm.config.fees = convertEscapedStringToJsonObject(vm.config.fees);
			vm.config.rates = convertEscapedStringToJsonObject(vm.config.rates);
			vm.config.pmts = convertEscapedStringToJsonObject(vm.config.pmts);
		}
		function convertEscapedStringToJsonObject(str) {
			var stringified;
			var trippleParsed;
			try {
				stringified = JSON.stringify(str);
				console.log('strigified ' + stringified);
				trippleParsed = JSON.parse(JSON.parse(JSON.parse(stringified)));
				console.log('trippleParsed ' + JSON.stringify(trippleParsed));
			} catch (err) {
				console.log(
					'populateDataTableArrays failed to parse, there may not be customer, collateral or fee records (this is fine) ' +
						err.message
				);
			}

			return trippleParsed;
		}
	}
})();
