(function () {
	'use strict';

	angular
		.module('jxAdminIdDocConfig')
		.controller('jxAdminIdDocConfigController', jxAdminIdDocConfigController);

	jxAdminIdDocConfigController.$inject = [
		'label',
		'config',
		'jxAdminIdDocConfigDataService',
		'$timeout'
	];

	function jxAdminIdDocConfigController(label, config, jxAdminIdDocConfigDataService, $timeout) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.initializingData = true;
		vm.performingAjax = false;
		vm.currentUserId = config.get().currentUserId;
		vm.namespacePrefix = config.get().classNS;
		vm.currentConfig = {};
		vm.reset = getCurrentConfig;
		vm.toastStack = [];
		vm.config = config;
		vm.currentApp = null;
		vm.getCurrentConfig = getCurrentConfig;
		vm.updateIdDocConfigs = updateIdDocConfigs;
		vm.createIdDocConfig = createIdDocConfig;
		vm.deleteIdDocConfig = deleteIdDocConfig;
		vm.idDocConfigKeys = {
			id: 'Id',
			docType: vm.namespacePrefix + 'Document_Type__c',
			query: vm.namespacePrefix + 'IdVerifyQuery__c',
			queryVal: vm.namespacePrefix + 'IdVerifyQueryVal__c'
		};

		vm.$onInit = function () {
			getCurrentConfig();
		};

		function showSuccessToast(message, subHeading) {
			showToast(
				message,
				config.get().TOAST_TYPES.SUCCESS,
				config.get().ALERT_DIALOG.THEME_SUCCESS,
				subHeading
			);
		}

		function showWarningToast(message, subHeading) {
			showToast(
				message,
				config.get().TOAST_TYPES.WARNING,
				config.get().ALERT_DIALOG.THEME_WARNING,
				subHeading
			);
		}

		function showErrorToast(message, subHeading) {
			showToast(
				message,
				config.get().TOAST_TYPES.ERROR,
				config.get().ALERT_DIALOG.THEME_ERROR,
				subHeading
			);
		}

		function showToast(message, type, icon, subHeading) {
			var item = { toastIcon: icon, toastType: type, message: message, subHeading: subHeading };
			vm.toastStack.push(item);
		}

		function getCurrentConfig() {
			vm.toastStack = [];
			startAjaxRequest(null);
			jxAdminIdDocConfigDataService
				.getCurrentConfig()
				.then(function (response) {
					vm.currentConfig = response;
					endAjaxRequest();
					vm.initializingData = false;
					if (vm.currentConfig.isSuccessful !== true) {
						showErrorToast(vm.labels.ABJX_Error, vm.currentConfig.message);
					}
				})
				.catch(function (err) {
					handlePromiseError(err);
				});
		}

		function createIdDocConfig() {
			vm.toastStack = [];
			startAjaxRequest(null);
			jxAdminIdDocConfigDataService
				.createIdDocConfig(vm.currentConfig)
				.then(function (response) {
					vm.currentConfig = response;
					endAjaxRequest();
					if (vm.currentConfig.isSuccessful === true) {
						showSuccessToast(vm.labels.ABJX_Success, vm.currentConfig.message);
					} else {
						showErrorToast(vm.labels.ABJX_Error, vm.currentConfig.message);
					}
				})
				.catch(function (err) {
					handlePromiseError(err);
				});
		}

		function deleteIdDocConfig(data) {
			vm.toastStack = [];
			startAjaxRequest(null);
			jxAdminIdDocConfigDataService
				.deleteIdDocConfig(data, vm.currentConfig)
				.then(function (response) {
					vm.currentConfig = response;
					endAjaxRequest();
					if (vm.currentConfig.isSuccessful === true) {
						showSuccessToast(vm.labels.ABJX_Success, vm.currentConfig.message);
					} else {
						showErrorToast(vm.labels.ABJX_Error, vm.currentConfig.message);
					}
				})
				.catch(function (err) {
					handlePromiseError(err);
				});
		}

		function updateIdDocConfigs() {
			vm.toastStack = [];
			startAjaxRequest(null);
			jxAdminIdDocConfigDataService
				.updateIdDocConfigs(vm.currentConfig)
				.then(function (response) {
					vm.currentConfig = response;
					endAjaxRequest();
					if (vm.currentConfig.isSuccessful === true) {
						showSuccessToast(vm.labels.ABJX_Success, vm.currentConfig.message);
					} else {
						showErrorToast(vm.labels.ABJX_Error, vm.currentConfig.message);
					}
				})
				.catch(function (err) {
					handlePromiseError(err);
				});
		}

		function startAjaxRequest(blockMsg) {
			vm.performingAjax = true;
			if (window.LifeCycle) {
				LifeCycle.setBlockMessage(blockMsg === null ? '' : blockMsg);
				LifeCycle.blockUI();
			}
		}

		function endAjaxRequest() {
			vm.performingAjax = false;
			if (window.LifeCycle) {
				LifeCycle.unblockUI();
			}
		}

		function handlePromiseError(err) {
			endAjaxRequest();
			showErrorToast(vm.labels.ABJX_Error, err);
		}
	}
})();
