(function () {
	'use strict';

	angular.module('ncGenericJHJX').controller('genericJHJXController', GenericJHJXController);

	GenericJHJXController.$inject = ['label', 'config', 'jhjxService', 'messageService', '$scope'];

	function GenericJHJXController(label, config, jhjxService, messageService, $scope) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.sharedService = jhjxService;
		vm.config = config.get();
		if (!vm.config.isDebugMode) console.log = function () {};

		console.log('ncGenericJHJX controller inited');

		//will only hit this method if this component is in its own app instead of a component of another app
		$scope.foundUpdates = function (data) {
			console.log('ncGenericJHJX found updates ' + data);
			var tempData = data;
			if (data != null) {
				try {
					tempData = JSON.parse(data);
					console.log('data.nFUSE__Vendor_Status__c ' + tempData.nFUSE__Vendor_Status__c);
					console.log(
						'data.nFUSE__Transaction_Status__c ' + tempData.nFUSE__Transaction_Status__c
					);
					if (
						tempData.nFUSE__Vendor_Status__c == 'reserve_loan' ||
						tempData.nFUSE__Transaction_Status__c == 'LoanNumberReserved' ||
						tempData.nFUSE__Vendor_Status__c == 'Request Failed' ||
						tempData.nFUSE__Transaction_Status__c == 'Error'
					) {
						console.log('applying updates');
						jhjxService.processPushTopicUpdate(data);
						$scope.$apply();
					}
				} catch (err) {
					console.log('push topic update failed to parse: ' + err.message);
					messageService.setMessage({
						type: messageService.messageTypes.error,
						text: 'push topic update failed to parse: ' + err.message
					});
				}
			}
		};
		$scope.foundErrors = function (data) {
			console.log('found errors ' + data);
		};
	}
})();