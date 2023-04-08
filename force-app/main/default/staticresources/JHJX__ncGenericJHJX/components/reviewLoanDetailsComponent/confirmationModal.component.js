(function () {
	'use strict';
	angular.module('ncGenericJHJX').component('confirmationModal', {
		controller: [
			'label',
			'config',
			'jhjxService',
			'messageService',
			'ui',
			ConfirmationModalController
		],
		controllerAs: 'vm',
		scope: {},
		template:
			'<div id="confirmationModal" class="slds" ng-show="vm.jhjxService.modalOpen == true"> ' +
			'<div role="alertdialog" tabindex="-1" class="slds-modal slds-fade-in-open"> ' +
			'<div class="slds-modal__container" > ' +
			'<div class="slds-modal__header slds-modal__header--empty"> ' +
			'</div> ' +
			'<div class="slds-modal__content slds-p-around--medium slds-align--absolute-center">' +
			'<h2 class="slds-text-heading--medium">{{::vm.labels.ABJX_BookLoanConfirmation}}</h2> ' +
			'</div> ' +
			'<div class="slds-modal__footer slds-theme--default"> ' +
			'<button class="slds-button slds-button--neutral" ng-click="vm.toggleModal();">{{::vm.labels.ABJX_Cancel}}</button>' +
			'<button class="slds-button slds-button--neutral slds-button--brand" ng-click="vm.bookToCore();">{{::vm.labels.ABJX_Book_To_Core}}</button> </div> ' +
			'</div> ' +
			'</div> ' +
			'<div class="slds-backdrop slds-backdrop--open"></div> ' +
			'</div> '
	});

	function ConfirmationModalController(label, config, jhjxService, messageService, ui) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.config = config.get();

		if (!vm.config.isDebugMode) console.log = function () {};
		vm.jhjxService = jhjxService;

		var modalElement = '#confirmationModal';
		console.log('init confirmationmodal');

		vm.bookToCore = function () {
			vm.toggleModal();

			if (vm.config.bookToCoreButtonEnabled) vm.jhjxService.initiateBooking();
			if (vm.config.renewLoanButtonEnabled) vm.jhjxService.initiateRenewal();
			if (vm.config.modifyLoanButtonEnabled) vm.jhjxService.initiateModification();
		};
		vm.toggleModal = function () {
			vm.jhjxService.modalOpen
				? (vm.jhjxService.modalOpen = false)
				: (vm.jhjxService.modalOpen = true);
		};
	}
})();
