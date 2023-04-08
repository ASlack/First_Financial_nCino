(function () {
	'use strict';
	angular.module('ncGenericJHJX').component('ancillaryProductsComponent', {
		controller: [
			'config',
			'label',
			'messageService',
			'jhjxService',
			'$window',
			AncFormController
		],
		controllerAs: 'vm',
		templateUrl: 'ancillaryProducts_html'
		// Commented out for CORS issue
		//  templateUrl: ['config', function(config) {
		//      return config.get().listView;
		//  }]
	});

	function AncFormController(config, label, messageService, jhjxService, $window) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();

		if (!vm.config.isDebugMode) console.log = function () {};

		vm.jhjxService = jhjxService;

		vm.picklistArray = [];
		vm.picklistMap = {};

		vm.selectOption = function (picklistColValue, picklistOption) {
			if (picklistColValue != null) {
				for (var i = 0; i < picklistColValue.length; i++) {
					picklistColValue[i].isSelected = false;
				}
				for (var i = 0; i < picklistColValue.length; i++) {
					if (picklistColValue[i][vm.config.namespace + 'ElemValue__c'] == picklistOption) {
						picklistColValue[i].isSelected = true;
						// TODO: Is the first if statement necessary now that default is set in controller?
						if (
							vm.config.loanState.indexOf('InitialState') > -1 ||
							vm.config.loanState.indexOf('PartialBooked') > -1
						) {
							if (
								picklistColValue[i][vm.config.namespace + 'ElemName__c'] ==
								vm.config.ratePaymentOverrideConfig
							) {
								if (picklistOption == vm.config.rateScheduleBookingConfig) {
									vm.config.rateScheduleBookingEnabled = true;
									vm.config.pmtScheduleBookingEnabled = false;
								} else if (picklistOption == vm.config.pmtScheduleBookingConfig) {
									vm.config.rateScheduleBookingEnabled = false;
									vm.config.pmtScheduleBookingEnabled = true;
								} else if (picklistOption == 'false') {
									vm.config.rateScheduleBookingEnabled =
										vm.config.rateScheduleBookingEnabledConfig;
									vm.config.pmtScheduleBookingEnabled =
										vm.config.pmtScheduleBookingEnabledConfig;
								} else {
									vm.config.rateScheduleBookingEnabled = false;
									vm.config.pmtScheduleBookingEnabled = false;
								}
							}
						}
					}
				}
			}
		};

		vm.changeValue = function (inputData) {
			console.log('changed!' + JSON.stringify(inputData));
			if (inputData[vm.config.namespace + 'ElemValDesc__c'] != '') {
				inputData.isSelected = true;
			} else {
				inputData.isSelected = false;
			}
			console.log('inputData.isSelected !' + inputData.isSelected);
		};

		vm.redirect = function (idToRedirectTo) {
			console.log('redirecting');
			var pathArray = location.href.split('/');
			var protocol = pathArray[0];
			var host = pathArray[2];
			var url = protocol + '//' + host;

			$window.open(url + '/' + idToRedirectTo);
		};

		if (vm.config.picklistArray == null) {
			vm.config.picklistArray = {};

			console.log('AncFormController init');

			var str = JSON.stringify(vm.config.svcDictInfo);
			console.log('svcDictInfo ' + str);
			if (str != null && str != '') {
				try {
					var parsed = JSON.parse(JSON.parse(str));
					vm.config.svcDictInfo = parsed;
				} catch (err) {
					console.log(
						'svcDictInfo failed to parse, please check if there are svcDictInfo records: ' +
							err.message
					);
					messageService.setMessage({
						type: messageService.messageTypes.error,
						text:
							'svcDictInfo failed to parse, please check if there are svcDictInfo records' +
							err.message
					});
				}
			} else {
				return;
			}

			for (var i = 0; i < vm.config.svcDictInfo.length; i++) {
				var tempPicklistArray = [];
				var title = vm.config.svcDictInfo[i][vm.config.namespace + 'Title__c'];
				var hide = vm.config.svcDictInfo[i][vm.config.namespace + 'hide__c'];
				var dflt = vm.config.svcDictInfo[i][vm.config.namespace + 'default__c'];
				if (title != null && hide == false) {
					if (vm.picklistMap[title] == null) {
						vm.picklistMap[title] = [];
					}
					if (dflt == true) {
						vm.picklistMap[title].splice(0, 0, vm.config.svcDictInfo[i]);
					} else {
						vm.picklistMap[title].push(vm.config.svcDictInfo[i]);
					}
				}
				if (title != null && hide == true && dflt == true) {
					if (vm.picklistMap[title] == null) {
						vm.picklistMap[title] = [];
					}
					vm.picklistMap[title].push(vm.config.svcDictInfo[i]);
				}
			}
			var tempArray = [];
			var counter = 0;
			for (const [key, value] of Object.entries(vm.picklistMap)) {
				if (counter % 2 == 0) {
					if (counter > 1) {
						console.log('adding to array');
						vm.picklistArray.push(tempArray);
						tempArray = [];
					}
				}
				value.selectedOption = value[0][vm.config.namespace + 'ElemValue__c'];
				vm.selectOption(value, value.selectedOption);
				for (var i = 0; i < value.selectOption; i++) {
					if (value) {
						if (i == 0) {
							value.isSelected = true;
						} else {
							value.isSelected = false;
						}
					}
				}
				tempArray.push(value);
				counter++;
			}
			if (tempArray.length > 0) {
				if (tempArray.length % 2 != 0) {
					//hacky thing for spacing
					tempArray.push(null);
				}
				vm.picklistArray.push(tempArray);
			}

			vm.config.picklistArray = vm.picklistArray;
		}
	}
})();
