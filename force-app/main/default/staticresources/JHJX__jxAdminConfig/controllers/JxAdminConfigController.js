(function () {
	'use strict';

	angular.module('jxAdminConfig').controller('jxAdminConfigController', jxAdminConfigController);

	jxAdminConfigController.$inject = ['label', 'config', 'jxAdminConfigDataService', '$timeout'];

	function jxAdminConfigController(label, config, jxAdminConfigDataService, $timeout) {
		var vm = this;

		vm.labels = label.getLabels();
		vm.initializingData = true;
		vm.performingAjax = false;
		vm.getCurrentConfig = getCurrentConfig;
		vm.parmSync = parmSync;
		vm.parmInquiry = parmInquiry;
		vm.getSelectedParmValues = getSelectedParmValues;
		vm.currentUserId = config.get().currentUserId;
		vm.currentConfig = {};
		vm.toastStack = [];
		vm.config = config;
		vm.selectedParmValues = [];
		vm.selectOnChange = getSelectedParmValues;
		vm.currentApp = null;
		vm.reset = getCurrentConfig;
		vm.selectedRecordTypes = [];
		vm.exportResults = exportResults;
		vm.exportRows = [];
		vm.exportCursor = 0;

		vm.$onInit = function () {
			getCurrentApp();
			vm.getCurrentConfig();
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

		function getCurrentApp() {
			try {
				var activeApp = location.search
					? location.search.split('?app=')[1]
					: location.href.split('?app=')[1];
				if (!activeApp)
					activeApp = location.search
						? location.search.split('&app=')[1]
						: location.href.split('&app=')[1];
				vm.currentApp = activeApp.split('&')[0];
			} catch {}
		}

		function getCurrentConfig() {
			vm.toastStack = [];
			vm.performingAjax = true;
			if (vm.currentApp.indexOf('inquiry') > 0 || vm.currentApp.indexOf('sync') > 0) {
				startAjaxRequest(vm.labels.ABJX_Ajax_Init);
			}
			jxAdminConfigDataService
				.getCurrentConfig(vm.currentApp)
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

		function parmSync() {
			vm.toastStack = [];
			startAjaxRequest(vm.labels.ABJX_Ajax_Sync);
			getSelectedRecordTypes();
			jxAdminConfigDataService
				.parmSync(vm.currentConfig)
				.then(function (response) {
					vm.currentConfig = response;

					if (vm.currentConfig.isSuccessful === true) {
						jxAdminConfigDataService
							.getSelectedParmValues(vm.currentConfig)
							.then(function (response) {
								vm.currentConfig = response;
								endAjaxRequest();
								handleSelectOnChange();

								if (vm.currentConfig.isSuccessful === true) {
									showSuccessToast(vm.labels.ABJX_Success, vm.currentConfig.message);
								} else {
									showErrorToast(vm.labels.ABJX_Error, vm.currentConfig.message);
								}
							})
							.catch(function (err) {
								handlePromiseError(err);
							});
					} else {
						handlePromiseError(vm.currentConfig.message);
					}
				})
				.catch(function (err) {
					handlePromiseError(err);
				});
		}

		function getSelectedRecordTypes() {
			let rtArray = [];
			vm.currentConfig.selectedParm.serializedRecordTypeIds = '';
			vm.selectedRecordTypes.forEach((rt) => {
				if (rt.isChecked) {
					rtArray.push(rt.def);
				}
			});
			if (rtArray.length > 0) {
				vm.currentConfig.selectedParm.serializedRecordTypeIds = JSON.stringify(rtArray);
			}
		}

		function parmInquiry(currentCursor = vm.currentConfig.searchHeader.cursor) {
			vm.toastStack = [];
			startAjaxRequest(vm.labels.ABJX_Ajax_Inq);
			vm.currentConfig.inquiryResult = [];
			vm.currentConfig.searchHeader.cursor = currentCursor === 1 ? 0 : currentCursor;
			jxAdminConfigDataService
				.parmInquiry(vm.currentConfig)
				.then(function (response) {
					vm.currentConfig = response;
					endAjaxRequest();

					if (vm.currentConfig.isSuccessful === true) {
						if (vm.currentConfig.searchHeader.fromRec === 1) {
							vm.exportRows = vm.currentConfig.inquiryResult;
							vm.exportCursor = vm.currentConfig.searchHeader.cursor;
						} else if (vm.currentConfig.searchHeader.cursor > vm.exportCursor) {
							vm.exportCursor = vm.currentConfig.searchHeader.cursor;
							vm.exportRows.push(...vm.currentConfig.inquiryResult);
						} else if (
							vm.currentConfig.searchHeader.toRec ===
								vm.currentConfig.searchHeader.totalRec &&
							vm.exportCursor < vm.currentConfig.searchHeader.totalRec
						) {
							vm.exportCursor = vm.currentConfig.searchHeader.totalRec;
							vm.exportRows.push(...vm.currentConfig.inquiryResult);
						}
						showSuccessToast(vm.labels.ABJX_Success, vm.currentConfig.message);
					} else {
						showErrorToast(vm.labels.ABJX_Error, vm.currentConfig.message);
					}
				})
				.catch(function (err) {
					handlePromiseError(err);
				});
		}

		function getSelectedParmValues() {
			vm.toastStack = [];
			vm.performingAjax = true;
			jxAdminConfigDataService
				.getSelectedParmValues(vm.currentConfig)
				.then(function (response) {
					vm.currentConfig = response;
					vm.performingAjax = false;
					handleSelectOnChange();

					if (vm.currentConfig.isSuccessful !== true) {
						showErrorToast(vm.labels.ABJX_Error, vm.currentConfig.message);
					}
				})
				.catch(function (err) {
					handlePromiseError(err);
				});
		}

		function handleSelectOnChange() {
			vm.selectedParmValues = [];
			vm.selectedRecordTypes = [];
			if (vm.currentConfig.selectedParm !== null) {
				vm.selectedParmValues = vm.currentConfig.selectedParm.currentValues;
				vm.currentConfig.selectedParm.recordTypeIds.forEach((rt) => {
					let dispLabel = rt.FullName.split('.')[0] + ': ' + rt.label;
					vm.selectedRecordTypes.push({
						Id: rt.Id,
						label: dispLabel,
						isChecked: false,
						def: rt
					});
				});
			}
		}

		function exportResults() {
			try {
				const filename = vm.currentConfig.inquiryParmName + '.csv';
				const dataRows = [];

				const keys = { code: true, description: true };
				vm.exportRows.forEach((x) => {
					let rowItem = {
						code: x.ParmValCode,
						description: x.ParmValDesc
					};
					if (x.ParmValInfoArray != null) {
						x.ParmValInfoArray.ParmValInfo.forEach((y) => {
							rowItem[y.ParmValTxt] = y.ParmValDetail;
							if (!keys[y.ParmValTxt]) {
								keys[y.ParmValTxt] = true;
							}
						});
					}
					dataRows.push(rowItem);
				});

				const exportData = {
					config: vm.currentConfig,
					filename: filename,
					rows: dataRows,
					headerKeys: keys
				};

				startAjaxRequest(vm.labels.ABJX_Ajax_Export);
				jxAdminConfigDataService
					.exportToCsv(exportData)
					.then(function (response) {
						vm.currentConfig = response;
						endAjaxRequest();

						if (vm.currentConfig.isSuccessful !== true) {
							showErrorToast(vm.labels.ABJX_Error, vm.currentConfig.message);
						} else {
							var link = document.createElement('a');
							if (link.download !== undefined) {
								// feature detection
								// Browsers that support HTML5 download attribute
								var url =
									'/servlet/servlet.FileDownload?file=' +
									vm.currentConfig.searchHeader.exportAttachmentId;
								link.setAttribute('href', url);
								link.setAttribute('download', vm.currentConfig.inquiryParmName + '.csv');
								link.setAttribute('target', '_blank');
								link.style.visibility = 'hidden';
								document.body.appendChild(link);
								link.click();
								document.body.removeChild(link);
							}
						}
					})
					.catch(function (err) {
						handlePromiseError(err);
					});
			} catch (e) {
				handlePromiseError(e.message);
			}
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
