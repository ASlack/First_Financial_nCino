(function () {
	'use strict';

	angular
		.module('ncBookingSummary')
		.controller('bookingSummaryController', BookingSummaryController);

	BookingSummaryController.$inject = ['label', 'config', 'bookingSummaryService', '$scope'];

	function BookingSummaryController(label, config, bookingSummaryService, $scope) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();
		vm.sharedService = bookingSummaryService;
	}
})();
