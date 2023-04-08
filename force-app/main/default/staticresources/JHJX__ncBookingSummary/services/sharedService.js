(function () {
	'use strict';

	angular.module('ncBookingSummary').service('bookingSummaryService', SharedService);

	SharedService.$inject = ['remotingManager', 'config', 'label', 'messageService', '$window'];

	function SharedService(remotingManager, config, label, messageService, $window) {
		var vm = this;

		vm.config = config.get();
		vm.labels = label.getLabels();
		if (!vm.config.isDebugMode) console.log = function () {};
		//console.log('namespace ' + config.get().namespace);
		//console.log('config.get().loanDetailsStr ' +  config.get().loanDetailsStr[config.get().namespace + 'CoreBookingDetails__c']);
		vm.service = {
			bookingSummary: {},
			getBookingSummary: getBookingSummary,
			getCustomerActionMessage: getCustomerActionMessage,
			bookingDataLite: {},
			customers: [],
			fees: [],
			collaterals: [],
			pmts: [],
			rates: [],
			errors: []
		};

		if (
			vm.config.loanDetailsStr != null &&
			vm.config.loanDetailsStr[vm.config.namespace + 'CoreBookingDetails__c'] != ''
		) {
			console.log('vm.config.loanDetailsStr + ' + JSON.stringify(vm.config.loanDetailsStr));
			var str = JSON.stringify(vm.config.loanDetailsStr);
			var parsed;
			var parsedTwice;
			var coreBookingDetails;
			try {
				parsed = JSON.parse(str);
				parsedTwice = JSON.parse(parsed);
				coreBookingDetails = parsedTwice[vm.config.namespace + 'CoreBookingDetails__c'];
				console.log('coredetails ' + coreBookingDetails);
				if (coreBookingDetails != null && coreBookingDetails != '') {
					console.log('coreBookingDetails not null');
					vm.service.bookingSummary = JSON.parse(coreBookingDetails);
				}
			} catch (err) {
				if (coreBookingDetails == null) {
					console.log('CoreBookingDetails failed to parse: ' + err.message);
					messageService.setMessage({
						type: messageService.messageTypes.error,
						text: 'CoreBookingDetails failed to parse: ' + err.message
					});
				}
			}
		}
		processBookingSummary();

		return vm.service;

		function isArray(value) {
			return value && typeof value === 'object' && value.constructor === Array;
		}

		function processBookingSummary() {
			vm.service.errors = [];
			if (vm.service.bookingSummary != null) {
				if (vm.service.bookingSummary.hasOwnProperty('Loan')) {
					populateErrorArray('Loan', vm.service.bookingSummary.Loan);
				} else {
					console.log('didnt find loan');
				}
				if (vm.service.bookingSummary.hasOwnProperty('Customer')) {
					if (!isArray(vm.service.bookingSummary.Customer)) {
						if (vm.service.bookingSummary.Customer != null) {
							vm.service.customers = [];
							vm.service.customers.push(vm.service.bookingSummary.Customer);
							updateCustomerAction(vm.service.customers);
						}
					} else {
						vm.service.customers = vm.service.bookingSummary.Customer;
						updateCustomerAction(vm.service.customers);
					}
				} else {
					console.log('didnt find customer');
				}
				if (vm.service.bookingSummary.hasOwnProperty('Contact')) {
					for (var i = 0; i < vm.service.bookingSummary.Contact.length; i++) {
						vm.service.customers.push(vm.service.bookingSummary.Contact[i]);
					}
					updateCustomerAction(vm.service.customers);
				} else {
					console.log('didnt find contact');
				}
				if (vm.service.bookingSummary.hasOwnProperty('Fee')) {
					if (!isArray(vm.service.bookingSummary.Fee)) {
						if (vm.service.bookingSummary.Fee != null) {
							vm.service.fees = [];
							vm.service.fees.push(vm.service.bookingSummary.Fee);
							updateFeeAction(vm.service.fees);
						}
					} else {
						vm.service.fees = vm.service.bookingSummary.Fee;
						updateFeeAction(vm.service.fees);
					}
				} else {
					console.log('didnt find fee');
				}
				if (vm.service.bookingSummary.hasOwnProperty('Collateral')) {
					if (!isArray(vm.service.bookingSummary.Collateral)) {
						if (vm.service.bookingSummary.Fee != null) {
							vm.service.collaterals = [];
							vm.service.collaterals.push(vm.service.bookingSummary.Collateral);
							updateCollateralAction(vm.service.collaterals);
						}
					} else {
						vm.service.collaterals = vm.service.bookingSummary.Collateral;
						updateCollateralAction(vm.service.collaterals);
					}
				} else {
					console.log('didnt find collaterals');
				}
				if (vm.service.bookingSummary.hasOwnProperty('Pmt')) {
					if (!isArray(vm.service.bookingSummary.Pmt)) {
						if (vm.service.bookingSummary.Pmt != null) {
							vm.service.pmts = [];
							vm.service.pmts.push(vm.service.bookingSummary.Pmt);
							updatePmtAction(vm.service.pmts);
						}
					} else {
						vm.service.pmts = vm.service.bookingSummary.Pmt;
						updatePmtAction(vm.service.pmts);
					}
				} else {
					console.log('didnt find payments');
					vm.service.pmts = [];
				}
				if (vm.service.bookingSummary.hasOwnProperty('Rate')) {
					if (!isArray(vm.service.bookingSummary.Rate)) {
						if (vm.service.bookingSummary.Rate != null) {
							vm.service.rates = [];
							vm.service.rates.push(vm.service.bookingSummary.Rate);
							updateRateAction(vm.service.rates);
						}
					} else {
						vm.service.rates = vm.service.bookingSummary.Rate;
						updateRateAction(vm.service.rates);
					}
				} else {
					console.log('didnt find rates');
					vm.service.rates = [];
				}
			}
		}
		function getBookingSummary(requestHistory) {
			console.log('called getBookingSummary');
			remotingManager.invokeAction(
				config.get().getCoreBookingDetails,
				config.get().objectId,
				function (result, event) {
					console.log('result ' + JSON.stringify(result));
					if (event.status) {
						try {
							vm.service.bookingSummary = result != '' ? JSON.parse(result) : null;
						} catch (err) {
							console.log('bookingSummary failed to parse ' + err.message);
							messageService.setMessage({
								type: messageService.messageTypes.error,
								text: 'bookingSummary failed to parse ' + err.message
							});
						}
						processBookingSummary();
					} else {
						console.log('getBookingSummary error');
						messageService.setMessage({
							type: messageService.messageTypes.error,
							text: event.message
						});
					}
				},
				{ escape: false }
			);
		}
		function updateCustomerAction(custArray) {
			for (var i = 0; i < custArray.length; i++) {
				var customer = custArray[i];
				customer.action = getCustomerActionMessage(customer);
			}
		}
		function getCustomerActionMessage(customer) {
			if (customer.coreCreated == 'true') {
				return vm.labels.ABJX_Book_Created_Status_Result;
			} else if (customer.coreExist == 'true') {
				return vm.labels.ABJX_Book_Existed_Status_Result;
			} else if (customer.coreUpdated == 'true') {
				return vm.labels.ABJX_Book_Updated_Status_Result;
			} else {
				if (
					notNullOrBlank(customer.serviceError) ||
					notNullOrBlank(customer.coreError) ||
					notNullOrBlank(customer.ncinoError) ||
					notNullOrBlank(customer.coreLinToAccountError) ||
					notNullOrBlank(customer.Error)
				) {
					populateErrorArray('Customer', customer);
					return 'Error';
				}
			}
		}
		function updateCollateralAction(collatArray) {
			for (var i = 0; i < collatArray.length; i++) {
				var collat = collatArray[i];
				collat.action = getCollateralActionMessage(collat);
			}
		}
		function getCollateralActionMessage(collateral) {
			if (collateral.coreCreated == 'true') {
				return vm.labels.ABJX_Book_Created_Status_Result;
			} else if (collateral.coreExist == 'true') {
				return vm.labels.ABJX_Book_Existed_Status_Result;
			} else if (collateral.ncinoUpdated == 'true') {
				return vm.labels.ABJX_Book_Updated_Status_Result;
			} else {
				if (
					notNullOrBlank(collateral.serviceError) ||
					notNullOrBlank(collateral.coreError) ||
					notNullOrBlank(collateral.ncinoError) ||
					notNullOrBlank(collateral.Error)
				) {
					populateErrorArray('Collateral', collateral);
					return 'Error';
				}
			}
		}
		function updateFeeAction(feeArray) {
			//console.log('updatingFeeAction Array');
			for (var i = 0; i < feeArray.length; i++) {
				var fee = feeArray[i];
				fee.action = getFeeActionMessage(fee);
			}
		}
		function getFeeActionMessage(fee) {
			//console.log('fee is ' + JSON.stringify(fee));
			if (fee.coreCreated == 'true') {
				return vm.labels.ABJX_Book_Created_Status_Result;
			} else {
				if (
					notNullOrBlank(fee.serviceError) ||
					notNullOrBlank(fee.coreError) ||
					notNullOrBlank(fee.Error)
				) {
					populateErrorArray('Fee', fee);
					return 'Error';
				}
			}
		}
		function populateErrorArray(dataType, recordData) {
			var errorKeys = [
				'serviceError',
				'coreError',
				'ncinoError',
				'coreLinToAccountError',
				'Error'
			];
			//console.log('datatype ' + dataType);
			for (var i = 0; i < errorKeys.length; i++) {
				var errorData = recordData[errorKeys[i]];
				var recId = recordData.recordId;
				var recName = recordData.Name;
				if (
					notNullOrBlank(errorData) &&
					notNullOrBlank(errorData.FaultRecInfoArray) &&
					notNullOrBlank(errorData.FaultRecInfoArray.FaultMsgRec)
				) {
					var errors = errorData.FaultRecInfoArray.FaultMsgRec;
					if (!isArray(errors)) {
						errors = [];
						errors.push(errorData.FaultRecInfoArray.FaultMsgRec);
					}
					for (var j = 0; j < errors.length; j++) {
						if (errors[j].ErrCat != 'Override') {
							var error = {};
							error.errorType = dataType;
							error.recordId = recId;
							error.Name = recName;
							error.description = 'Error Code-' + errors[j].ErrCode + '\r\n';
							error.description += 'Category-' + errors[j].ErrCat + '\r\n';
							error.description +=
								'Path-' + (errors[j].ErrElem == null ? '' : errors[j].ErrElem) + '\r\n';
							error.description += 'Description-' + errors[j].ErrDesc;
							vm.service.errors.push(error);
						}
					}
					console.log('errors ' + JSON.stringify(errors));
				}
			}
		}
		function notNullOrBlank(data) {
			if (data != null && data != '') return true;
			return false;
		}
		function updatePmtAction(pmtArray) {
			for (var i = 0; i < pmtArray.length; i++) {
				var pmt = pmtArray[i];
				pmt.action = getPmtActionMessage(pmt);
			}
		}
		function getPmtActionMessage(pmt) {
			if (pmt.coreCreated == 'true') {
				return vm.labels.ABJX_Book_Created_Status_Result;
			} else if (pmt.coreExist == 'true') {
				return vm.labels.ABJX_Book_Existed_Status_Result;
			} else {
				if (
					notNullOrBlank(pmt.serviceError) ||
					notNullOrBlank(pmt.coreError) ||
					notNullOrBlank(pmt.Error)
				) {
					populateErrorArray('Pmt', pmt);
					return 'Error';
				}
			}
		}
		function updateRateAction(rateArray) {
			for (var i = 0; i < rateArray.length; i++) {
				var rate = rateArray[i];
				rate.action = getRateActionMessage(rate);
			}
		}
		function getRateActionMessage(rate) {
			if (rate.coreCreated == 'true') {
				return vm.labels.ABJX_Book_Created_Status_Result;
			} else if (rate.coreExist == 'true') {
				return vm.labels.ABJX_Book_Existed_Status_Result;
			} else {
				if (
					notNullOrBlank(rate.serviceError) ||
					notNullOrBlank(rate.coreError) ||
					notNullOrBlank(rate.Error)
				) {
					populateErrorArray('Rate', rate);
					return 'Error';
				}
			}
		}
	}
})();
