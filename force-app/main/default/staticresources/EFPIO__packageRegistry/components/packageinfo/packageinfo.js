(function(){
	'use strict';

	angular.module('packageRegistry').component('packageinfo', {
	    bindings: {
			data: '<',
			index: '@'
		},
		controllerAs: 'vm',
        controller: function($rootScope, $scope, config, label, $compile, packageRegistryDataService, spinnerSharedService) {
        	
        	var vm = this;
        	
        	vm.labels = label.getLabels();
			
			// vm.UniqueId = '';				
			// vm.Name = '';
			// vm.Description = '';
			// vm.Namespace = '';
			// vm.PluginVersion = '';
			// vm.PlmVersion = '';
			// vm.LogStorageSObject = '';
			// vm.LogStorageSObjectListViewUrl = '';
			// vm.XPkgServicesCount = 0;

        	vm.ServicesLoaded = false;
        	
        	vm.isExpanded = false; //default to hidden
        	
        	vm.XPkgServices = [];
        	
        	vm.togglePackageVisibility = togglePackageVisibility;
        	vm.togglePackageServiceVisibility = togglePackageServiceVisibility;
			
			vm.$onInit = function() {
                
            }
        	
        	function togglePackageVisibility(){
        		if(vm.isExpanded === false){
        		    loadServices();
        			vm.isExpanded = true;
        		}else{
        			vm.isExpanded = false;
        		}
        	}
        	
        	function togglePackageServiceVisibility(index){
        		if(vm.XPkgServices[index].isExpanded === false){
        			loadServiceInfo(index);
        			vm.XPkgServices[index].isExpanded = true;
        		}else{
        			vm.XPkgServices[index].isExpanded = false;
        		}
        	}
        	
        	function loadServices(){
        	    
        	    if(vm.ServicesLoaded === false){
            	    // perform a service call to get the services for this one
                    // $scope.$parent.vm.showSpinner = true;
                    
                    spinnerSharedService.setSpinnerState(true, vm.labels.loadingServicesMessage);
                    
                    packageRegistryDataService.getRegisteredPackageServices(vm.data.Name).then(function(response) {
                        // $scope.$parent.vm.showSpinner = false;
                        var objs = JSON.parse(response);
                        for(var idx = 0; idx < objs.length; idx++){
                            var newItem = objs[idx];
                            newItem.isExpanded = false; //inject to the viewmodel
                            newItem.ServiceInfoLoaded = false; //inject to the viewmodel
                            vm.XPkgServices.push(newItem);
                        }
                        vm.ServicesLoaded = true;
                        spinnerSharedService.setSpinnerState(false,null);
                    });
        	    }
        	}
        	
        	function loadServiceInfo(idx){
        	    
        	    if(vm.XPkgServices[idx].ServiceInfoLoaded === false){
        	        // perform a service call to get the services for this one
                    // $scope.$parent.vm.showSpinner = true;
                    spinnerSharedService.setSpinnerState(true, vm.labels.loadingServicePropertiesMessage);
                    
                    //INPUT fields first
                    packageRegistryDataService.getRegisteredPackageServiceParameters(vm.data.Name,vm.XPkgServices[idx].Name,'INPUT').then(function(response1) {
                        
                        vm.XPkgServices[idx].InputParameters = JSON.parse(response1);
                        
                        //output fields last
                        packageRegistryDataService.getRegisteredPackageServiceParameters(vm.data.Name,vm.XPkgServices[idx].Name,'OUTPUT').then(function(response2) {
                            vm.XPkgServices[idx].OutputParameters = JSON.parse(response2);
                            // $scope.$parent.vm.showSpinner = false;
                            vm.XPkgServices[idx].ServiceInfoLoaded = true;
                            spinnerSharedService.setSpinnerState(false,null);
                        });
                
                    });
        	    }
        	}
        	
        },
	    templateUrl: function(config){
	        return config.get().templates.packageinfoView
	    }
    });

    
})();