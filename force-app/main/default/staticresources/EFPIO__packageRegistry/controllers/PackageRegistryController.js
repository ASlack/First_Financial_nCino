(function(){
	'use strict';

	angular.module('packageRegistry')
		.controller('packageRegistryController',['$rootScope','$scope', '$location', '$sce', 'label', 'config', 'packageRegistryDataService', 'spinnerSharedService',
   
	    function($rootScope, $scope, $location, $sce, label, config, packageRegistryDataService, spinnerSharedService){
	    	
	        var vm = this;
	        
	        vm.classNS = config.get().classNS;
	        vm.sObjectNS = config.get().sObjectNS;
			vm.orchestrationIsActive = config.get().orchestrationIsActive;
			vm.hasViewAccess = config.get().hasViewAccess;
			vm.init = init;
			
			vm.showSpinner = false;
			vm.spinnerGraphic = '';
			vm.spinnerMessage = '';
			
			vm.init();
			
			function init() {
			}
			
			
			$scope.$watch(
	            function watchIsExpanded( scope ) {
	                // Return the "result" of the watch expression.
	                return( spinnerSharedService.getSpinnerState().showSpinner );
	            },
	            function handleIsExpanded( newValue, oldValue ) {
	            	if(newValue===false){
	            		//clean the DOM
	            		vm.showSpinner = false;
						
	            	}else{
	            		//trigger child render pulls
	            		var state = spinnerSharedService.getSpinnerState();
	            		vm.showSpinner = spinnerSharedService.getSpinnerState().showSpinner;
						vm.spinnerGraphic = spinnerSharedService.getSpinnerState().spinnerGraphic;
						vm.spinnerMessage = spinnerSharedService.getSpinnerState().spinnerMessage;
	            	}
	            	//console.log('showSpinner state = ' + newValue);
	            }
	        );
			
			
	    }
	   
   ]);
   
})();