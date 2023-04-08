(function(){
	'use strict';

	angular.module('packageRegistry').component('dashboard', {
	    bindings: {
	        dashboard: '@'
        },
	    controllerAs: 'vm',
	    controller: function($rootScope, $scope, config, label, packageRegistryDataService, spinnerSharedService) {
            
            var vm = this;
            vm.labels = label.getLabels();
	        
	        vm.classNS = config.get().classNS;
	        vm.sObjectNS = config.get().sObjectNS;
			vm.orchestrationIsActive = config.get().orchestrationIsActive;
			vm.hasViewAccess = config.get().hasViewAccess;
			
			vm.getPackages = getPackages;
			vm.toggleSpinner = toggleSpinner;
			
			vm.registeredPackages = [];
			vm.registeredPackagesCount = 0;
			
			vm.$onInit = function() {
                vm.getPackages();
            }
			
			function toggleSpinner(){
				if(spinnerSharedService.getSpinnerState().showSpinner===false){
					spinnerSharedService.setSpinnerState(true, vm.labels.loadingServicePropertiesMessage);
				}else{
					spinnerSharedService.setSpinnerState(false, null);
				}
			}
			
			function getPackages(){
				//reset
				reset();
				
				spinnerSharedService.setSpinnerState(true, vm.labels.loadingMessage);
				
			    // vm.showSpinner = true;
			    packageRegistryDataService.getRegisteredPackages().then(function(response) {
					// vm.showSpinner = false;
					vm.registeredPackages = JSON.parse(response);
				    vm.registeredPackagesCount = vm.registeredPackages.length;
				    spinnerSharedService.setSpinnerState(false,null);
				});
			}
			
			function reset(){
				vm.registeredPackages = [];
				vm.registeredPackagesCount = 0;
				// vm.showSpinner = false;
				spinnerSharedService.setSpinnerState(false,null);
			}
			
			
        },
	    templateUrl: function(config){
	        return config.get().templates.dashboardView
	    }
    });

    
})();